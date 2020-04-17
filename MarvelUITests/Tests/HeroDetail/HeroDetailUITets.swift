//
//  HeroDetailUITets.swift
//  MarvelUITests
//
//  Created by Dorenalto Mangueira Couto on 16/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import XCTest

class HeroDetailUITets: BaseUITest {
    override func setUp() {
        super.setUp()
        app.launch()
    }

    func testInteractAndCheckElements() {
        XCTContext.runActivity(named: "Verifying if 'Super Heroes' screen is visible") { _ in
            let navigationElement = app.navigationBars["Super Heroes"]
            wait(element: navigationElement, duration: timeoutDuration) { _ in
                XCTAssert(navigationElement.exists)
                XCTAssert(navigationElement.isHittable)
                XCTAssert(navigationElement.isEnabled)
            }
        }

        XCTContext.runActivity(named: "Verifying if 'Super Hero List' table view is visible") { _ in
            let table = app.tables[AccessibilityIdentifiers.characterListTableView]
            wait(element: table, duration: timeoutDuration) { _ in
                XCTAssert(table.exists)
                XCTAssert(table.isHittable)
                XCTAssert(table.isEnabled)
                XCTAssertTrue(table.scrollBars.cells.count > 0)
            }

            table.swipeUp()
            table.swipeDown()
            table.cells.allElementsBoundByIndex.first?.tap()
        }

        XCTContext.runActivity(named: "Verifying if 'Hero Detail' screen is visible") { _ in
            let table = app.tables[AccessibilityIdentifiers.characterDetailTableView]
            wait(element: table, duration: timeoutDuration) { _ in
                XCTAssert(table.exists)
                XCTAssert(table.isHittable)
                XCTAssert(table.isEnabled)
            }
        }

        XCTContext.runActivity(named: "Verifying if 'Submit Button' screen is visible") { _ in
            let button = app.buttons[AccessibilityIdentifiers.characterDetailSubmitButton]
            wait(element: button, duration: timeoutDuration) { _ in
                XCTAssert(button.exists)
                XCTAssert(button.isHittable)
                XCTAssert(button.isEnabled)
            }

            button.tap()
        }

        XCTContext.runActivity(named: "Verifying if 'Super Heroes' screen is visible again") { _ in
            let navigationElement = app.navigationBars["Super Heroes"]
            wait(element: navigationElement, duration: timeoutDuration) { _ in
                XCTAssert(navigationElement.exists)
                XCTAssert(navigationElement.isHittable)
                XCTAssert(navigationElement.isEnabled)
            }
        }
    }
}
