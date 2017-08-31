//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)


/// Objective C

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

class TestClass {
    lazy var value = 8
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        let rect = CGRect(x: 0, y: 0, width: 20, height: 20)
        label.frame = rect
        label.text = "myTitle"
        label.backgroundColor = UIColor.blue
        return label
    }()
}

// map/flatmap filter
let nums = [1, 2, 3, 4, 5]
let result = nums.lazy.map {
    (i: Int) -> Int in
    print("processing \(i)")
    return i * 2
}

print("ready")
for i in result {
    print("res = \(i)")
}
print("end")


/// using 
/*
 public var lazy: LazyCollection<Self> { get }
 public var lazy: LazyRandomAccessCollection<Self> { get }
 public var lazy: LazyBidirectionalCollection<Self> {
    get }
 public var lazy: LazyForwardCollection<Self> { get }
*/








