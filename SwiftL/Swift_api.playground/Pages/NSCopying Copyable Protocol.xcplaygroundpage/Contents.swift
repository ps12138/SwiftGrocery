//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// from http://stackoverflow.com/questions/24242629/implementing-copy-in-swift

/// if the class is inherited from NSObject
/// conforming NSCopying
class MyRootClass: NSObject {
    /// create a copy if the object implements NSCopying, crash otherwise
    override func copy() -> Any {
        guard let asCopying = ((self as AnyObject) as? NSCopying) else {
            fatalError("This class doesn't implement NSCopying")
        }
        
        return asCopying.copy(with: nil)
    }
}

class A : MyRootClass { }
class B : MyRootClass, NSCopying {
    
    func copy(with zone: NSZone? = nil) -> Any {
        return B()
    }
}
var b = B()
var a = A()

let bCopy = b.copy()  //will create a copy
//a.copy()  //will fail
print(b)
print(bCopy)



/// if the class is Swift Foundation
protocol Copyable: class {
    associatedtype T
    func copy() -> T
    func setup(instance: T) -> T
}


class RootClass {
    var value: Int = 1
    init() { }
    init(copy otherInstance: RootClass) {
        self.value = otherInstance.value
    }
    func copy() -> RootClass {
        return RootClass(copy: self)
    }
}

let root1 = RootClass()
root1.value = 10
let root1Copy = root1.copy()
root1Copy.value = 100
print(root1.value)
print(root1Copy.value)

class SubClass: RootClass {
    var num: Int = 2
    override init() {
        super.init()
    }
    init(copy otherInstance: SubClass) {
        super.init(copy: otherInstance)
        self.num = otherInstance.num
    }
    override func copy() -> SubClass {
        return SubClass(copy: self)
    }
}

let sub1 = SubClass()
sub1.value = 10
sub1.num = 20
let sub2 = sub1.copy()
sub2.value = 100
sub2.num = 200
print("sub1:  \(sub1.value) \(sub1.num)")
print("sub2:  \(sub2.value) \(sub2.num)")





/// cannot work properly for subclass
protocol Copyable2 {
    func copy() -> Self
}


class MyClass: Copyable2 {
    var num = 1
    func copy() -> Self {
        let result = type(of: self).init()
        result.num = num
        return result
    }
    
    required init() { }
}

let object = MyClass()
object.num = 100

let newObject = object.copy()
newObject.num = 10

print("object.num: \(object.num)")
print("newObject.num: \(newObject.num)")







