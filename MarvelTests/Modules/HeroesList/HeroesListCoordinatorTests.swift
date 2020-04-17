//
//  HeroesListCoordinatorTests.swift
//  MarvelTests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

@testable import Marvel
import XCTest

class HeroesListCoordinatorTests: XCTestCase {
    var window: UIWindow?
    var navigationController: MockUINavigationController!

    override func setUp() {
        super.setUp()
        navigationController = MockUINavigationController()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        self.window = window
    }

    override func tearDown() {
        window?.rootViewController = nil
        window?.resignKey()
        window = nil
        super.tearDown()
    }

    func testStart() {
        let navigationController = MockUINavigationController()
        let coordinator = HeroesListCoordinator(navigationController: navigationController)
        coordinator.start(animated: false)

        let viewControllerToPresent = navigationController.viewControllerToPush as? HeroesListViewController
        XCTAssertNotNil(viewControllerToPresent)
    }

    func tesAlertError() {
        let navigationController = MockUINavigationController()
        let coordinator = HeroesListCoordinator(navigationController: navigationController)
        let alertController = UIAlertController()
        coordinator.showAlert(alertController)
        let viewControllerToPresent = navigationController.viewControllerToPresent as? UIAlertController
        XCTAssertNotNil(viewControllerToPresent)
    }
}
