//
//  Thumbnail.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

struct Thumbnail: Decodable {
    let path: String
    let extn: String

    var url: String {
        return "\(path).\(extn)"
    }

    init(path: String, extn: String) {
        self.path = path
        self.extn = extn
    }

    enum CodingKeys: String, CodingKey {
        case path
        case extn = "extension"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        path = try container.decode(String.self, forKey: .path)
        extn = try container.decode(String.self, forKey: .extn)
    }
}
