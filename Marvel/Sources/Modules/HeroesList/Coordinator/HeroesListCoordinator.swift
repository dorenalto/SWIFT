//
//  HeroesListCoordinator.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class HeroesListCoordinator: Coordinator {
    private let navigationController: UINavigationController
    weak var delegate: HeroesListCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(animated: Bool = true) {
        let heroesListViewController: HeroesListViewController = createHeroesListViewController()
        navigationController.pushViewController(heroesListViewController, animated: animated)
    }

    private func createHeroesListViewController() -> HeroesListViewController {
        let viewController: HeroesListViewController = HeroesListViewController()
        let viewModel: HeroesListViewModel = HeroesListViewModel()
        viewModel.coordinatorDelegate = self
        viewController.viewModelDelegate = viewModel
        return viewController
    }
}

extension HeroesListCoordinator: HeroesListViewModelCoordinatorDelegate {
    func showAlert(_ alert: UIAlertController) {
        navigationController.present(alert, animated: true, completion: nil)
    }

    func didSelectHeroAndStartHeroDetailWith(_ character: Character) {
        delegate?.didFinishListAndStartDetailWith(character)
    }
}
