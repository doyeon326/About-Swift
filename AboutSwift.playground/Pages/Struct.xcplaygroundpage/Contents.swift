//: [Previous](@previous)

import Foundation
/*
 
 대부분의 언어에서는 구조체와 클래스가 존재한다. 스위프트에서는 문법이 거의 같지만 차이점은 존재한다.
 구조체는 값타입(value type)이고, 클래스는 참조타입(reference type)이라는 점이다.

 - 구조체는 struct 이라는 키워드를 쓰고

 - 클래스는 class 이라는 키워드를 쓴다.

 ﻿
 
 */
struct User {
    var nickname: String
    var age: Int
    
    func information() {
        print("\(nickname) is \(age) years old.")
    }
}

var user = User(nickname: "doyeon", age: 13)

print(user.nickname)
user.nickname = "albert"
print(user.nickname)

user.information()

//: [Next](@next)
