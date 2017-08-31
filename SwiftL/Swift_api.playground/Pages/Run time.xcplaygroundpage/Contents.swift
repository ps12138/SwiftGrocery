//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)

class TestSwizzling : NSObject {
    dynamic func methodOne(_ num: Int) -> Int{
        print("methodOne")
        return 1
    }
}

extension TestSwizzling {
    func methodTwo(_ num: Int) -> Int{
        print("methodTwo")
        return 2
    }
}

let doSwizzling: (TestSwizzling.Type) -> Void = { (aClass) -> Void in
    let originalSelector = #selector(aClass.methodOne(_ :))
    let swizzledSelector = #selector(aClass.methodTwo(_ :))
    
    let originalMethod = class_getInstanceMethod(aClass, originalSelector)
    let swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}


var c = TestSwizzling()
doSwizzling(type(of: c))
c.methodOne(0) // print: methodTwo
c.methodTwo(0) // print: methodOne






private let swizzling: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
    let originalMethod = class_getInstanceMethod(forClass, originalSelector)
    let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
    method_exchangeImplementations(originalMethod, swizzledMethod)
}


class MyUIView: UIView {
    
}

extension MyUIView {
    func swizzled_layoutSubview1() {
        //swizzled_layoutSubviews()
        print("swizzled_layoutSubviews 1")
    }
    
    func swizzled_layoutSubview2() {
        print("swizzled_layoutSubviews 2")
    }
}


let myView = MyUIView()
let originalSelector = #selector(myView.swizzled_layoutSubview1)
let swizzledSelector = #selector(myView.swizzled_layoutSubview2)
swizzling(type(of: myView), originalSelector, swizzledSelector)

myView.swizzled_layoutSubview1()
myView.swizzled_layoutSubview2()


// swizzling is forever
let myView2 = MyUIView()
myView2.swizzled_layoutSubview1()
myView2.swizzled_layoutSubview2()






// Dispatch Once in swift 3

public extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    public class func once(token: String, block:()->Void) {
        // add sync lock
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}


DispatchQueue.once(token: "com.vectorform.test") {
    print( "Do This Once!" )
}

private let _onceToken = NSUUID().uuidString

DispatchQueue.once(token: _onceToken) {
    print( "Do This Once!" )
}