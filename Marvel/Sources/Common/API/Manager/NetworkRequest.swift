//
//  NetworkRequest.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

protocol NetworkRequest {
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension NetworkRequest {
    var base: String {
        return Constants.baseURL
    }

    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
        return components
    }

    var request: URLRequest {
        guard let url = urlComponents.url else {
            fatalError("Invalid URL Request")
        }

        let request = NSMutableURLRequest(url: url)
        return request as URLRequest
    }
}
