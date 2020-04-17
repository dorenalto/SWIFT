//
//  HeroCell.swift
//  Marvel
//
//  Created by Bruno Henrique Costa Ramos on 11/01/19.
//  Copyright © 2019 Bruno Ramos. All rights reserved.
//

import UIKit

class HeroCell: UITableViewCell, Identifiable {
    @IBOutlet var photoImageView: MarvelImageView! {
        didSet {
            photoImageView.layer.masksToBounds = false
            photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
            photoImageView.clipsToBounds = true
            photoImageView.contentMode = .scaleToFill
        }
    }

    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        }
    }

    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
            descriptionLabel.numberOfLines = 0
        }
    }

    @IBOutlet var favoriteButton: UIButton!

    private var character: Character?

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
    }

    func setup(with character: Character) {
        self.character = character
        photoImageView.downloadImageFrom(withUrl: character.thumbnail.url)
        nameLabel.text = character.name
        descriptionLabel.text = character.description
        setFavoriteButton(character.isFavorite)
    }

    @IBAction func didTapOnFavoriteButton(_: Any) {
        guard let character = character else {
            return
        }

        character.isFavorite.toggle()
        setFavoriteButton(character.isFavorite)
    }

    private func setFavoriteButton(_ favorite: Bool) {
        let image = favorite ? UIImage(named: "favorite-icon") : UIImage(named: "favor-icon")
        favoriteButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
}
