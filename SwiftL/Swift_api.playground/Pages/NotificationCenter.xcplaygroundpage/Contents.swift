//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class TestClass1 {
    var hehe = 1
}

print("TestClass1: \(TestClass1())")
print("TestClass1: \(TestClass1().self)")
print("TestClass1: \(type(of: TestClass1()))")

//print("TestClass1: \(TestClass1())")


class MyClass: Hashable {
    static var nextUid = 1
    static func generateUid() -> Int {
        nextUid += 1
        return nextUid
    }
    
    let uid: Int
    var myName: String
    var myAge:Int
    var hashValue: Int {
        return self.uid
    }
    init(name: String, age: Int) {
        self.uid = MyClass.generateUid()
        self.myName = name
        self.myAge = age
    }
    init() {
        self.uid = MyClass.generateUid()
        self.myName = ""
        self.myAge = 0
    }

    static func==(left: MyClass, right: MyClass) -> Bool {
        return left === right
    }
}


print("MyClass: \(MyClass().hashValue)")
print("MyClass: \(MyClass().hashValue)")
print("MyClass: \(MyClass().hashValue)")


//


protocol ResponseNotification: class {
    func receiveNotification(key: String) -> Void
}


extension MyClass: ResponseNotification {
    func receiveNotification(key: String) {
        
    }
}



class MyNotificationCenter {
    typealias Observer = (String) -> Void
    var dict = Dictionary<String, Set<MyClass>>()
    var dict2 = Dictionary<String, Dictionary<MyClass, Observer>>()
    
    func addObserver(key: String, aClass: MyClass, block: Observer) {
        
    }
    
    
    func removeObserver(key: String, aClass: MyClass) {
        
    }
    
    func post(key: String) {
    
    }
}




