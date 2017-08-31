//: [Previous](@previous)

import Foundation
import UIKit
var str = "Hello, playground"

//: [Next](@next)


#if os(macOS)
    typealias Color = NSColor
#else
    typealias Color = UIColor
#endif

/*
⽅法可选参数
os() macOS, iOS, tvOS, watchOS, Linux
arch() x86_64, arm, arm64, i386
swift() >= 某个版本
 */