//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// Introspection - 解决 "我是谁" 这个问题。
// 向⼀个对象发出询问，以确定它是不是属于某个类，这种操作就称为⾃省。
// 在 Objective-C 中因为id 这样的可以指向任意对象的指针的存在 
// (其实严格来说 Objective-C 的指针的类型都是可以任意指向和转换的，
// 它们只不过是帮助编译器理解你的代码⽽已)，
// 我们经常需要向⼀个对象询问它是不是属于某个类。常⽤的⽅法有下⾯两类：
// [obj1 isKindOfClass:[ClassA class]];
// [obj2 isMemberOfClass:[ClassB class]];


// -isKindOfClass: 判断 obj1 是否是 ClassA 或者其⼦类的实例对象；
// ⽽ isMemberOfClass: 则对obj2 做出判断，
// 当且仅当 obj2 的类型为 ClassB 时返回为真。

// for subclass of NSObject
class ClassA: NSObject { }
class ClassB: ClassA { }
let obj1: NSObject = ClassB()
let obj2: NSObject = ClassB()
obj1.isKind(of: ClassA.self) // true
obj2.isMember(of: ClassA.self) // false


// Swift 提供了⼀个简洁的写法：对于⼀个不确定的类型，
// 我们现在可以使⽤ is 来进⾏判断。 
// is 在功能上相当于原来的 isKindOfClass ，
// 可以检查⼀个对象是否属于某类型或其⼦类型。 
// is 和原来的区别主要在于亮点，⾸先它不仅可以⽤于 class 类型上，
// 也可以对Swift 的其他像是 struct 或 enum 类型进⾏判断。

class ClassA1 { }
class ClassB1: ClassA1 { }
let obj: AnyObject = ClassB1()
if (obj is ClassA1) {
    print("belong ClassA")
}
if (obj is ClassB1) {
    print("belong ClassB")
}


