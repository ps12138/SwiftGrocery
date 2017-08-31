//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// @nonescaping block
// 参数中 block 的内容会在 method返回前就完成。
// 也就是说，对于 block 的调⽤是同步⾏为。

// @escaping block
// 因为@nonescaping闭包的作⽤域不会超过函数本⾝，
// 所以我们不需要担⼼在闭包内持有 self 等。
// ⽽接受 @escaping 的 block 则有所不同。
// 由于需要确保闭包内的成员依然有效，
// 如果在闭包内引⽤了 self 及其成员的话，Swift 将强制我们明确地写出 self

// 如果你在协议或者⽗类中定义了⼀个接受 @escaping 为参数⽅法，
// 那么在实现协议和类型或者是这个⽗类的⼦类中，
// 对应的⽅法也必须被声明为@escaping ，
// 否则两个⽅法会被认为拥有不同的函数签名：

protocol P {
    func work(b: @escaping () -> ())
}

class C: P {
    func work(b: @escaping () -> ()) {
        DispatchQueue.main.async {
            print("in C")
            b()
        }
    }
    
    func workLikeNonesc(b: @escaping ()->()) {
        print("Go into: workLikeNonesc")
        b()
        print("Exit: workLikeNonesc")
    }
}

//class C1: P {
//    func work(b: () -> ()) {
//        print("C1 didnot confirm P")
//    }
//}



let c = C()
c.workLikeNonesc {
    print("block b")
    print(Thread.current)
}





