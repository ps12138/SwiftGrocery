//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// Swift 写的 class 是继承⾃ NSObject 的话，
// Swift 会默认⾃动为所有的⾮ private 的类和成员加上@objc 。
// 这就是说，对⼀个 NSObject 的⼦类，
// 你只需要导⼊相应的头⽂件就可以在 Objective-C⾥使⽤这个类了。

// @objc 修饰符的另⼀个作⽤是为 Objective-C 侧重新声明⽅法或者变量的名字。
// 虽然绝⼤部分时候⾃动转换的⽅法名已经⾜够好⽤ 
// (⽐如会将 Swift 中类似 init(name: String) 的⽅法
// 转换成 -initWithName:(NSString *)name 这样)，
// 但是有时候我们还是期望 Objective-C ⾥使⽤和 Swift 中不⼀
// 样的⽅法名或者类的名字，


class 我的类: NSObject {
    func 打招呼(名字: String) {
        print("哈喽，\(名字)")
    }
}
我的类().打招呼(名字: "⼩明")

// 这样，我们在 Objective-C ⾥就能调⽤ [[MyClass new] greeting:@"XiaoMing"] 这样的代码了
@objc(MyClass)
class 我的类1: NSObject {
    @objc(greeting:)
    func 打招呼(名字: String) {
        print("哈喽，\(名字)")
    }
}