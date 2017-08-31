//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



// Playground 其实是可以⽤在项⽬⾥的，通过配置，
// 我们是可以做到让 Playground 使⽤项⽬中已有的代码的。
// 直接说结论的话，我们需要满⾜以下的⼀些条件：
//1. Playground 必须加⼊到项⽬之中，单独的 Playground 是不能使⽤项⽬中的已有代码的；
// 最简单的⽅式是在项⽬中使⽤ File -> New -> File... 然后在⾥⾯选择 Playground。注意不要直接选择 File -> New -> Playground...，否则的话你还需要将新建的 Playground 拖到项⽬中来。

// 2. 想要使⽤的代码必须是通过 Cocoa (Touch) Framework 以⼀个单独的 target 的⽅式进⾏组织的；
// 3. 编译结果的位置需要保持默认位置，即在 Xcode 设置中的 Locations ⾥ Derived Data 保持默认值；
// 4. 如果是 iOS 应⽤，这个框架必须已经针对 iPhone 5s Simulator 这样的 64 位的模拟器作为⽬标进⾏过编译；
// iOS 的 Playground 其实是运⾏在 64 位模拟器上的，
// 因此为了能找到对应的符号和执⾏⽂件，
// 框架代码的位置和编译架构都是有所要求的。在满⾜这些条件后，
// 就可以在 Playground 中通过 import 你的框架 module 名字来导⼊代码，
