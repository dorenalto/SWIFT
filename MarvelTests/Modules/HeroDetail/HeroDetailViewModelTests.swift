//
//  HeroDetailViewModelTests.swift
//  MarvelTests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

@testable import Marvel
import XCTest

class HeroDetailViewModelTests: XCTestCase {
    var viewModel: HeroDetailViewModel?

    override func setUp() {
        super.setUp()
        let character = Character()
        character.name = "Bruno Ramos"
        viewModel = HeroDetailViewModel(character: character)
    }

    func testButtonName() {
        let delegate = MockHeroDetailViewDelegate()
        viewModel?.set(view: delegate)
        viewModel?.viewDidLoad()
        XCTAssertNotNil(delegate.buttonNameText)
        XCTAssertEqual(delegate.buttonNameText, "BRUNO RAMOS")
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
}

class MockHeroDetailViewDelegate: HeroDetailViewDelegate {
    var buttonNameText: String?

    func setButtonName(_ name: String) {
        buttonNameText = name
    }
}
