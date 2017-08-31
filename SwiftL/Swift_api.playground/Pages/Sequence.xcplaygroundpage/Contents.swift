//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



var array = [1, 2, 3, 4, 5, 6, 1, 2, 3, 4]

var sorted = array.sorted()
sorted

// decending
var sorted1 = array.sorted { (left, right) -> Bool in
    left > right
}
sorted1

// ascending
var sorted2 = array.sorted { $0 < $1 }
sorted2





// Returns an array containing the non-nil results of calling the given transformation with each element of this sequence.
var flatMaped = array.flatMap { (element) -> String in
    String(element)
}

// Returns an array containing the results of mapping the given closure over the sequence’s elements.
var maped = array.map { (element) -> String in
    String(element)
}


// true will be filtered, return meets given prediction
var filtered = array.filter { (element) -> Bool in
    if element < 2 {
        return true
    } else {
        return false
    }
}

// reduce, add all
// Returns the result of calling the given combining closure with each element of this sequence and an accumulating value.
var reduced = array.reduce(0) { (res, element) -> Int in
    return res + element
}




