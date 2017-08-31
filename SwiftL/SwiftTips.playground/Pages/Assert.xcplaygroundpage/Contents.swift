//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// assert

/*
 func assert(@autoclosure condition: () -> Bool,
    @autoclosure _ message: () -> String = default,
    file: StaticString = default,
    line: UInt = default)
 */


// 在遇到⽆法处理的输⼊时，运⾏会产⽣错误，保留堆栈，并抛出我们预设的信息，
// ⽤来提醒调⽤这段代码的⽤户。
// 断⾔的另⼀个优点是它是⼀个开发时的特性，只有在 Debug 编译的时候有效，
// ⽽在运⾏时是不被编译执⾏的，因此断⾔并不会消耗运⾏时的性能。
// 这些特点使得断⾔成为⾯向程序员的在调试开发阶段⾮常合适的调试判断，
// ⽽在代码发布的时候，我们也不需要刻意去将这些断⾔⼿动清理掉，⾮常⽅便。