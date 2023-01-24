//
//  Workout.swift
//  Exploration
//
//  Created by Max Smoot on 1/23/23.
//

import SwiftUI

struct Workout: View {
    @EnvironmentObject var workoutData: WorkoutData

    // removes a row of the set
    // hackingSwift
    // https://www.hackingwithswift.com/books/ios-swiftui/deleting-items-using-ondelete
    func removeExercise(at offsets: IndexSet) {
        workoutData.exercises.remove(atOffsets: offsets)
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(workoutData.exercises.indices, id: \.self) {
                        idx in
                        NavigationLink{
                            ExerciseDetail(exerciseIdx: idx)
                        } label:{
                            HStack {
                                Text("\(workoutData.exercises[idx].name)")
                                Text("\(workoutData.exercises[idx].sets.count) sets")

                            }
                        }
                    }
                    .onDelete(perform: removeExercise)
                }
                NavigationLink {
                    ExerciseList()
                } label : {
                    Text("Add Exercise")
                }

            }
            .navigationTitle("Workout")
        }
    }
}

struct Workout_Previews: PreviewProvider {
    static var previews: some View {
        Workout()
            .environmentObject(WorkoutData(exercises: [BenchPress()]))
    }
}
