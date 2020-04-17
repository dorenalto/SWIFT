//
//  HeroDetailViewModel.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class HeroDetailViewModel: NSObject {
    var coordinatorDelegate: HeroDetailViewModelCoordinatorDelegate?
    weak var viewDelegate: HeroDetailViewDelegate?

    var tableViewDelegate: UITableViewDelegate { return self }
    var tableViewDataSource: UITableViewDataSource { return self }

    let character: Character

    init(character: Character) {
        self.character = character
    }
}

extension HeroDetailViewModel: HeroDetailViewModelDelegate {
    func viewDidLoad() {
        viewDelegate?.setButtonName(character.name.uppercased())
    }

    func set(view: HeroDetailViewDelegate) {
        viewDelegate = view
    }

    func submit() {
        coordinatorDelegate?.didFinishHeroDetailCoordinator()
    }
}

extension HeroDetailViewModel: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        return HeroDetailContent.allCases.count
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        return HeroDetailContent(rawValue: section)?.titleForHeader
    }

    func tableView(_: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let heroDetailContent = HeroDetailContent(rawValue: section) else {
            return .leastNonzeroMagnitude
        }
        return heroDetailContent.heightForHeader
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let heroDetailContent = HeroDetailContent(rawValue: section) else {
            return 0
        }
        switch heroDetailContent {
        case .photo:
            return 1
        case .description:
            return 1
        case .comics:
            if character.comics.items.count > 0 {
                return character.comics.items.prefix(3).count
            }
        case .events:
            if character.events.items.count > 0 {
                return character.events.items.prefix(3).count
            }
        case .series:
            if character.series.items.count > 0 {
                return character.series.items.prefix(3).count
            }
        case .stories:
            if character.stories.items.count > 0 {
                return character.stories.items.prefix(3).count
            }
        }
        return 1
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let heroDetailContent = HeroDetailContent(rawValue: indexPath.section) else {
            return UITableViewCell()
        }

        let noContentString = "\("HeroesDetail.section.description.noContent".localized) \(heroDetailContent)"

        switch heroDetailContent {
        case .photo:
            let cell: HeroDetailPhotoCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setup(urlString: character.thumbnail.url)
            cell.selectionStyle = .none
            return cell
        case .description:
            let cell: HeroDetailContentCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setup(with: character.description)
            cell.selectionStyle = .none
            return cell
        case .comics:
            let cell: HeroDetailContentCell = tableView.dequeueReusableCell(for: indexPath)
            if character.comics.items.count > 0 {
                cell.setup(with: character.comics.items[indexPath.row])
            } else {
                cell.setup(with: noContentString)
            }
            cell.selectionStyle = .none
            return cell
        case .events:
            let cell: HeroDetailContentCell = tableView.dequeueReusableCell(for: indexPath)
            if character.events.items.count > 0 {
                cell.setup(with: character.events.items[indexPath.row])
            } else {
                cell.setup(with: noContentString)
            }
            cell.selectionStyle = .none
            return cell
        case .series:
            let cell: HeroDetailContentCell = tableView.dequeueReusableCell(for: indexPath)
            if character.series.items.count > 0 {
                cell.setup(with: character.series.items[indexPath.row])
            } else {
                cell.setup(with: noContentString)
            }
            cell.selectionStyle = .none
            return cell
        case .stories:
            let cell: HeroDetailContentCell = tableView.dequeueReusableCell(for: indexPath)
            if character.stories.items.count > 0 {
                cell.setup(with: character.stories.items[indexPath.row])
            } else {
                cell.setup(with: noContentString)
            }
            cell.selectionStyle = .none
            return cell
        }
    }
}
