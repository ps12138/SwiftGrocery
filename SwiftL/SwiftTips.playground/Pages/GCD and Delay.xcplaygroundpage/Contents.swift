//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


let time: TimeInterval = 2.0
DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
    print("2 秒后输出")
}



// 在 iOS 8 中 GCD 得到了惊⼈的进化，
// 现在我们可以通过将⼀个闭包封装到 DispatchWorkItem 对象中，
// 然后对其发送 cancel ，来取消⼀个正在等待执⾏的 block 。
// 取消⼀个任务这样的特性，这在以前是 NSOperation 的专利，
// 但是现在我们使⽤ GCD 也能达到同样的⽬的了。
// 这⾥我们不使⽤这个⽅式，⽽是通过捕获⼀个 cancel 标识变量
// 来实现 delay call 的取消，整个封装也许有点长，

typealias Task = (_ cancel : Bool) -> Void

func delay(_ time: TimeInterval, task: @escaping ()->()) -> Task? {
    
    func dispatch_later(block: @escaping ()->()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    
    var closure: (()->Void)? = task
    var result: Task?
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    return result;
}
func cancel(_ task: Task?) {
    task?(true)
}

// 使⽤的时候就很简单了，我们想在 2 秒以后⼲点⼉什么的话：
delay(2) { print("2 秒后输出") }
// 想要取消的话，我们可以先保留⼀个对 Task 的引⽤，然后调⽤ cancel ：
let task = delay(5) { print("拨打 110") }
// 仔细想⼀想..
// 还是取消为妙..
cancel(task)


