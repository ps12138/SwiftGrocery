//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// Objective C, init
// 在 Objective-C 中， init ⽅法是⾮常不安全的：
// 没有⼈能保证 init 只被调⽤⼀次，
// 也没有⼈保证在初始化⽅法调⽤以后实例的各个变量都完成初始化，
// 甚⾄如果在初始化⾥使⽤属性进⾏设置的话，还可能会造成各种问题，
// 虽然 Apple 也明确说明了不应该在 init 中使⽤属性来访问，
// 但是这并不是编译器强制的，因此还是会有很多开发者犯这样的错误。

// Don’t Use Accessor Methods in Initializer Methods and dealloc
// https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/mmPractical.html#//apple_ref/doc/uid/TP40004447-SW6
/*
- init {
    self = [super init];
    if (self) {
        _count = [[NSNumber alloc] initWithInteger:0];
    }
    return self;
}

- initWithCount:(NSNumber *)startingCount {
    self = [super init];
    if (self) {
        _count = [startingCount copy];
    }
    return self;
}

- (void)dealloc {
        [_count release];
        [super dealloc];
}
*/


// Swift init
// init ⾥我们可以对 let 的实例常量进⾏赋值，这是初始化⽅法的重要特点。
// 在 Swift 中 let 声明的值是常量，⽆法被写⼊赋值，
// 这对于构建线程安全的 API ⼗分有⽤。
// ⽽因为 Swift 的 init 只可能被调⽤⼀次，
// 因此在 init 中我们可以为常量进⾏赋值，⽽不会引起任何线程安全的问题。

// Swift "designated init"
// - first class init


// Swift "convenience init"
// - second class init, as the supplement init
// - cannot be overrided by subclass
// - cannot be called by subclass with "super.convenience init"
// - "convenience init" must call "self.designated init" to make sure
//   super class is initialized

// Swift "required init"
// - 对于某些我们希望⼦类中⼀定实现的 designated 初始化⽅法，
//   我们可以通过添加 required 关键字进⾏限制，强制⼦类对这个⽅法重写实现。
//   这样做的最⼤的好处是可以保证依赖于某个designated 初始化⽅法
//   的 convenience ⼀直可以被使⽤
// - 对于 convenience 的初始化⽅法，
//   我们也可以加上 required 以确保⼦类对其进⾏实现。
//   这在要求⼦类不直接使⽤⽗类中的convenience 初始化⽅法时会⾮常有帮助。


class ClassA {
    let num: Int
    required init(num: Int) {
        self.num = num
    }
    required convenience init(num1: Int, num2: Int) {
        self.init(num: num1 + num2)
    }
}

class ClassB: ClassA {
    let num1: Int
    required init(num: Int) {
        self.num1 = 2
        super.init(num: num)
    }
    
    required convenience init(num1: Int, num2: Int) {
        self.init(num: num1 * num2)
    }
}

let classB = ClassB(num1: 3, num2: 3)
classB.num1
classB.num



