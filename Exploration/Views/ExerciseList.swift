//
//  ExerciseList.swift
//  Exploration
//
//  Created by Max Smoot on 1/23/23.
//

import SwiftUI

struct ExerciseList: View {
    @EnvironmentObject var workoutData: WorkoutData

    @Environment(\.dismiss) var dismiss
    var body: some View {
        List(Array(Exercises.keys), id: \.self) { key in
            Button(action: {
                workoutData.exercises.append(Exercises[key]!.init())
                dismiss()
            }, label: {

                HStack {
                    Text(key)
                    Spacer()
                    Image(Exercises[key]!.init().image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
            })
        }
    }
}

struct ExerciseList_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseList()
            .environmentObject(WorkoutData(exercises: [BenchPress()]))
    }
}
