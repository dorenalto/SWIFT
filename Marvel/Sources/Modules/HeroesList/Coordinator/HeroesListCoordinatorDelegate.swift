//
//  HeroesListCoordinatorDelegate.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

protocol HeroesListCoordinatorDelegate: AnyObject {
    func didFinishListAndStartDetailWith(_ character: Character)
}

protocol HeroesListViewModelCoordinatorDelegate: AnyObject {
    func didSelectHeroAndStartHeroDetailWith(_ character: Character)
    func showAlert(_ alert: UIAlertController)
}
