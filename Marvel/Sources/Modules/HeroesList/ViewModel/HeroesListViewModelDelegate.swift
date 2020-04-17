//
//  HeroesListViewModelDelegate.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

protocol HeroesListViewModelDelegate: AnyObject {
    var tableViewDelegate: UITableViewDelegate { get }
    var tableViewDataSource: UITableViewDataSource { get }
    var searchBarDelegate: UISearchBarDelegate { get }

    func set(view: HeroesListViewDelegate)
    func fetchHeroesBy(name: String?)
    func refreshHeroesList()
}
