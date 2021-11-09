//: [Previous](@previous)

import Foundation

class SomeClass {
    var count: Int = 0
}

struct SomeStruct {
    var count: Int = 0
}

var class1 = SomeClass()
var class2 = class1
var class3 = class1

class3.count = 2
class1.count


var struct1 = SomeStruct()
var struct2 = struct1
var struct3 = struct1

struct2.count = 3
struct3.count = 4

struct1.count
struct2.count
struct3.count
//: [Next](@next)
