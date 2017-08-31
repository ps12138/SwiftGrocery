//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)


// Create

// default OperationQueue() is a concurrent OperationQueue
let op1 = OperationQueue()
op1.name = "op1"
//op1.maxConcurrentOperationCount = 5
op1.qualityOfService = .default


// 1.setting underlyingQueue based on DispatchQueue
//The value of this property should only be set if there are no operations in the queue; setting the value of this property when operationCount is not equal to 0 raises an invalidArgumentException. The value of this property must not be the value returned by dispatch_get_main_queue(). The quality-of-service level set for the underlying dispatch queue overrides any value set for the operation queue's qualityOfService property.
let serialQueue = DispatchQueue(label: "serialQueue")
let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)



op1.underlyingQueue = serialQueue
//op1.underlyingQueue = concurrentQueue

// 2. 最大并发数
op1.maxConcurrentOperationCount = 1

// 3. Suspended
op1.isSuspended = false
// 任务开始后没发暂停，比如for 5000 次，一半的时候暂停，for也会执行全部5000次
/*
When the value of this property is false, 
the queue actively starts operations that are in the queue and ready to execute. 
 
Setting this property to true prevents the queue from starting any queued operations, 
but already executing operations continue to execute. 
 
You may continue to add operations to a queue that is suspended 
but those operations are not scheduled for execution until you change this property to false.
*/


// 4. cancel all operations
op1.cancelAllOperations()
/*
Cancels all queued and executing operations.
This method calls the cancel() method on all operations currently in the queue.
Canceling the operations does not automatically remove them from the queue or stop those 
that are currently executing.
*/


// 5. 等待全部任务完成再回到当前线程

//阻塞当前线程直到此队列中的所有任务执行完毕
//[queue waitUntilAllOperationsAreFinished]; NSLog(@"all done");
//op1.waitUntilAllOperationsAreFinished()


// 6. addOperation
print("init in \(Thread.current)")

typealias BlockType = () -> Void
var block1: BlockType = {
    print("block 1 in \(Thread.current)")
}
var block2: BlockType = {
    print("operation2 in \(Thread.current)")
}

op1.addOperation(block1)
op1.addOperation {
    print("block 1 - 1 in \(Thread.current)")
}

let operation2 = BlockOperation(block: block2)
op1.addOperation(operation2)


// 7. add Operation dependency
let finishBlockOp = BlockOperation {
    print("finish operation2 \(Thread.current)")
}
finishBlockOp.addDependency(operation2)
op1.addOperation(finishBlockOp)


// 8. add completion block
// The exact execution context for your completion block 
// is not guaranteed but is typically a secondary thread.

let operation3 = BlockOperation { 
    () -> Void in
    print("operation 3 in \(Thread.current)")
}
operation3.completionBlock = {
    () -> Void in
    print("completion block of operation 3 in \(Thread.current)")
}

op1.addOperation(operation3)


// 9. subclass of operation
class DwOperation: Operation {
    // MARK: - Properties
    var downloadedImage: UIImage?
    var urlStr: NSString?
    
    // MARK: - func for running
    override func main() -> Void {
        // if cancelled itself
        if (self.isCancelled) {
            return
        }
        
        guard let validUrlStr = urlStr,
            let validUrl = URL(string: validUrlStr as String)
            else {
                return
        }
        // if cancelled itself
        if (self.isCancelled) {
            return
        }
        // tring to download the data and transfer to UIImage
        // TODO: Something
        print("I'm DwOperation with url: \(validUrl) in \(Thread.current)")
    }
}
let task = DwOperation()
task.urlStr = "11"
weak var weakTask = task  // break retain cycle
task.completionBlock = {
    print("finish task with url \(weakTask?.urlStr) in \(Thread.current)")
    
}
op1.addOperation(task)



