//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



// 在调试时我们可以使⽤断⾔来排除类似这样的问题，
// 但是断⾔只会在 Debug 环境中有效，
// ⽽在Release 编译中所有的断⾔都将被禁⽤。
// 在遇到确实因为输⼊的错误⽆法使程序继续运⾏的时候，
// 我们⼀般考虑以产⽣致命错误 (fatalError) 的⽅式来终⽌程序。
// fatalError 的使⽤⾮常简单，它的 API 和断⾔的⽐较类似

/*
@noreturn func fatalError(@autoclosure message: () -> String = default,
    file: StaticString = default,
    line: UInt = default)
*/
// 关于语法，唯⼀要需要解释的是 @noreturn ，
// 这表⽰调⽤这个⽅法的话可以不再需要返回值，因为程序整个都将终⽌。