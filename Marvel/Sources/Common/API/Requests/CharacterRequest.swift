//
//  CharacterRequest.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

enum CharacterRequest {
    case characters(limit: Int, offset: Int, query: String?)
    case charactersComics(limit: Int, offset: Int, query: String?)
}

extension CharacterRequest: NetworkRequest {
    private var formatter: DateFormatter {
        let f = DateFormatter()
        f.dateFormat = "yyyyMMddHHmmss"
        return f
    }
    
    private var timestamp: String {
        return formatter.string(from: Date())
    }
    
    private var hash: String {
        if let hash = "\(timestamp)\(Constants.privateKey)\(Constants.publicKey)".md5() {
            return hash
        }
        return String()
    }
    
    var path: String {
        switch self {
        case .characters:
            return "/v1/public/characters"
        case .charactersComics:
            return "/v1/public/characters/{characterId}/comics"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case let .characters(limit, offset, query):
            var urlQueryItems = [URLQueryItem]()
            urlQueryItems.append(URLQueryItem(name: "ts", value: timestamp))
            urlQueryItems.append(URLQueryItem(name: "apikey", value: Constants.publicKey))
            urlQueryItems.append(URLQueryItem(name: "hash", value: hash))
            urlQueryItems.append(URLQueryItem(name: "limit", value: String(limit)))
            urlQueryItems.append(URLQueryItem(name: "offset", value: String(offset)))
            urlQueryItems.append(URLQueryItem(name: "orderBy", value: "name"))
            if let query = query, !query.isEmpty {
                urlQueryItems.append(URLQueryItem(name: "nameStartsWith", value: query))
                
            }
            return urlQueryItems
            
        case let .charactersComics(limit, offset, query):
            var urlQueryItems = [URLQueryItem]()
            urlQueryItems.append(URLQueryItem(name: "ts", value: timestamp))
            urlQueryItems.append(URLQueryItem(name: "apikey", value: Constants.publicKey))
            urlQueryItems.append(URLQueryItem(name: "hash", value: hash))
            urlQueryItems.append(URLQueryItem(name: "limit", value: String(limit)))
            urlQueryItems.append(URLQueryItem(name: "offset", value: String(offset)))
            urlQueryItems.append(URLQueryItem(name: "orderBy", value: "name"))
            
            if let query = query, !query.isEmpty {
                urlQueryItems.append(URLQueryItem(name: "nameStartsWith", value: query))
                
            }
            return urlQueryItems
        }
    }
}
