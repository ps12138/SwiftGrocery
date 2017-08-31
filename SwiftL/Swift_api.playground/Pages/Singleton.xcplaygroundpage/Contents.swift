//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



class SingletionClass {
    private init() { }
    static let shared = SingletionClass()
}


let hehe = SingletionClass.shared
let haha = SingletionClass.shared

if hehe === haha {
    print("Is the same instance")
}

