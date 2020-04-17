//
//  String+MD5.swift
//  Marvel
//
//  Created by Dorenalto Mangueira Couto on 15/04/2020.
//  Copyright © 2020 Dorenalto Mangueira Couto. All rights reserved.
//

import CommonCrypto
import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func md5() -> String! {
        let str = cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)

        CC_MD5(str!, strLen, result)

        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }

        result.deallocate()

        return String(format: hash as String)
    }
}
