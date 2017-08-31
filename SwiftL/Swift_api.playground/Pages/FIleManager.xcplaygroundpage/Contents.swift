//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// find a file
let mainBundle = Bundle.main

// If you specify an empty string or nil, the extension is assumed not to exist and all of the files in subpath are returned.
let file = mainBundle.path(forResource: "lnfo", ofType: nil)
let files = mainBundle.paths(forResourcesOfType: nil, inDirectory: "Resources")