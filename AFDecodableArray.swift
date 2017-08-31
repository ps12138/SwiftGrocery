//
//  DecodableArray.swift
//  DemoV1
//
//  Created by PSL on 5/9/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import Foundation

fileprivate struct APIKeys {
    static let items = "items"
    static let results = "results"
    static let errors = "errors"
}

//internal typealias ERROR = ErrorModel
struct DecodableArray<T: APIJsonDecodable> {
    typealias ERROR = ErrorModel
    let value: [T]
    let errors: ERROR?
}

extension DecodableArray: APIJsonDecodable {

    static func parse(input: Any?) -> DecodableArray<T>? {

        guard let input = input else {
            print("DecodableArray: \(String(describing: self)) nil input")
            return nil
        }

        let (objs, errorObjs) = jsonFormatCheck(input: input)

        // if we have explict errors
        if let validErrorObjs = errorObjs {
            return DecodableArray(value: [T](), errors: validErrorObjs)
        }
        // if objs is empty, and no explict errors
        guard let validObjs = objs else {
            return nil
        }
        // if objs is explict
        var value = [T]()
        for obj in validObjs {
            if let result = T.parse(input: obj) {
                value.append(result)
            }
        }
        return DecodableArray(value: value, errors: nil)
    }

    private static func jsonFormatCheck(input: Any) -> ([Any]? ,ERROR?) {

        // if the input has been nested
        if let array = input as? [Any] {
            return (array, nil)
        }

        // if the input has not been serialized
        guard let data = input as? Data else {
            assertionFailure("DecodableArray: fail in cast JSON input to Data")
            return (nil, ERROR(error: .jsonParsingFailure))
        }
        return jsonSerialize(data: data)
    }

    private static func jsonSerialize(data: Data) -> ([Any]? , ERROR?) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) else {
            assertionFailure("DecodableArray: fail in Serialialization")
            return (nil, ERROR(error: .jsonParsingFailure))
        }
        return jsonArrayHandler(obj: obj)
    }

    private static func jsonArrayHandler(obj: Any) -> ([Any]?, ERROR?) {

        guard let dict = obj as? [String: Any] else {
            assertionFailure("DecodableArray: fails in cast to Dict")
            return (nil, ERROR(error: .jsonParsingFailure))
        }

        guard let items = dict[APIKeys.items] as? [String: Any] else {
            assertionFailure("DecodableArray: fails in fetch items key")
            return (nil, ERROR(error: .jsonParsingFailure))
        }

        if  let errors = items[APIKeys.errors] as? [String: Any] {
            if let result = ERROR.parse(input: errors) {
                return (nil, result)
            }
            return (nil,ERROR(error: .jsonParsingFailure))
        }
        return (items[APIKeys.results] as? [Any], nil)
    }
}
