//
//  InfinitLoadable.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

protocol InfinitLoadable {
    var infinitLoadingFooterView: InfinitLoadingFooterView { get }
    func setupLayout()
    func showFooterView(show: Bool)
}

extension InfinitLoadable where Self: UITableView {
    func setupLayout() {
        infinitLoadingFooterView.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: 0)
        tableFooterView = infinitLoadingFooterView
    }

    func showFooterView(show: Bool) {
        let height: CGFloat = show ? 44.0 : 0.0
        infinitLoadingFooterView.frame = CGRect(x: 0.0,
                                                y: 0.0,
                                                width: frame.size.width,
                                                height: height)

        tableFooterView = infinitLoadingFooterView

        if show {
            let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
            setContentOffset(bottomOffset, animated: true)
        }
    }
}
