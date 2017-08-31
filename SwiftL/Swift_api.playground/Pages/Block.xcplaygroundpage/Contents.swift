//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



let block: (Int) -> Void = {
    (value) -> Void in
    print("i'm \(value)")
}

block(20)