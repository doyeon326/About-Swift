//: [Previous](@previous)

import Foundation

//assert & guard
//
//var value = 0
//assert(value == 0)
//
//value = 2
//assert(value == 0, "값이 0이 아닙니다")

func guardTest(value: Int) {
    guard value == 0 else { return }
    print("안녕하세요")
}

guardTest(value: 2)

//: [Next](@next)
