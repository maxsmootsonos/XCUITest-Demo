//
//  Exercises.swift
//  Exploration
//
//  Created by Max Smoot on 1/23/23.
//

import Foundation
import SwiftUI

let Exercises: [String:Exercise.Type] = ["Bench Press":BenchPress.self, "Barbell Squat":Squat.self]

final class WorkoutData: ObservableObject {
    @Published var exercises: [Exercise]
    init(exercises: [Exercise]) {
        self.exercises = exercises
    }
}



struct Sets: Hashable {
    var weight: String
    var reps: String
}


protocol Exercise {
    var sets: [Sets] {get set}
    var image: String {get}
    var name: String {get set}
    var id: String {get}
    init()
}

struct BenchPress : Exercise {
    var name = "Bench Press"
    var image: String = "benchpress"
    var sets: [Sets] = []
    var id: String
    init() {
        id = String(Date().description)
    }




}
struct Squat : Exercise {
    var name = "Barbell Squat"
    var sets: [Sets] = []
    var image: String = "squat"
    var id: String
    init() {
        id = String(Date().description)
    }
}

