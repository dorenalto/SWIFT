//
//  Identifiable.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import UIKit

public protocol Identifiable {}

extension Identifiable where Self: UIView {
    public static var identifier: String {
        return String(describing: self)
    }
}
