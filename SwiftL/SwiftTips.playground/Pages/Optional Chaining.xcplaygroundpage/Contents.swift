//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// Optional Chaining 可以让我们摆脱很多不必要的判断和取值，
// Optional Chaining 是随时都可能提前返回 nil 的，
// 所以使⽤ Optional Chaining 所得到的东⻄其实都是 Optional 的。

//
class Pet {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Child {
    var pet: Pet?
}

let xiaoming = Child()
let toyName = xiaoming.pet?.name // "String?"

extension Pet {
    func play() {
        print("Pet.play()")
    }
}

xiaoming.pet = Pet(name: "111")

// not sure play() is called
xiaoming.pet?.play()

// not sure play() is called
let playClosure = { (child: Child) -> () in
    child.pet?.play()
}

// make sure we can know play() is called
let playClosureValidation = { (child: Child) -> Void? in
    child.pet?.play()
}

// if result is (), child.pet?.play() is called
// because, last one line method will be as the return
if let result: () = playClosureValidation(xiaoming) {
    print("play is called")
} else {
    print("play is not called")
}



