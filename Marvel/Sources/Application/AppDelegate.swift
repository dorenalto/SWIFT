//
//  AppDelegate.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let navigationController: UINavigationController = UINavigationController()

    lazy var window: UIWindow? = {
        UIWindow()
    }()

    private lazy var rootCoordinator: MainCoordinator = {
        guard let window = self.window else { fatalError("Failed to create window") }
        let rootCoordinator = MainCoordinator(window: window, navigationController: self.navigationController)
        return rootCoordinator
    }()

    func application(_: UIApplication,
                     didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        customizeNavigationView()
        rootCoordinator.start()
        window?.makeKeyAndVisible()
        return true
    }

    private func customizeNavigationView() {
        navigationController.navigationBar.barStyle = .black
        navigationController.navigationBar.barTintColor = UIColor.blackUI
        navigationController.navigationBar.tintColor = UIColor.whiteUI
        navigationController.navigationBar.isTranslucent = false
    }
}
