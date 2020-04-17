//
//  HeroesListViewDelegate.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

protocol HeroesListViewDelegate: AnyObject {
    func loading(_ show: Bool)
    func stopRefreshLoading()
    func showInfinitLoading(_ show: Bool)
    func reloadTableView()
}
