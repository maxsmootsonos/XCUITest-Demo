//
//  ExerciseDetailView_UITests.swift
//  ExplorationUITests
//
//  Created by Max Smoot on 1/27/23.
//

import XCTest

final class ExerciseDetailView_UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddSet() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        //clicking add exercise button should take us to ExerciseListView
        app.buttons["Add Exercise Button"].tap()
        //add bench press to workout
        app.buttons["Bench Press"].tap()
        //go to ExerciseDetailView
        app.buttons["Bench Press"].tap()
        //add a set
        app.buttons["Add Set"].tap()
        XCTAssertTrue(app.textFields["weight"].exists, "Clicking the add set button should add a set to the list")
    }

    func testRemoveSet() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        //clicking add exercise button should take us to ExerciseListView
        app.buttons["Add Exercise Button"].tap()
        //add bench press to workout
        app.buttons["Bench Press"].tap()
        //go to ExerciseDetailView
        app.buttons["Bench Press"].tap()
        //add a set
        app.buttons["Add Set"].tap()
        app.textFields["weight"].swipeLeft()
        app.buttons["Delete"].tap()
        XCTAssertFalse(app.textFields["weight"].exists)
    }

}
