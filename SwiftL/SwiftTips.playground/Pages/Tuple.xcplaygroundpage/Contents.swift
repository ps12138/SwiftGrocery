//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)


// provide multiple return values
let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
let (slice, remainder) = rect.divided(atDistance: 20, from: .minXEdge)
print("slice: \(slice)")
print("remainder: \(remainder)")

// swap two

func swapTwo<T>(_ left: inout T, _ right: inout T) {
    (left, right) = (right, left)
}