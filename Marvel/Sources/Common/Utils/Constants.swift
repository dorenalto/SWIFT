//
//  Constants.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

struct Constants {
    static var baseURL: String {
        let dictonary = Bundle.main.infoDictionary?["EnviromentSetting"]
        if let environment = dictonary as? [String: AnyObject],
            let baseURLValue = environment["BASE_URL"] as? String {
            return baseURLValue
        } else {
            return String()
        }
    }

    static var infoPListDict: NSDictionary? {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
            let nsDictionary = NSDictionary(contentsOfFile: path) {
            return nsDictionary
        }
        return NSDictionary()
    }

    static var publicKey: String {
        if let nsDictionary = infoPListDict,
            let publicKey = nsDictionary["publicKey"] as? String {
            return publicKey
        } else {
            return String()
        }
    }

    static var privateKey: String {
        if let nsDictionary = infoPListDict,
            let privateKey = nsDictionary["privateKey"] as? String {
            return privateKey
        } else {
            return String()
        }
    }
}

struct AccessibilityIdentifiers {
    static let characterListTableView = "CharacterListTableViewAccessibilityIdentifier"
    static let characterListRefreshControl = "CharacterListRefreshControlAccessibilityIdentifier"
    static let characterDetailTableView = "CharacterDetailTableViewAccessibilityIdentifier"
    static let characterDetailSubmitButton = "CharacterDetailSubmitButtonAccessibilityIdentifier"
}
