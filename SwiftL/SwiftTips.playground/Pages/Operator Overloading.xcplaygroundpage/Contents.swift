//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


struct Vector2D {
    var x = 0.0
    var y = 0.0
}

// if the operator is existed
func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: right.y + right.y)
}

// if the operator is not existed
precedencegroup DotProductPrecedence {
    associativity: none
    higherThan: MultiplicationPrecedence
}

infix operator +*: DotProductPrecedence

func +*(left: Vector2D, right: Vector2D) -> Double {
    return left.x * right.x + left.y * right.y
}


// test
let v1 = Vector2D(x: 2, y: 3)
let v2 = Vector2D(x: 1, y: 4)
let v3 = v1 + v2
let v4 = v1 +* v2




