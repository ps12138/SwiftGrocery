//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



//- (void)myMethod:(id)anObj {
//    @synchronized(anObj) {
//    // 在括号内 anObj 不会被其他线程改变
//    }
//}


func synchronized(_ lock: AnyObject, closure: () -> ()) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}


func myMethodLocked(anObj: AnyObject!) {
    synchronized(anObj) {
        // 在括号内 anObj 不会被其他线程改变
    }
}