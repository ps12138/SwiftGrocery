//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// Apple ⾃⼰的框架都是 .framework 为后缀的动态框架，
// 是集成在操作系统中的，我们使⽤这些框架的时候
// 只需要在 target 配置时进⾏指明就可以，⾮常⽅便。

// 因为 framework 的易⽤性，因此很多开发者都很喜欢类似的
// “即拖即⽤，⽆需配置”的体验。⼀些框架和库的开发者
// 为了使⽤体验⼀般会⽤⼀些第三⽅提供的⽅法来模拟地⽣成⾏为类似的框架，
// ⽐如 Dropbox 或者 Facebook 的 iOS SDK 都是基于这种技术完成的。

// 但是要特别指出，虽然和 Apple 的框架的后缀名⼀样是 .framework ，
// 使⽤⽅式也类似，但是这些第三⽅框架都是实实在在的静态库，
// 每个 app 需要在编译的时候进⾏独⽴地链接。