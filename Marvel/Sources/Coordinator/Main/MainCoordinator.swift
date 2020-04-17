//
//  MainCoordinator.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    weak var currentCoordinator: Coordinator?
    private unowned let window: UIWindow
    internal let navigationController: UINavigationController

    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }

    func start(animated _: Bool) {
        window.rootViewController = navigationController
        startHeroesListCoordinator()
    }
}
