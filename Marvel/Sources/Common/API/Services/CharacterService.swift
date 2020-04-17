//
//  CharacterService.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

typealias GetHeroesListHandler = (Result<CharacterDataWrapper?, APIError>) -> Void

protocol CharacterServiceProtocol {
    func fetchHeroes(limit: Int, offset: Int, query: String?, completion: @escaping GetHeroesListHandler)
}

final class CharacterService: CharacterServiceProtocol {
    private let network: NetworkProtocol

    init(network: NetworkProtocol = Network()) {
        self.network = network
    }

    func fetchHeroes(limit: Int, offset: Int, query: String?, completion: @escaping GetHeroesListHandler) {
        let request = CharacterRequest.characters(limit: limit, offset: offset, query: query)
        network.fetch(with: request, decode: { json -> CharacterDataWrapper? in
            guard let marvelResponse = json as? CharacterDataWrapper else { return nil }
            return marvelResponse
        }, completion: completion)
    }
}
