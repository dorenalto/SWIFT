//
//  InfinitLoadingFooterView.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 16/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class InfinitLoadingFooterView: UIView, NibDesignable {
    @IBOutlet var view: UIView! {
        didSet {
            view.backgroundColor = .clear
        }
    }

    @IBOutlet var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.hidesWhenStopped = true
            activityIndicator.color = .redUI
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
}
