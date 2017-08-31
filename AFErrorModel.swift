//
//  ErrorModel.swift
//  DemoV1
//
//  Created by PSL on 5/11/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation
import ObjectMapper

struct ErrorModel {
    var code: Int = DefaultModelValue.num
    var message: String = DefaultModelValue.str

    struct Keys {
        static let code = "code"
        static let message = "message"
    }
}

// MARK: - Mappable
extension ErrorModel: Mappable {
    init?(map: Map) {
        if map.JSON[Keys.code] == nil || map.JSON[Keys.message] == nil {
            return nil
        }
    }
    mutating func mapping(map: Map) {
        code <- map[Keys.code]
        message <- map[Keys.message]
    }
}

// MARK: - Decodable
extension ErrorModel: APIJsonDecodable {
    static func parse(input: Any?) -> ErrorModel? {
        guard let input = input as? [String: Any] else {
            return nil
        }
        return ErrorModel(JSON: input, context: nil)
    }
}

// MARK: - add a init for LocalErrors
extension ErrorModel {
    init(error: LocalErrors) {
        self.code = error.rawValue
        self.message = error.message
    }
}

// MARK: - CustomStringConvertible
extension ErrorModel: CustomStringConvertible {
    public var description: String {
        return "code: \(code), \(message)\n"
    }
}
