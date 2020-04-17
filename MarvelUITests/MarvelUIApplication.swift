//
//  MarvelUIApplication.swift
//  MarvelUITests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import XCTest

class MarvelUIApplication: XCUIApplication {
    override init() {
        super.init()
        launchArguments.append("-FNTesting")
    }
}
