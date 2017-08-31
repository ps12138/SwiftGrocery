//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/*
@implementation MyManager
+ (id)sharedManager {
    static MyManager * staticInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    staticInstance = [[self alloc] init];
    });
    return staticInstance;
}
@end
*/


class SingletonClass {
    static let shared = SingletonClass()
    private init() { }
}