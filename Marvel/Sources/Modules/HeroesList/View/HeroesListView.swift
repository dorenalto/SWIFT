//
//  HeroesListView.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class HeroesListView: UIView, NibDesignable, FullScreenLoader {
    @IBOutlet var searchBar: UISearchBar! {
        didSet {
            searchBar.barTintColor = .blackUI
            searchBar.tintColor = .whiteUI
            searchBar.barStyle = .blackOpaque
            searchBar.placeholder = "HeroesList.searchbar.placeholder".localized
        }
    }

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self,
                                 action: #selector(pullToRefresh(_:)),
                                 for: .valueChanged)
        refreshControl.accessibilityIdentifier = AccessibilityIdentifiers.characterListRefreshControl
        return refreshControl
    }()

    @IBOutlet private var tableView: MarvelTableView! {
        didSet {
            tableView.rowHeight = 97
            tableView.tableFooterView = UIView()
            tableView.accessibilityIdentifier = AccessibilityIdentifiers.characterListTableView
            tableView.addSubview(refreshControl)
            tableView.register(HeroCell.self)
        }
    }

    var viewModelDelegate: HeroesListViewModelDelegate? {
        didSet {
            guard let viewModelDelegate = viewModelDelegate else { return }
            tableView.dataSource = viewModelDelegate.tableViewDataSource
            tableView.delegate = viewModelDelegate.tableViewDelegate
            searchBar.delegate = viewModelDelegate.searchBarDelegate
            viewModelDelegate.set(view: self)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }

    @objc private func pullToRefresh(_: Any) {
        viewModelDelegate?.refreshHeroesList()
    }
}

extension HeroesListView: HeroesListViewDelegate {
    func loading(_ show: Bool) {
        showLoading(show)
    }

    func stopRefreshLoading() {
        refreshControl.endRefreshing()
    }

    func showInfinitLoading(_ show: Bool) {
        if show {
            tableView.startInfinitLoading()
        } else {
            tableView.stopInfinitLoading()
        }
    }

    func reloadTableView() {
        tableView.reloadData()
    }
}
