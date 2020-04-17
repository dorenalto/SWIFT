//
//  HeroesListViewTests.swift
//  MarvelTests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

@testable import Marvel
import XCTest

class HeroesListViewTests: XCTestCase {
    var view: HeroesListView?

    override func setUp() {
        super.setUp()
        view = HeroesListView()
    }

    override func tearDown() {
        view = nil
        super.tearDown()
    }

    func testConfigurationOnViewModelDidSet() {
        let viewModel = HeroesListViewModel()
        view?.viewModelDelegate = viewModel

        XCTAssert(viewModel.viewDelegate is HeroesListView)
        XCTAssert(view?.viewModelDelegate is HeroesListViewModel)
    }

    func testSetupView() {
        let placeHolderText = "HeroesList.searchbar.placeholder".localized
        XCTAssertEqual(view?.searchBar.placeholder, placeHolderText)
    }
}
