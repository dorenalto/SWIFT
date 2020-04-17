//
//  String+MD5Tests.swift
//  MarvelTests
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

@testable import Marvel
import XCTest

class String_MD5Tests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testOnlyLetterMD5Encrypt() {
        let encryptedString = "".md5()
        XCTAssertEqual("d41d8cd98f00b204e9800998ecf8427e", encryptedString)
    }

    func testOnlyNumbersMD5Encrypt() {
        let encryptedString = "Marvel".md5()
        XCTAssertEqual("8fbc7ff7b6ed792ab5e02b014c54332d", encryptedString)
    }

    func testMD5Encrypt() {
        let encryptedString = "Marvel123".md5()
        XCTAssertEqual("e40edf693cfa88f285672e3f8ae42802", encryptedString)
    }

    func testMD5EncryptWithEmptyString() {
        let encryptedString = "Marvel 123".md5()
        XCTAssertEqual("74054855eeb1ebb3886ca88cbd9e1152", encryptedString)
    }
}
