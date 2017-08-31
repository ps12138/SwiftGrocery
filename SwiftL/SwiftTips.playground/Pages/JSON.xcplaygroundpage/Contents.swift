//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


func jsonSerialize(input: String) -> Any? {
    
    guard let data = input.data(using: .utf8, allowLossyConversion: true) else {
        return nil
    }
    let jsonObj: Any = try? JSONSerialization.jsonObject(
        with: data,
        options: [])
    return jsonObj
}