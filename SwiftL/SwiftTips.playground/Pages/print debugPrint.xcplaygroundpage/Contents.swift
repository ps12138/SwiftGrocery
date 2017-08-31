//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Meeting {
    var hehe: Int = 1
}

extension Meeting: CustomStringConvertible {
    var description: String {
        return "CustomStringConvertible"
    }
}

extension Meeting: CustomDebugStringConvertible {
    var debugDescription: String {
        return "CustomDebugStringConvertible"
    }
}
let meeting = Meeting()
print(meeting)
debugPrint(meeting)