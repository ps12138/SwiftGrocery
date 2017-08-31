//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


func incrementor(variable: Int) -> Int {
    let newVar = variable + 1
    return newVar
}

// default
//func incrementor(variable: let Int) -> Int

// dep by Swift 2.2
//func incrementor(variable: var Int) -> Int


// add N function
func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func increment(variable: inout Int) -> () {
        variable += addNumber
    }
    return increment
}

let add10 = makeIncrementor(addNumber: 10)
var num = 100
add10(&num)
num