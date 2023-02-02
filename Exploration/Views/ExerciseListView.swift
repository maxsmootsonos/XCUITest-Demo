//
//  ExerciseList.swift
//  Exploration
//
//  Created by Max Smoot on 1/23/23.
//

import SwiftUI

struct ExerciseListView: View {
    @ObservedObject var workoutData: WorkoutViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        List(AvailableExercises, id: \.name) { exerciseType in
            Button(action: {
                workoutData.addExercise(ofType: exerciseType)
                dismiss()
            }, label: {

                HStack {
                    Text(exerciseType.name)
                    Spacer()
                    Image(exerciseType.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
            })
            .accessibilityIdentifier("\(exerciseType.name)")
        }
        .navigationTitle("Choose an Exercise")
    }
}

struct ExerciseList_Previews: PreviewProvider {
    @State static var workoutData: WorkoutViewModel = WorkoutViewModel(exerciseViewModels: [])
    static var previews: some View {
        ExerciseListView(workoutData: workoutData)
    }
}
