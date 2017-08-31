 //: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class TestClass {
    var hehe: Int?
    let haha: Int
    
    init() {
        self.haha = 10
        self.hehe = 11
    
    }
    
    func test() {
        print(haha)
    }
    func change() {
        hehe = 100
    }
}

let test1 = TestClass()
test1.hehe
test1.change()
test1.hehe
let test2 = TestClass()
test2.hehe

func testRef(class class1: TestClass) {
    class1.hehe = 20
}
test1.hehe
testRef(class: test1)
test1.hehe


func testRef2(class2: inout TestClass) {
    class2 = TestClass()
}
var test3 = test1

test3.hehe

testRef2(class2: &test3)
test3.hehe
test1.hehe


Array<Int>()
Set<Int>()
String() 
Dictionary<Int, Int>()


var hehe: Int? = 0
var haha = 1

hehe = nil



var res1: Int? = Optional.none
var res2: Int? = nil
var res3: Int? = Optional.some(3)
print(res1 ?? "res1 nil")
print(res2 ?? "res2 nil")
print(res3 ?? "res3 nil")
print(haha)

//let res11 = res1!
res3 = nil
//let res33 = res3!



var currentTitle: String? = nil
currentTitle = ""

if let validTitle = currentTitle {
    print("after \(validTitle)")
    print(currentTitle ?? "nil")
} else {
    print("I am nil")
}
 
 
 
 
 
 
 class TestLazyLoadOptional {
    lazy var lazyInt: Int? = { () -> Int? in
        return 10
    }()
    lazy var hehe: String? = nil
 }
 
 let testLazyLoadOptional = TestLazyLoadOptional()
 print(testLazyLoadOptional.lazyInt ?? 0)
 testLazyLoadOptional.lazyInt = 100
 
 
 
 
 /// unwrap
 
 var unwrap: Int? = nil
 func unwrapFunc(input: Int?) {
    print("input: \(input)")
 }
 
 unwrapFunc(input: unwrap)
 
 
