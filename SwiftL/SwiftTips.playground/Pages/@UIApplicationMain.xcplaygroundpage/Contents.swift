//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



// App entry
/*
int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil,
                                 NSStringFromClass([AppDelegate class]));
    }
}
*/

// 在这⾥我们调⽤了 UIKit 的 UIApplicationMain ⽅法。
// 这个⽅法将根据第三个参数初始化⼀个UIApplication 
// 或其⼦类的对象并开始接收事件 (在这个例⼦中传⼊ nil ，意味使⽤默认的UIApplication )。
// 最后⼀个参数指定了 AppDelegate 类作为应⽤的委托，
// 它被⽤来接收类似didFinishLaunching 或者 didEnterBackground 
// 这样的与应⽤⽣命周期相关的委托⽅法。
// 另外，虽然这个⽅法标明为返回⼀个 int ，
// 但是其实它并不会真正返回。
// 它会⼀直存在于内存中，直到⽤户或者系统将其强制终⽌。