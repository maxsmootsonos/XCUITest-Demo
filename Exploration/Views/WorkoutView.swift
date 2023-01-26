//
//  Workout.swift
//  Exploration
//
//  Created by Max Smoot on 1/23/23.
//

import SwiftUI

struct WorkoutView: View {
    @ObservedObject var workoutData: WorkoutViewModel = WorkoutViewModel(exerciseViewModels: [])

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(workoutData.exerciseViewModels) {
                        exerciseViewModel in
                        NavigationLink{
                            ExerciseDetailView(data:exerciseViewModel)
                        } label:{
                                Text(exerciseViewModel.name)
                        }
                    }
                    .onDelete(perform: workoutData.removeExercise)
                }
                NavigationLink {
                    ExerciseListView(workoutData: workoutData )
                } label : {
                    Text("Add Exercise")
                }

            }
            .navigationTitle("Workout")
        }
        .accessibilityLabel("Workout NavigationView")
    }
}

struct Workout_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
