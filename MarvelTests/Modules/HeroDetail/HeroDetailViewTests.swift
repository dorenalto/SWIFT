//
//  HeroDetailViewTests.swift
//  MarvelTests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

@testable import Marvel
import XCTest

class HeroDetailViewTests: XCTestCase {
    var view: HeroDetailView?

    override func setUp() {
        super.setUp()
        view = HeroDetailView()
    }

    override func tearDown() {
        view = nil
        super.tearDown()
    }

    func testConfigurationOnViewModelDidSet() {
        let character = Character()
        let viewModel = HeroDetailViewModel(character: character)
        view?.viewModelDelegate = viewModel

        XCTAssert(viewModel.viewDelegate is HeroDetailView)
        XCTAssert(view?.viewModelDelegate is HeroDetailViewModel)
    }

    func testViewDidLoad() {
        let characterName = "BRUNO RAMOS"
        view?.setButtonName(characterName)
        let submitButtonTitle = "\("HeroesDetail.submitButton.title".localized) \(characterName)"
        XCTAssertEqual(view?.submitButton.currentTitle, submitButtonTitle)
    }
}
