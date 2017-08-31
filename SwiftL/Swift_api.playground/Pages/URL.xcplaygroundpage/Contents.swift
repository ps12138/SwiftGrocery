//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



//let urlSession = URLSession()
//let url = URL(string: "https://www.hehe.com")!


// URL
let url = URL(string: "https://www.hehe.com")
let url2 = URL(string: "haha", relativeTo: url)



// file URL?
let fileUrl1 = Bundle.main.url(forResource: "fileName", withExtension: "ext")
let fileUrl2 = Bundle.main.url(forResource: "fileName", withExtension: "ext", subdirectory: "subDirName", localization: " languageIDforLocalization")


// file URLs?
let fileUrls1 = Bundle.main.urls(forResourcesWithExtension: "ext", subdirectory: "subDirName")

let fuleUrls2 = Bundle.main.urls(forResourcesWithExtension: "ext", subdirectory: "sibDirName", localization: "languageIDforLocalization")


// file URL
let bundlePath = Bundle.main.bundlePath
let path1 = Bundle.main.path(forResource: "subway-lister", ofType: "json")!
let fileUrl3 = URL(fileURLWithPath: path1)
print("fileUrl3: \(fileUrl3)")

// dir url
let dirUrl1 = URL(fileURLWithPath: bundlePath, isDirectory: true)
print("path: \(bundlePath)")
print("dirUrl1: \(dirUrl1)")



