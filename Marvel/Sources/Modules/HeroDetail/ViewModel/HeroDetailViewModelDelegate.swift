//
//  HeroDetailViewModelDelegate.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

protocol HeroDetailViewModelDelegate: AnyObject {
    var tableViewDelegate: UITableViewDelegate { get }
    var tableViewDataSource: UITableViewDataSource { get }

    func viewDidLoad()
    func set(view: HeroDetailViewDelegate)
    func submit()
}
