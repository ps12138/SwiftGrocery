//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// Objective-C init
// init ⽅法除了返回 self 以外，其实和⼀个普通的实例⽅法并没有太⼤区别。
// 如果你喜欢的话，甚⾄可以多次进⾏调⽤，这都没有限制。
// ⼀般来说，我们还会在初始化失败 (⽐如输⼊不满⾜要求⽆法正确初始化) 的时候
// 返回 nil 来通知调⽤者这次初始化没有正确完成。

// Swift default init
// 在 Swift 中默认情况下初始化⽅法是不能写 return 语句来返回值的，
// 也就是说我们没有机会初始化⼀个 Optional 的值。
// ⼀个很典型的例⼦就是初始化⼀个 url。在 Objective-C 中，
// 如果我们使⽤⼀个错误的字符串来初始化⼀个 NSURL 对象时，
// 返回会是 nil 代表初始化失败。
// 所以下⾯这种 "防⽌度娘吞链接" 式的字符串 
// (注意两个 t 之间的空格和中⽂的句号) 的话，
// 也是可以正常编译和运⾏的，只是结果是个 nil ：

/*
 Objective C
 NSURL *url = [[NSURL alloc] initWithString:@"ht tp://swifter。tips"];
 NSLog(@"%@",url);
*/

// swift equivalent
let url = NSURL(string: "ht tp://swifter565tips")
print(url)


// For swift we can
class ClassA {
    let num: Int
    
    init(num: Int) {
        self.num = num
    }
    
    init?(str: String) {
        if let num = Int(str) {
            self.num = num
        } else {
            return nil
        }
    }
    
    convenience init?(str1: String, str2: String) {
        guard let num1 = Int(str1),
            let num2 = Int(str2)
            else {
                return nil
        }
        self.init(num: num1 + num2)
    }
}





