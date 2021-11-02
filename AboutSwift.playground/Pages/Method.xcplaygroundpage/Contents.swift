//: [Previous](@previous)

import Foundation

/*
 함수: 함수는 작업의 가장 작은 단위이자 코드의 집합
 
 func 함수명(파라미터 이름: 데이터 타입) -> 반환 타입 {
    return 반환값
 }
 */

func sum(a: Int, b: Int) -> Int {
    return a+b
}

sum(a: 5, b: 2)

func hello() -> String {
    return "hello"
}

hello()

func printName() -> Void {
    print("Hello, Everyone!")
}
printName()

func greeting(friend: String, me: String = "Doyeon"){
    print("Hello, \(friend)! I'm \(me)")
}
greeting(friend: "Nayeon")

func sendMessage(from myName: String, to name: String) -> String {
    return "Hello \(name), I'm \(myName)"
}

//가변 매개변수
func friends(friends: String...) {
    print(friends)
}

friends(friends: "Jane", "Mike", "Jackson")
//: [Next](@next)
