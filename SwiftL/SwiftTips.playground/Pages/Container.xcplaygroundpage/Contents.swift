//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// Generic Container with the same type
let array = [1,2,3]
let dict = [1: 1, 2: 2, 3: 3]
let set = Set<Int>()


// Generic Container with different types, basic
let array1: [Any] = []
let array2: [AnyObject] = []


// Generic Container with different types, better
let mixed: [CustomStringConvertible] = [1, "two", 2]

for element in mixed {
    print(element.description)
}

// Generic Container with different types, better
enum IntOrString {
    case IntValue(Int)
    case StringValue(String)
}
let mixed2 = [IntOrString.IntValue(1),
             IntOrString.StringValue("two"),
             IntOrString.IntValue(3)]
for value in mixed2 {
    switch value {
    case let .IntValue(i):
        print(i)
    case let .StringValue(s):
        print(s.capitalized)
    }
}

for value in mixed2 {
    switch value {
    case .IntValue(let i):
        print(i)
    case .StringValue(let s):
        print(s.capitalized)
    }
}



