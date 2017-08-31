//: [Previous](@previous)

import Foundation
import UIKit
var str = "Hello, playground"

//: [Next](@next)


// AnyClass
// - the meta type of AnyObject
// - typealias AnyClass = AnyObject.Type

// fetch the meta type of a type
// .self 可以⽤在类型后⾯取得类型本⾝，
// 也可以⽤在某个实例后⾯取得这个实例本⾝。
// 前⼀种⽅法可以⽤来获得⼀个表⽰该类型的值，这在某些时候会很有⽤；
// ⽽后者因为拿到的实例本⾝，所以暂时似乎没有太多需要这么使⽤的案例。
class A {
    static func typeMethod() {
        print("Hehe")
    }
}
let typeA: A.Type = A.self
let anyClass: AnyClass = A.self

// fetch type method
typeA.typeMethod()
let typeB = anyClass as? A.Type
typeB?.typeMethod()


let a = A()
let insA = a.self

// for config given class
// 元编程的概念可以变得⾮常灵活和强⼤，
// 这在我们编写某些框架性的代码时会⾮常⽅便。⽐如我们想要传递⼀些类型的时候，
// 就不需要不断地去改动代码了。

// 在下⾯的这个例⼦中虽然我们是⽤代码声明的⽅式
// 获取了 MusicViewController 和 AlbumViewController 的元类型，
// 但是其实这⼀步骤完全可以通过读⼊配置⽂件之类的⽅式来完成的。
// ⽽在将这些元类型存⼊数组并且传递给别的⽅法来进⾏配置这⼀点上，
// 元类型编程就很难被替代了：
class MusicViewController: UIViewController { }
class AlbumViewController: UIViewController { }

let usingVCTypes: [UIViewController.Type] = [
    MusicViewController.self,
    AlbumViewController.self]

func setupViewControllers(_ vcTypes: [AnyClass]) {
    for type in vcTypes {
        if let vcType = type as? UIViewController.Type {
            let vc = vcType.init()
            print(vc)
        }
    }
}
setupViewControllers(usingVCTypes)

// 在 Cocoa API 中我们也常遇到需要⼀个 AnyClass 的输⼊，
// 这时候我们也应该使⽤ .self的⽅式来获取所需要的元类型，
// 例如在注册 tableView 的 cell 的类型的时候：

// .Type 表⽰的是某个类型的元类型，
// ⽽在 Swift 中，除了 class ， struct 和 enum 这三个类型外，
// 我们还可以定义 protocol 。对于 protocol 来说，有时候我们也会想取得协议的元类型。
// 这时我们可以在某个 protocol 的名字后⾯使⽤ .Protocol 来获取，
// 使⽤的⽅法和.Type 是类似的。


