//
//  ExerciseDetail.swift
//  Exploration
//
//  Created by Max Smoot on 1/23/23.
//

import SwiftUI

struct ExerciseDetail: View {
    var exerciseIdx: Int
    @EnvironmentObject var workoutData: WorkoutData

    //Computed data value that returns the binding for the exercise in the list of Exercises
    // in the workout
    var data: Binding<any Exercise> {
        return $workoutData.exercises[exerciseIdx]
    }

    // removes a row of the set
    func removeRows(at offsets: IndexSet) {
        data.sets.wrappedValue.remove(atOffsets: offsets)
    }

    var body: some View {
        VStack{
            Text(data.wrappedValue.name)
                .font(.title)
            Text("Sets")
                .font(.title2)
                .frame(width: 300, alignment: .leading)
                .padding(10)
            List {
                ForEach(data.sets.indices, id: \.self) { setIdx in

                    HStack {
                        TextField("0 lbs", text: data.sets[setIdx].weight).keyboardType(.numberPad)
                        Divider()
                        TextField("0 reps", text: data.sets[setIdx].reps).keyboardType(.numberPad)

                    }
                }
                .onDelete(perform: removeRows)
            }

            Button() {
                workoutData.exercises[exerciseIdx].sets.append(Sets(weight: "0 lbs", reps: "0 reps"))
            } label: {
                Image(systemName:"plus.app")
                    .resizable()
                    .scaledToFit()
                    .frame(width:20)
            }
            Spacer()
            Image(data.wrappedValue.image)
                .resizable()
                .scaledToFit()
        }

    }
}

struct ExerciseDetail_Previews: PreviewProvider {
    static var workoutData = WorkoutData(exercises: [BenchPress()])
    static var previews: some View {
        ExerciseDetail(exerciseIdx: 0)
            .environmentObject(workoutData)
    }
}
