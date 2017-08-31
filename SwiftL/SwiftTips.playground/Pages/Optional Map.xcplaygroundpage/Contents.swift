//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// Map: Array, Dict, Set, Optional

/*
 public enum Optional<T> : _Reflectable, NilLiteralConvertible {
    //...
    /// If `self == nil`, returns `nil`. Otherwise, returns `f(self!)`.
    public func map<U>(@noescape f: (T) -> U) -> U?
    //...
 }
*/


let num: Int? = 3
let result = num.map {
    $0 * 2
}
print(result)
// result 为 {Some 6}


let num1: Int? = nil
let result1 = num1.map { (element) -> Int in
    return element * 2
}
print(result1)
