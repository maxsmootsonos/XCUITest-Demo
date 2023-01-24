//
//  ContentView.swift
//  Exploration
//
//  Created by Max Smoot on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var workoutData: WorkoutData
    var body: some View {
        Workout()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WorkoutData(exercises: []))
    }
}
