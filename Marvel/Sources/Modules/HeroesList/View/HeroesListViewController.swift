//
//  HeroesListViewController.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class HeroesListViewController: UIViewController {
    let contentView: HeroesListView = HeroesListView(frame: .zero)

    var viewModelDelegate: HeroesListViewModelDelegate? {
        didSet {
            guard let viewModel = viewModelDelegate else { return }
            contentView.viewModelDelegate = viewModel
        }
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HeroesList.screen.title".localized
        viewModelDelegate?.fetchHeroesBy(name: "")
    }
}
