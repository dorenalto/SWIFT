//
//  String+LocalizedTests.swift
//  MarvelTests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

@testable import Marvel
import XCTest

class String_LocalizedTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testLocalizedStringFile() {
        // Heroes List
        let heroesListScreenTitle = "HeroesList.screen.title".localized
        XCTAssertEqual(heroesListScreenTitle, "Super Heroes")

        let heroesListSearchBarPlaceholder = "HeroesList.searchbar.placeholder".localized
        XCTAssertEqual(heroesListSearchBarPlaceholder, "Search by name")

        // Heroes Detail
        let heroesDetailSectionTitleComics = "HeroesDetail.section.title.comics".localized
        XCTAssertEqual(heroesDetailSectionTitleComics, "Comics")

        let heroesDetailSectionTitleEvents = "HeroesDetail.section.title.events".localized
        XCTAssertEqual(heroesDetailSectionTitleEvents, "Events")

        let heroesDetailSectionTitleStories = "HeroesDetail.section.title.stories".localized
        XCTAssertEqual(heroesDetailSectionTitleStories, "Stories")

        let heroesDetailSectionTitleSeries = "HeroesDetail.section.title.series".localized
        XCTAssertEqual(heroesDetailSectionTitleSeries, "Series")

        let heroesDetailSectionDescriptionNoContent = "HeroesDetail.section.description.noContent".localized
        XCTAssertEqual(heroesDetailSectionDescriptionNoContent, "This super hero has no")

        let heroesDetailSubmitButtonTitle = "HeroesDetail.submitButton.title".localized
        XCTAssertEqual(heroesDetailSubmitButtonTitle, "SUBMIT")

        // Error
        let alertErrorDefaultTitle = "Alert.error.default.title".localized
        XCTAssertEqual(alertErrorDefaultTitle, "Ops! Error...")

        let alertErrorDefaultAction = "Alert.error.default.action".localized
        XCTAssertEqual(alertErrorDefaultAction, "Ok")
    }
}
