//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)




func sum(input: Int...) -> Int {
    return input.reduce(0, { (res, element) -> Int in
        return res + element
    })
}

func sumShort(input: Int...) -> Int {
    return input.reduce(0, +)
}

print(sum(input: 1,2,3,4,5))
print(sum(input: 1,2,3,4,5))
print(sum(input: 1))
