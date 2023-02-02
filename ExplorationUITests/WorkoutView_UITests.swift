//
//  ExplorationUITests.swift
//  ExplorationUITests
//
//  Created by Max Smoot on 1/23/23.
//

import XCTest

final class WorkoutViewUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddExerciseButton() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        //clicking add exercise button should take us to ExerciseListView
        app.buttons["Add Exercise Button"].tap()
        print(app.navigationBars)
        XCTAssertTrue(app.navigationBars["Choose an Exercise"].exists)
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testAddExerciseToWorkout() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        //clicking add exercise button should take us to ExerciseListView
        app.buttons["Add Exercise Button"].tap()
        //add bench press to workout
        app.buttons["Bench Press"].tap()
        XCTAssertTrue(app.navigationBars["Workout"].exists, "Clciking an exercise should take the user back to the WorkoutView")
        XCTAssertTrue(app.buttons["Bench Press"].exists, "Tapping the Bench press exercise should take us back to WorkoutView with a Bench press exercise added to the list")
    }


    func testTapExercise() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        //clicking add exercise button should take us to ExerciseListView
        app.buttons["Add Exercise Button"].tap()
        //add bench press to workout
        app.buttons["Bench Press"].tap()
        app.buttons["Bench Press"].tap()
        XCTAssertTrue(app.staticTexts["ExerciseDetailView Title"].exists)
        
    }


}
