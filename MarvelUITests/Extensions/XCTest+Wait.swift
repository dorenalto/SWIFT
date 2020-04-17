//
//  XCTest+Wait.swift
//  MarvelUITests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import XCTest

extension XCTestCase {
    func wait(element: XCUIElement, duration: TimeInterval, handler: @escaping (Error?) -> Void) {
        let exists = NSPredicate(format: "exists == true")

        expectation(for: exists, evaluatedWith: element) { () -> Bool in
            print("found it! 💪")
            return true
        }

        waitForExpectations(timeout: duration) { error in
            if let notFoundError = error {
                handler(notFoundError)
            }
        }
    }
}
