//
//  ExerciseDetail.swift
//  Exploration
//
//  Created by Max Smoot on 1/23/23.
//

import SwiftUI

struct ExerciseDetailView: View {
    @ObservedObject var data: ExerciseDetailViewModel

    var body: some View {
        VStack{
            Text(data.name)
                .font(.title)
                .accessibilityIdentifier("ExerciseDetailView Title")
            Text("Sets")
                .font(.title2)
                .frame(width: 300, alignment: .leading)
                .padding(10)
            List {
                ForEach($data.sets) { exerciseSet in

                    HStack {
                        TextField("0 lbs", text: exerciseSet.weight).keyboardType(.numberPad)
                            .accessibilityIdentifier("weight")
                        Divider()
                        TextField("0 reps", text: exerciseSet.reps).keyboardType(.numberPad)

                    }
                }
                .onDelete(perform: data.deleteSet)
            }

            Button() {
                data.addSet()
            } label: {
                Image(systemName:"plus.app")
                    .resizable()
                    .scaledToFit()
                    .frame(width:20)
            }
            .accessibilityIdentifier("Add Set")
            Spacer()
            Image(data.image)
                .resizable()
                .scaledToFit()
        }

    }
}

struct ExerciseDetail_Previews: PreviewProvider {
    static var exerciseModel: ExerciseDetailViewModel = ExerciseDetailViewModel(of: [BenchPress()] as! ExerciseType)
    static var previews: some View {
        ExerciseDetailView(data: exerciseModel)
    }
}
