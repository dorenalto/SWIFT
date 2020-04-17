//
//  HeroDetailContent.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

enum HeroDetailContent: Int, CaseIterable {
    case photo
    case description
    case comics
    case events
    case stories
    case series

    var titleForHeader: String? {
        switch self {
        case .photo:
            return nil
        case .description:
            return nil
        case .comics:
            return "HeroesDetail.section.title.comics".localized
        case .events:
            return "HeroesDetail.section.title.events".localized
        case .stories:
            return "HeroesDetail.section.title.stories".localized
        case .series:
            return "HeroesDetail.section.title.series".localized
        }
    }

    var heightForHeader: CGFloat {
        switch self {
        case .photo:
            return .leastNonzeroMagnitude
        case .description:
            return .leastNonzeroMagnitude
        default:
            return 35.0
        }
    }
}
