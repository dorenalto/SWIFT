//
//  HeroesListViewModel.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class HeroesListViewModel: NSObject {
    var coordinatorDelegate: HeroesListViewModelCoordinatorDelegate?
    weak var viewDelegate: HeroesListViewDelegate?

    var tableViewDelegate: UITableViewDelegate { return self }
    var tableViewDataSource: UITableViewDataSource { return self }
    var searchBarDelegate: UISearchBarDelegate { return self }

    private var searchBarText: String? {
        didSet {
            resetListData()
            fetchHeroesBy(name: searchBarText)
        }
    }

    private let service: CharacterServiceProtocol

    var shouldShowInfinitLoading: Bool {
        if let characters = characters {
            return offset == characters.count
        }
        return false
    }

    internal var characters: [Character]?
    private let limit: Int = 20
    internal var offset: Int = 0

    init(service: CharacterServiceProtocol = CharacterService()) {
        self.service = service
    }

    internal func handleFetchHeroes(_ characters: [Character]?) {
        if let _ = self.characters,
            let newCharacters = characters {
            self.characters?.append(contentsOf: newCharacters)
        } else {
            self.characters = characters
        }

        viewDelegate?.stopRefreshLoading()
        viewDelegate?.reloadTableView()
        viewDelegate?.showInfinitLoading(false)
        viewDelegate?.loading(false)
    }

    internal func handleFetchHeroes(error: APIError) {
        viewDelegate?.stopRefreshLoading()
        viewDelegate?.showInfinitLoading(false)
        viewDelegate?.loading(false)
        let alertError = createAlertError(with: error)
        coordinatorDelegate?.showAlert(alertError)
    }

    private func createAlertError(with error: Error?) -> UIAlertController {
        let alertController = UIAlertController(title: "Alert.error.default.title".localized,
                                                message: error?.localizedDescription,
                                                preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Alert.error.default.action".localized,
                                         style: .cancel,
                                         handler: nil)
        alertController.addAction(cancelAction)
        return alertController
    }

    internal func resetListData() {
        offset = 0
        characters = nil
    }
}

extension HeroesListViewModel: HeroesListViewModelDelegate {
    func fetchHeroesBy(name: String?) {
        if shouldShowInfinitLoading {
            viewDelegate?.showInfinitLoading(true)
        } else {
            viewDelegate?.loading(true)
        }

        service.fetchHeroes(limit: limit, offset: offset, query: name) { [weak self] result in
            switch result {
            case let .success(marvelResponse):
                self?.handleFetchHeroes(marvelResponse?.data.characters)
            case let .failure(error):
                self?.handleFetchHeroes(error: error)
            }
        }
    }

    func set(view: HeroesListViewDelegate) {
        viewDelegate = view
    }

    func refreshHeroesList() {
        resetListData()
        fetchHeroesBy(name: searchBarText)
    }
}

extension HeroesListViewModel: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.setShowsCancelButton(searchText.count > 0, animated: true)
        if searchText.count >= 3 {
            searchBarText = searchText
        } else if searchText.count == 0 {
            searchBarText = searchText
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resetSearchState(searchBar)
        searchBar.text = nil
        searchBarText = nil
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        resetSearchState(searchBar)
        if let text = searchBar.text, text.count > 0, text.count < 3 {
            searchBarText = text
        }
    }

    private func resetSearchState(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
}

extension HeroesListViewModel: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        return characters?.count ?? 0
    }

    func tableView(_: UITableView,
                   numberOfRowsInSection _: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HeroCell = tableView.dequeueReusableCell(for: indexPath)
        guard let hero = characters?[indexPath.section] else {
            return UITableViewCell()
        }
        cell.setup(with: hero)
        return cell
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        guard let character = characters?[indexPath.section] else { return }
        coordinatorDelegate?.didSelectHeroAndStartHeroDetailWith(character)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.size.height,
            characters?.count == totalHeroesLoaded() {
            offset += limit
            fetchHeroesBy(name: searchBarText)
        }
    }

    internal func totalHeroesLoaded() -> Int {
        return limit + offset
    }
}
