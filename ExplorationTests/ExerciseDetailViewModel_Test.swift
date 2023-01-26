//
//  ExerciseDetailViewModel_Test.swift
//  ExplorationTests
//
//  Created by Max Smoot on 1/26/23.
//

import XCTest

final class ExerciseDetailViewModel_Test: XCTestCase {
    var exerciseDetailViewModel: ExerciseDetailViewModel?

    override func setUpWithError() throws {
        //intialize with first available exercise
        exerciseDetailViewModel = ExerciseDetailViewModel(of: AvailableExercises.first!)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddSet() throws {
        // Tests adding a set to the exercise

        exerciseDetailViewModel?.addSet()
        XCTAssertFalse(exerciseDetailViewModel?.sets.isEmpty ?? true)
    }

    func testRemoveSet() throws {
        exerciseDetailViewModel?.addSet()
        let firstSet = exerciseDetailViewModel?.sets[0]
        exerciseDetailViewModel?.addSet()
        exerciseDetailViewModel?.addSet()
        let thirdSet = exerciseDetailViewModel?.sets[2]

        //delete middle set
        exerciseDetailViewModel?.deleteSet(IndexSet([1]))
        XCTAssertTrue(exerciseDetailViewModel?.sets[0] == firstSet, "Since the second set was removed, the first set in the list should be unchanged")
        XCTAssertTrue(exerciseDetailViewModel?.sets[1] == thirdSet, "Since the second set was deleted, the third set should now be second in the list")
    }

}
