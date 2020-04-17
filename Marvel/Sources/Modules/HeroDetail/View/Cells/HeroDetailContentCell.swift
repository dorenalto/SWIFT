//
//  HeroDetailContentCell.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class HeroDetailContentCell: UITableViewCell, Identifiable {
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .clear
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionLabel.text = nil
    }

    func setup(with item: Item?) {
        descriptionLabel.text = item?.name
    }

    func setup(with text: String?) {
        descriptionLabel.text = text
    }
}
