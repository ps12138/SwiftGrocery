//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// 可以让我们不直接使⽤实例来调⽤这个实例上的⽅法，
// ⽽是通过类型取出这个类型的某个实例⽅法的签名，
// 然后再通过传递实例来拿到实际需要调⽤的⽅法。
// ⽐如我们有这样的定义：

class MyClass {
    func method(number: Int) -> Int {
        return number + 1
    }
    
    static func method(number: Int) -> Int {
        return number
    }
}

// normal calling
let object = MyClass()
let result = object.method(number: 1)
// result = 2

let f: (MyClass) -> (Int) -> Int = MyClass.method
let object1 = MyClass()
let result1 = f(object1)(1)


let f1 = MyClass.method
// static func method 的版本
let f2: (Int) -> Int = MyClass.method
// 和 f1 相同
let f3: (MyClass) -> (Int) -> Int = MyClass.method
// func method 的柯⾥化版本