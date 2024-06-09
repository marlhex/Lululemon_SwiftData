//
//  LululemonUITestsLaunchTests.swift
//  LululemonUITests
//
//  Created by Ignacio Arias on 2024-04-15.
//

import XCTest

final class LululemonUITestsLaunchTests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        let app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }

    func testAddPlusButton() throws {
        XCUIApplication().navigationBars["List"]/*@START_MENU_TOKEN@*/.buttons["Add"]/*[[".otherElements[\"Add\"].buttons[\"Add\"]",".buttons[\"Add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
}
