//
//  Exercises.swift
//  Exploration
//
//  Created by Max Smoot on 1/23/23.
//

import Foundation
import SwiftUI

let AvailableExercises: [ExerciseType] = [BenchPress(), Squat(), Chinup()]


// Will be passed as an environment object
    final class WorkoutViewModel: ObservableObject {
        @Published var exerciseViewModels: [ExerciseDetailViewModel]

        func removeExercise(_ offsets: IndexSet) -> Void {
            exerciseViewModels.remove(atOffsets: offsets)
        }

        func addExercise(ofType exerciseType: ExerciseType) {
            exerciseViewModels.append(ExerciseDetailViewModel(of: exerciseType))
        }

        init(exerciseViewModels: [ExerciseDetailViewModel]) {
            self.exerciseViewModels = exerciseViewModels
        }
    }





struct BenchPress : ExerciseType {
    var image = "benchpress"
    var name = "Bench Press"
}

struct Squat: ExerciseType {
    var image = "squat"
    var name = "Squat"
}

struct Chinup: ExerciseType {
    var name = "Chin up"
    var image =  "chinup"
}
