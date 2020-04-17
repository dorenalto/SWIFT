//
//  MockUINavigationController.swift
//  MarvelTests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class MockUINavigationController: UINavigationController {
    var viewControllerToPush: UIViewController!
    var viewControllerToPresent: UIViewController!
    var dismissVCCalled: Bool = false

    override var presentedViewController: UIViewController? {
        get {
            return viewControllerToPresent
        }
        set {
            viewControllerToPresent = newValue
        }
    }

    override func pushViewController(_ viewController: UIViewController, animated _: Bool) {
        viewControllerToPush = viewController
    }

    override func present(_ viewControllerToPresent: UIViewController,
                          animated _: Bool, completion: (() -> Void)? = nil) {
        self.viewControllerToPresent = viewControllerToPresent
        completion?()
    }

    override func dismiss(animated _: Bool, completion: (() -> Void)? = nil) {
        dismissVCCalled = true
        completion?()
    }
}
