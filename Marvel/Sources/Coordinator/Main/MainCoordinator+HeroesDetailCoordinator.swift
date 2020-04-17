//
//  MainCoordinator+HeroesDetailCoordinator.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

extension MainCoordinator: HeroDetailCoordinatorDelegate {
    func startHeroDetailCoordinatorWith(_ character: Character) {
        let heroDetailCoordinator = HeroDetailCoordinator(navigationController: navigationController,
                                                          character: character)
        currentCoordinator = heroDetailCoordinator
        heroDetailCoordinator.delegate = self
        heroDetailCoordinator.start()
    }
}
