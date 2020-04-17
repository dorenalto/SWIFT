//
//  MainCoordinatorTests.swift
//  MarvelTests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

@testable import Marvel
import XCTest

class MainCoordinatorTests: XCTestCase {
    var window: UIWindow?
    var navigationController: MockUINavigationController?

    override func setUp() {
        super.setUp()
        window = UIWindow()
        navigationController = MockUINavigationController()
    }

    override func tearDown() {
        window = nil
        navigationController = nil
        super.tearDown()
    }

    func testPresentingViewController() {
        guard let window = window,
            let navigationController = navigationController else {
            return XCTFail()
        }

        let coordinator = MainCoordinator(window: window, navigationController: navigationController)
        coordinator.start(animated: false)
        let viewControllerToPresent = navigationController.viewControllerToPush as? HeroesListViewController
        XCTAssertNotNil(viewControllerToPresent)

        XCTAssert(coordinator.currentCoordinator is HeroesListCoordinator)
    }

    func testStartHeroesListCoordinator() {
        guard let window = window,
            let navigationController = navigationController else {
            return XCTFail()
        }

        let coordinator = MainCoordinator(window: window, navigationController: navigationController)
        coordinator.startHeroesListCoordinator()
        let viewControllerToPresent = navigationController.viewControllerToPush as? HeroesListViewController
        XCTAssertNotNil(viewControllerToPresent)

        XCTAssert(coordinator.currentCoordinator is HeroesListCoordinator)
    }

    func testStartHeroDetailCoordinator() {
        guard let window = window,
            let navigationController = navigationController else {
            return XCTFail()
        }

        let coordinator = MainCoordinator(window: window, navigationController: navigationController)
        let character = Character()
        coordinator.startHeroDetailCoordinatorWith(character)
        let viewControllerToPresent = navigationController.viewControllerToPresent as? HeroDetailViewController
        XCTAssertNotNil(viewControllerToPresent)

        XCTAssert(coordinator.currentCoordinator is HeroDetailCoordinator)
    }
}
