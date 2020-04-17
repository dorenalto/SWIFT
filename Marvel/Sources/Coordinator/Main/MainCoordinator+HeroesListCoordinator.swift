//
//  MainCoordinator+HeroesListCoordinator.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

extension MainCoordinator: HeroesListCoordinatorDelegate {
    func startHeroesListCoordinator() {
        let heroesListCoordinator = HeroesListCoordinator(navigationController: navigationController)
        currentCoordinator = heroesListCoordinator
        heroesListCoordinator.delegate = self
        heroesListCoordinator.start()
    }

    func didFinishListAndStartDetailWith(_ character: Character) {
        startHeroDetailCoordinatorWith(character)
    }
}
