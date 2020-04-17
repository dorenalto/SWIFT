//
//  FullScreenLoadable.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

protocol FullScreenLoader {
    func showLoading(_ show: Bool)
}

extension FullScreenLoader {
    func showLoading(_ show: Bool) {
        DispatchQueue.main.async {
            if show {
                Loading.spin()
            } else {
                Loading.stop()
            }
        }
    }
}
