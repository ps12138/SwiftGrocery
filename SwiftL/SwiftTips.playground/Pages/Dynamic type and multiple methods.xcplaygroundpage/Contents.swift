//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class Pet {}
class Cat: Pet {}
class Dog: Pet {}
func printPet(_ pet: Pet) {
    print("Pet")
}
func printPet(_ cat: Cat) {
    print("Meow")
}
func printPet(_ dog: Dog) {
    print("Bark")
}

// in the compile time, 
// compiler determine the method call
printPet(Cat()) // Meow
printPet(Dog()) // Bark
printPet(Pet()) // Pet


// 打印时的 Dog() 的类型信息
// 并没有被⽤来在运⾏时选择合适的 printPet(dog: Dog) 版本的⽅法，
// ⽽是被忽略掉，并采⽤了编译期间决定的 Pet 版本的⽅法。
// 因为 Swift 默认情况下是不采⽤动态派发的，
// 因此⽅法的调⽤只能在编译时决定。
func printThem(_ pet: Pet, _ cat: Cat) {
    printPet(pet)
    printPet(cat)
}
printThem(Dog(), Cat())
// Pet
// Meow


// 要想绕过这个限制
func printThem(_ pet: Pet, _ cat: Cat) {
    if let aCat = pet as? Cat {
        printPet(aCat)
    } else if let aDog = pet as? Dog {
        printPet(aDog)
    }
    printPet(cat)
}
// 输出：
// Bark
// Meow

