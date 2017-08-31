//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



// 1 setting subclass parameters that need initialize, self.power = 10
// 2 call superclass init method, super.init()
// 3 setting superclass parameters that may need to modify, self.name = "tiger"

class Cat {
    var name: String
    init() {
        name = "Cat"
    }
}

class Tiger: Cat {
    var power: Int
    override init() {
        self.power = 10
        super.init()
        self.name = "tiger"
    }
}

let tiger = Tiger()
print(tiger.power)


// Can we omit the super.init() ? Possible
class Tiger1: Cat {
    var power: Int
    override init() {
        self.power = 10
        // if we do not modify "name"
        // super.init() will be called automatically
    }
}