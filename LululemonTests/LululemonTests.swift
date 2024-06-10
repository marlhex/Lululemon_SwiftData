//
//  LululemonTests.swift
//  LululemonTests
//
//  Created by Ignacio Arias on 2024-04-15.
//

import XCTest
import SwiftUI
import SwiftData
@testable import Lululemon

class ContentViewTests: XCTestCase {
    func testContentViewInitialization() {
        let contentView = ContentView()
        XCTAssertNotNil(contentView)
    }
}

class AddGarmentViewTests: XCTestCase {
    func testAddGarmentViewInitialization() {
        let isPresented = Binding<Bool>.constant(true)
        let addGarmentView = AddGarmentView(isPresented: isPresented)
        XCTAssertNotNil(addGarmentView)
    }
}

class SortFunctionalityTests: XCTestCase {

    // Array of garments to be used in tests
    var garments: [Garment]!

    override func setUp() {
        super.setUp()
        // Initialize your test data
        garments = [
            Garment(name: "T-shirt", creationTime: Date(timeIntervalSinceNow: -86400)), // 1 day ago
            Garment(name: "Sweater", creationTime: Date()),
            Garment(name: "Jacket", creationTime: Date(timeIntervalSinceNow: -432000)) // 5 days ago
        ]
    }

    override func tearDown() {
        garments = nil
        super.tearDown()
    }

    func testSortingByName() {
        let sortedByName = garments.sorted { $0.name < $1.name }
        let expectedOrder = ["Jacket", "Sweater", "T-shirt"]
        XCTAssertEqual(sortedByName.map { $0.name }, expectedOrder, "Garments should be sorted alphabetically by name.")
    }

    func testSortingByCreationTime() {
        let sortedByCreationTime = garments.sorted { $0.creationTime > $1.creationTime }
        // Fetch the garment with the newest creation time, not the oldest.
        let expectedFirst = garments.max(by: { $0.creationTime < $1.creationTime })?.name
        XCTAssertEqual(sortedByCreationTime.first?.name, expectedFirst, "Garments should be sorted by newest first based on creation time.")
    }

    func testSortingEmptyList() {
        let emptyGarments: [Garment] = []
        let sortedByName = emptyGarments.sorted { $0.name < $1.name }
        XCTAssertTrue(sortedByName.isEmpty, "Sorting an empty list should result in an empty list.")
    }


}

