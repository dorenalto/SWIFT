//
//  Coordinator.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject {
    var currentCoordinator: Coordinator? { get set }

    func start()
    func start(animated: Bool)
}

extension Coordinator {
    var currentCoordinator: Coordinator? {
        get { return nil }
        set { currentCoordinator = newValue }
    }

    func start() {
        start(animated: true)
    }
}
