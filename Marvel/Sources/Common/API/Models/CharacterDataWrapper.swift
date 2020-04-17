//
//  CharacterDataWrapper.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

struct CharacterDataWrapper: Decodable {
    let status: String
    let data: CharacterDataContainer
}
