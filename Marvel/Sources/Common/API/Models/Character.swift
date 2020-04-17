//
//  Character.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import Foundation

class Character: Decodable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: Thumbnail
    var comics: Comic
    var events: Event
    var stories: Story
    var series: Serie

    var isFavorite: Bool {
        get {
            return UserDefaults.standard.bool(forKey: String(id))
        }
        set {
            UserDefaults.standard.set(newValue, forKey: String(id))
        }
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
        case comics
        case events
        case stories
        case series
    }

    init() {
        id = 0
        name = ""
        description = ""
        thumbnail = Thumbnail(path: "", extn: "")
        comics = Comic(available: 0, items: [])
        events = Event(available: 0, items: [])
        stories = Story(available: 0, items: [])
        series = Serie(available: 0, items: [])
    }
}
