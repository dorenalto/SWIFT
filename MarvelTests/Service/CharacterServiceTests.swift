//
//  CharacterServiceTests.swift
//  MarvelTests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

@testable import Marvel
import XCTest

class CharacterServiceTests: XCTestCase {
    var service: CharacterService?

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        service = nil
        super.tearDown()
    }

    func testBla() {
        let network = MockNetwork()
        service = CharacterService(network: network)
        XCTAssertFalse(network.didCalledFetch)

        service?.fetchHeroes(limit: 0, offset: 0, query: nil) { _ in }
        XCTAssert(network.didCalledFetch)
    }
}

private final class MockNetwork: NetworkProtocol {
    var didCalledFetch = false

    func fetch<T>(with _: NetworkRequest, decode _: @escaping (Decodable) -> T?, completion _: @escaping (Result<T, APIError>) -> Void) where T: Decodable {
        didCalledFetch = true
    }
}
