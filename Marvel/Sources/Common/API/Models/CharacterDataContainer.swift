//
//  CharacterDataContainer.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

struct CharacterDataContainer: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let characters: [Character]

    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case characters = "results"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        offset = try container.decode(Int.self, forKey: .offset)
        limit = try container.decode(Int.self, forKey: .limit)
        total = try container.decode(Int.self, forKey: .total)
        count = try container.decode(Int.self, forKey: .count)
        characters = try container.decode([Character].self, forKey: .characters)
    }
}
