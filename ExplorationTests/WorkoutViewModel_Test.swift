//
//  WorkoutViewModel_Test.swift
//  ExplorationTests
//
//  Created by Max Smoot on 1/26/23.
//

import XCTest

final class WorkoutViewModel_Test: XCTestCase {
    var viewModelInstance: WorkoutViewModel?

    override func setUpWithError() throws {
        viewModelInstance = WorkoutViewModel(exerciseViewModels: [])


    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddExercise() throws{
        //Add first available exercise from ExerciseList view
        viewModelInstance?.addExercise(ofType: AvailableExercises.first!)

        //check to make sure exerciseViewModels isn't empty
        XCTAssertFalse(viewModelInstance?.exerciseViewModels.isEmpty ?? true)
    }

    func testRemoveExercise() throws{
        // add three exercises
        // store references
        viewModelInstance?.addExercise(ofType: AvailableExercises.first!)
        let firstExercise = viewModelInstance?.exerciseViewModels[0]
        viewModelInstance?.addExercise(ofType: AvailableExercises.first!)
        viewModelInstance?.addExercise(ofType: AvailableExercises.first!)
        let thirdExercise = viewModelInstance?.exerciseViewModels[2]

        //delete the middle exercise
        viewModelInstance?.removeExercise(IndexSet([1]))

        XCTAssertTrue(firstExercise === viewModelInstance?.exerciseViewModels[0], "The first exercise in the list should remain the same when deleting the second exercise")
        XCTAssertTrue(thirdExercise === viewModelInstance?.exerciseViewModels[1], "The second exercise in the list should be the third exercise in the original list since we deleted exercise #2")

    }

    

}
