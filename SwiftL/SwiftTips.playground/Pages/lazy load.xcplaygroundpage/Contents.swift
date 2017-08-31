//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// Objective-C
/*
 
 // ClassA.h
 @property (nonatomic, copy) NSString *testString;
 
 // ClassA.m
 - (NSString *)testString {
 if (!_testString) {
 _testString = @"Hello";
 NSLog(@"只在⾸次访问输出");
 }
 return _testString;
 }
 */

class ClassA {
    lazy var str0: String = "Hello"
    
    lazy var str: String = {
        let str = "Hello"
        print("只在⾸次访问输出")
        return str
    }()
}


// 如果我们先进⾏⼀次 lazy 操作的话，我们就能得到延时运⾏版本的容器
// every map mehtod for every element is lazy load
let data = 1...3
let result = data.lazy.map {
    (i: Int) -> Int in
    print("正在处理 \(i)")
    return i * 2
}
print("准备访问结果")
for i in result {
    print("操作后结果为 \(i)")
}
print("操作完毕")

// 正在处理 1
// 正在处理 2
// 正在处理 3
// 准备访问结果
// 操作后结果为 2
// 操作后结果为 4
// 操作后结果为 6
// 操作完毕