//
//  HeroDetailCoordinator.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class HeroDetailCoordinator: Coordinator {
    private let navigationController: UINavigationController
    weak var delegate: HeroDetailCoordinatorDelegate?
    private let character: Character

    init(navigationController: UINavigationController, character: Character) {
        self.navigationController = navigationController
        self.character = character
    }

    func start(animated _: Bool = true) {
        let heroDetailViewController: HeroDetailViewController = createHeroDetailViewController()
        navigationController.present(heroDetailViewController, animated: true, completion: nil)
    }

    private func createHeroDetailViewController() -> HeroDetailViewController {
        let viewController: HeroDetailViewController = HeroDetailViewController()
        let viewModel: HeroDetailViewModel = HeroDetailViewModel(character: character)
        viewModel.coordinatorDelegate = self
        viewController.viewModelDelegate = viewModel
        return viewController
    }
}

extension HeroDetailCoordinator: HeroDetailViewModelCoordinatorDelegate {
    func didFinishHeroDetailCoordinator() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
