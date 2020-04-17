//
//  BaseUITests.swift
//  MarvelUITests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import XCTest

class BaseUITest: XCTestCase {
    let app: MarvelUIApplication = MarvelUIApplication()
    let timeoutDuration: TimeInterval = 10.0

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    override func tearDown() {
        super.tearDown()
    }
}
