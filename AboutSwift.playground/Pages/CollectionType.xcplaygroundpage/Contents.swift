//: [Previous](@previous)

import Foundation

//https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html

/*
 Collection Types : Swift provides three primary collection types, known as arrays, sets, and dictionaries, for storing collections of values.

- Arrays: are ordered collections of values.
- Sets: are unordered collections of unique values.
- Dictionaries: are unordered collections of key-value associations.
 */

var numbers: Array<Int> = Array<Int>()
let someString: [String] = []

numbers.append(1)
numbers.append(2)
numbers.append(3)

numbers[0]
numbers[1]
//Array insertion
numbers.insert(4, at: 2)
numbers
//Array delete
numbers.remove(at: 0)
numbers

//Dictionary: storing list of key and value
var dic: Dictionary<String, Int> = Dictionary<String,Int>()
var dicshort: [String: Int] = [:]
var dicShortInit: [String: Int] = ["hello": 3]

dic["hi"] = 1
dic["tired"] = 5
dic

dic["hi"] = 4
dic

dic.removeValue(forKey: "hi")
dic

//Set = cannot be duplicated value
var set: Set = Set<Int>() //축약형 X

set.insert(10)
set.insert(20)
set.insert(30)
set.insert(30)
set

set.remove(20)
set

//: [Next](@next)
