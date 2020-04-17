//
//  HeroDetailPhotoCell.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class HeroDetailPhotoCell: UITableViewCell, Identifiable {
    @IBOutlet var photoImageView: MarvelImageView! {
        didSet {
            photoImageView.contentMode = .scaleToFill
        }
    }

    func setup(urlString: String) {
        photoImageView.downloadImageFrom(withUrl: urlString)
    }
}
