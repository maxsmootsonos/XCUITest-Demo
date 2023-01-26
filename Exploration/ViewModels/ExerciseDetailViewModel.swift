//
//  ExerciseDetailViewModel.swift
//  Exploration
//
//  Created by Max Smoot on 1/26/23.
//

import Foundation

final class ExerciseDetailViewModel: Identifiable, ObservableObject {
    @Published var sets: [Sets] = []
    var image: String = ""
    var name: String = ""

    func addSet() -> Void {
        sets.append(Sets(weight: "0lbs", reps: "0"))
    }

    func deleteSet(_ offsets: IndexSet) -> Void {
        sets.remove(atOffsets: offsets)
    }

    init(of exerciseType: ExerciseType) {
        self.sets = []
        self.image = exerciseType.image
        self.name = exerciseType.name
    }
}

struct Sets: Identifiable, Equatable {
    var weight: String
    var reps: String
    var id: UUID

    init(weight: String, reps: String) {
        self.weight = weight
        self.reps = reps
        id = UUID()
    }
}

protocol ExerciseType: Decodable {
    var image: String {get}
    var name: String {get}
}
