//
//  HeroesListUITests.swift
//  MarvelUITests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import XCTest

class HeroesListUITests: BaseUITest {
    override func setUp() {
        super.setUp()
        app.launch()
    }

    func testInteractAndCheckElements() {
        XCTContext.runActivity(named: "Verifying if 'Search Bar' screen is visible") { _ in
            let searchFields = app.searchFields["Search by name"]
            wait(element: searchFields, duration: timeoutDuration) { _ in
                XCTAssert(searchFields.exists)
                XCTAssert(searchFields.isHittable)
                XCTAssert(searchFields.isEnabled)
            }
        }

        XCTContext.runActivity(named: "Verifying if 'All Projects' screen is visible") { _ in
            let navigationElement = app.navigationBars["Super Heroes"]
            wait(element: navigationElement, duration: timeoutDuration) { _ in
                XCTAssert(navigationElement.exists)
                XCTAssert(navigationElement.isHittable)
                XCTAssert(navigationElement.isEnabled)
            }
        }

        XCTContext.runActivity(named: "Verifying if character table view is visible") { _ in
            let table = app.tables[AccessibilityIdentifiers.characterListTableView]

            wait(element: table, duration: timeoutDuration) { _ in
                XCTAssert(table.exists)
                XCTAssert(table.isHittable)
                XCTAssert(table.isEnabled)
                XCTAssertTrue(table.scrollBars.cells.count > 0)
            }

            let start = table.cells.firstMatch.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
            let finish = table.cells.firstMatch.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 3))
            start.press(forDuration: 0, thenDragTo: finish)

            table.swipeUp()
        }
    }
}
