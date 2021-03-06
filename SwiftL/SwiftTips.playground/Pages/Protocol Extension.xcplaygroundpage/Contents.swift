//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// 实际中估计并不会有⼈将⼀个已知类型实例转回协议类型。
// 但是要考虑到如果你的⼀些泛型 API 中有类似的直接拿到⼀个协议类型的结果的时候，
// 调⽤它的扩展⽅法时就需要特别⼩⼼了：
// - ⼀般来说，如果有这样的需求的话，
//   我们可以考虑将这个协议类型再转回实际的类型，然后进⾏调⽤。

// - 如果类型推断得到的是实际的类型
//   那么类型中的实现将被调⽤；
//   如果类型中没有实现的话，那么协议扩展中的默认实现将被使⽤

// - 如果类型推断得到的是协议，⽽不是实际类型
//   并且⽅法在协议中进⾏了定义，那么类型中的实现将被调⽤；
//   如果类型中没有实现，那么协议扩展中的默认实现被使⽤
//   否则 (也就是⽅法没有在协议中定义)，扩展中的默认实现将被调⽤