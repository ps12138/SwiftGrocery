//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



func returnTuple() -> (Int, Int) {
    return (5, 6)
}


var num1 = 1
var num2 = 2

(num1, num2) = returnTuple()
num1
num2

(num2, num1) = returnTuple()
num1
num2