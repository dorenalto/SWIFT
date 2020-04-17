//
//  MarvelTableView.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 16/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

class MarvelTableView: UITableView, InfinitLoadable {
    var infinitLoadingFooterView: InfinitLoadingFooterView

    override init(frame: CGRect, style: UITableView.Style) {
        infinitLoadingFooterView = InfinitLoadingFooterView()
        super.init(frame: frame, style: style)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        infinitLoadingFooterView = InfinitLoadingFooterView()
        super.init(coder: aDecoder)
        setupLayout()
    }

    func startInfinitLoading() {
        showFooterView(show: true)
        infinitLoadingFooterView.activityIndicator.startAnimating()
    }

    func stopInfinitLoading() {
        if isLoading() {
            showFooterView(show: false)
            infinitLoadingFooterView.activityIndicator.stopAnimating()
        }
    }

    private func isLoading() -> Bool {
        return infinitLoadingFooterView.activityIndicator.isAnimating
    }
}
