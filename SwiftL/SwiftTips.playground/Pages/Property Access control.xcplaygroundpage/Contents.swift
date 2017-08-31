//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// getter: internal
// setter: private
class MyClass {
    private(set) var name: String?
}

// getter: public
// setter: private
public class MyClass {
    public private(set) var name: String?
}