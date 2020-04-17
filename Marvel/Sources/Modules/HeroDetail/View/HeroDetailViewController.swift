//
//  HeroDetailViewController.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController {
    let contentView: HeroDetailView = HeroDetailView(frame: .zero)

    var viewModelDelegate: HeroDetailViewModelDelegate? {
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
        viewModelDelegate?.viewDidLoad()
    }
}
