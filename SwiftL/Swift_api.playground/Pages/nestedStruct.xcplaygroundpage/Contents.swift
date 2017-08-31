//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


struct OuterStruct {
    var a = "abc"
    struct Inner {
        var hehe = "hehe"
    }
}


let struct1 = OuterStruct()
let struct2 = OuterStruct()
//struct1.a = "bcd"

type(of: struct1).Inner().hehe




struct OuterStruct2 {
    
    struct Inner2 {
        static let hehe = "hehe"
    }
}

var struct3 = OuterStruct2()
var struct4 = OuterStruct2()

type(of: struct3).Inner2.hehe
type(of: struct4).Inner2.hehe



