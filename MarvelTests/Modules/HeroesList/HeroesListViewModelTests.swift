//
//  HeroesListViewModelTests.swift
//  MarvelTests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

@testable import Marvel
import XCTest

class HeroesListViewModelTests: XCTestCase {
    var viewModel: HeroesListViewModel?

    override func setUp() {
        super.setUp()
        viewModel = HeroesListViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testShouldShowInfinitLoading() {
        guard let viewModel = viewModel else {
            return XCTFail()
        }

        XCTAssertFalse(viewModel.shouldShowInfinitLoading)

        viewModel.offset = 1
        let character = Character()
        viewModel.handleFetchHeroes([character])
        XCTAssert(viewModel.shouldShowInfinitLoading)

        viewModel.offset = 0
        XCTAssertFalse(viewModel.shouldShowInfinitLoading)
    }

    func testResetListData() {
        viewModel?.offset = 20
        XCTAssertEqual(viewModel?.offset, 20)

        let character = Character()
        viewModel?.handleFetchHeroes([character])
        XCTAssertEqual(viewModel?.characters?.count, 1)

        viewModel?.resetListData()
        XCTAssertEqual(viewModel?.offset, 0)
        XCTAssertNil(viewModel?.characters)
    }

    func testTotalHeroesLoaded() {
        guard let viewModel = viewModel else {
            return XCTFail()
        }

        viewModel.offset = 0
        XCTAssertEqual(viewModel.totalHeroesLoaded(), 20)
        viewModel.offset = 20
        XCTAssertEqual(viewModel.totalHeroesLoaded(), 40)
    }

    func testShowLoading() {
        let delegate = MockHeroesListViewDelegate()
        viewModel?.set(view: delegate)
        viewModel?.offset = 1
        viewModel?.fetchHeroesBy(name: "")
        XCTAssert(delegate.didCalledLoading)

        viewModel?.handleFetchHeroes(nil)
        XCTAssertFalse(delegate.didCalledLoading)
    }

    func testHideLoading() {
        let delegate = MockHeroesListViewDelegate()
        viewModel?.set(view: delegate)
        viewModel?.handleFetchHeroes(error: .invalidData)
        XCTAssertFalse(delegate.didCalledLoading)
        XCTAssertFalse(delegate.didCalledShowInfinitLoading)
        XCTAssert(delegate.didCalledStopRefreshLoading)
    }

    func testShowInfinitLoading() {
        guard let viewModel = viewModel else {
            return XCTFail()
        }

        let delegate = MockHeroesListViewDelegate()
        viewModel.set(view: delegate)

        viewModel.offset = 1
        let character = Character()
        viewModel.handleFetchHeroes([character])

        XCTAssert(viewModel.shouldShowInfinitLoading)
        viewModel.fetchHeroesBy(name: "")
        XCTAssert(delegate.didCalledShowInfinitLoading)
    }

    func testRefreshHeroesList() {
        guard let viewModel = viewModel else {
            return XCTFail()
        }

        let delegate = MockHeroesListViewDelegate()
        viewModel.set(view: delegate)

        viewModel.offset = 1
        viewModel.characters = []

        viewModel.refreshHeroesList()

        XCTAssert(delegate.didCalledLoading)
        XCTAssertEqual(viewModel.offset, 0)
        XCTAssertNil(viewModel.characters)
        XCTAssertFalse(viewModel.shouldShowInfinitLoading)
    }

    func testReloadTableView() {
        let delegate = MockHeroesListViewDelegate()
        viewModel?.set(view: delegate)
        viewModel?.handleFetchHeroes(nil)
        XCTAssert(delegate.didCalledReloadTableView)
    }

    func testCharacterService() {
        let service = MockCharacterService()
        viewModel = HeroesListViewModel(service: service)
        XCTAssertFalse(service.didCallGetHeroes)

        viewModel?.fetchHeroesBy(name: "Thanos")
        XCTAssert(service.didCallGetHeroes)

        let expectedLimit = 20
        XCTAssertEqual(service.passedLimitParam, expectedLimit)

        let expectedOffset = 0
        XCTAssertEqual(service.passedOffsetParam, expectedOffset)

        let expectedQuery = "Thanos"
        XCTAssertEqual(service.passedQueryParam, expectedQuery)
    }
}

private final class MockCharacterService: CharacterServiceProtocol {
    var didCallGetHeroes = false
    var passedLimitParam = 0
    var passedOffsetParam = 0
    var passedQueryParam: String? = ""

    func fetchHeroes(limit: Int, offset: Int, query: String?, completion _: @escaping GetHeroesListHandler) {
        didCallGetHeroes = true
        passedLimitParam = limit
        passedOffsetParam = offset
        passedQueryParam = query
    }
}

private final class MockHeroesListViewDelegate: HeroesListViewDelegate {
    var didCalledLoading = false
    var didCalledStopRefreshLoading = false
    var didCalledShowInfinitLoading = false
    var didCalledReloadTableView = false

    func loading(_ show: Bool) {
        didCalledLoading = show
    }

    func stopRefreshLoading() {
        didCalledStopRefreshLoading = true
    }

    func showInfinitLoading(_ show: Bool) {
        didCalledShowInfinitLoading = show
    }

    func reloadTableView() {
        didCalledReloadTableView = true
    }
}
