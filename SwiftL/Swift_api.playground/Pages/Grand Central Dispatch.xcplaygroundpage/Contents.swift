//: [Previous](@previous)

import Foundation
import UIKit


//: [Next](@next)



// -----------------------------------------------------------
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
print("_onceToken: \(_onceToken)")
let uuid = UUID().uuidString
let hashValue = uuid.hashValue
print("uuid: \(uuid)")
print("uuid.hashValue: \(hashValue)")

DispatchQueue.once(token: _onceToken) {
    print( "Do This Once!" )
}


// -------------------------------------------------


func testMain() {
    // async tailing closure
    DispatchQueue.main.async {
        print("mainQueue.async")
    }
    
    // async block
    let block = { () -> Void in
        print("mainQueue.async block")
    }
    DispatchQueue.main.async(execute: block)
    
    // async work item
    let block1 = {
        () -> () in
        print("mainQueue.async DispatchWorkItem")
    }
    let workItem = DispatchWorkItem(block: block1)
    DispatchQueue.main.async(execute: workItem)
    
    // async after time, add task into queue
    let time: TimeInterval = 1.0
    let block2 = { () -> Void in
        print("mainQueue.async dispatch deadline")
    }
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time, execute: block2)
}
testMain()



func testGlobal() {
    // async tailing closure
    DispatchQueue.global().async {
        print("GlobalQueue.async")
    }
    
    // async block
    let block = { () -> Void in
        print("GlobalQueue.async block")
    }
    DispatchQueue.global().async(execute: block)
    
    // async work item
    let block1 = {
        () -> () in
        print("GlobalQueue.async DispatchWorkItem")
    }
    let workItem = DispatchWorkItem(block: block1)
    DispatchQueue.global().async(execute: workItem)
    
    // async after time, add task into queue
    let time: TimeInterval = 1.0
    let block2 = { () -> Void in
        print("GlobalQueue.async dispatch deadline")
    }
    DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + time, execute: block2)
    
    // async after wallDeadline ???
    let walltime = DispatchWallTime(timespec: timespec.init(tv_sec: 20, tv_nsec: 10))
    let block3 = { () -> Void in
        print("GlobalQueue.async dispatch wallDeadline")
    }
    DispatchQueue.global().asyncAfter(wallDeadline: walltime, execute: block3)
}
testGlobal()


// create serial queue
let serialQueue = DispatchQueue(label: "serialQueue")
let serialQueue1 = DispatchQueue(__label: "serialQueue1", attr: nil)
// create concurrent queue
let concurrentQueue = DispatchQueue(label: "concurrentQueue1", attributes: .concurrent)



func addBarrier() {
    concurrentQueue.async {
        print("concurrentQueue: prev")
    }
    
    concurrentQueue.async(flags: .barrier) {
        print("concurrentQueue: barrier")
    }
    
    concurrentQueue.async {
        print("concurrentQueue: next")
    }
}

addBarrier()




/// DispatchGroup
let group = DispatchGroup()
let lastBlockGCD = { () -> Void in
    print("finish GCD \(Thread.current)")
}
var testBlock1 = { () -> Void in
    print("block 1 in \(Thread.current)")
}
var testBlock2 = { () -> Void in
    print("block 2 in \(Thread.current)")
}
var testBlock3 = { () -> Void in
    print("block 3 in \(Thread.current)")
}

var testBlocks = Array<() -> Void>()
testBlocks.append(contentsOf: [testBlock1, testBlock2, testBlock3])


for block in testBlocks {
    //let workItem = DispatchWorkItem(block: block)
    //queue.async(group: group, execute: workItem)
    concurrentQueue.async(group: group, execute: block)
}

group.notify(queue: concurrentQueue, execute: lastBlockGCD)







// comm between threads
func updateImageView(urlString: String, imageView: UIImageView?) {
    guard let imageView = imageView,
        let url = URL(string: urlString) else {
            return
    }
    DispatchQueue.global().async {
        
        if  let data = try? Data(contentsOf: url),
            let image = UIImage(data: data) {
            
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
    }
}



print("hehe")



