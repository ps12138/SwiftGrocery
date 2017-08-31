//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)




class MyClass: Hashable {
    var val: Int = 0
    var hashValue: Int {
        get {
            return val
        }
    }
    
    static func ==(left: MyClass, right: MyClass) -> Bool {
        return left === right
    }
}

let class0 = MyClass()

let class1 = MyClass()
class1.val = 10

let class2 = MyClass()
class2.val = 20



var set = Set<MyClass>()
set.insert(class0)
set.insert(class1)
set.insert(class2)


//set.forEach { (element) in
//    print(element, element.hashValue)
//}



func addSet<T: Hashable>(with elements: [T]) -> Set<T> {
    var set = Set<T>()
    elements.forEach { (element) in
        set.insert(element)
    }
    
    set.forEach { (element) in
        print("addSet: \(element.hashValue)")
    }
    print("\n")
    return set
}

let array = addSet(with: [class0, class1, class2, class0, class2])


