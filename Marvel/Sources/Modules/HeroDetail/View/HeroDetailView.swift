//
//  HeroDetailView.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class HeroDetailView: UIView, UIScrollViewDelegate, NibDesignable {
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 21
            tableView.backgroundColor = UIColor.clear
            tableView.accessibilityIdentifier = AccessibilityIdentifiers.characterDetailTableView
            tableView.register(HeroDetailContentCell.self)
            tableView.register(HeroDetailPhotoCell.self)
        }
    }

    @IBOutlet var submitButton: UIButton! {
        didSet {
            submitButton.backgroundColor = .blueUI
            submitButton.setTitleColor(.whiteUI, for: .normal)
            submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            submitButton.accessibilityIdentifier = AccessibilityIdentifiers.characterDetailSubmitButton
        }
    }

    var viewModelDelegate: HeroDetailViewModelDelegate? {
        didSet {
            guard let viewModelDelegate = viewModelDelegate else { return }
            tableView.dataSource = viewModelDelegate.tableViewDataSource
            tableView.delegate = viewModelDelegate.tableViewDelegate
            viewModelDelegate.set(view: self)
        }
    }

    @IBAction private func didTapOnSubmitButton(_: Any) {
        viewModelDelegate?.submit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
}

extension HeroDetailView: HeroDetailViewDelegate {
    func setButtonName(_ name: String) {
        let title = "\("HeroesDetail.submitButton.title".localized) \(name)"
        submitButton.setTitle(title, for: .normal)
    }
}
