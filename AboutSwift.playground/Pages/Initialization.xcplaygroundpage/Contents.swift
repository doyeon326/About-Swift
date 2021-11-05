//: [Previous](@previous)

import Foundation

/*
 초기화란? Initialization란?
 
 클래스나 구조체를 이용하기 위한 준비과정..
 이유: 생성자마자 초기값을 설정해줘야하기때문..
 
 init(매개변수: 타입, .... ) {
  //프로퍼티 초기호ㅑㅏ
  //인스턴스 생성시 필요한 설정을 해주는 코드 작성
 }
 
 */

class User {
    var nickname: String
    var age: Int
    
    init(nickname: String, age: Int) {
        self.nickname = nickname
        self.age = age
    }
    
    init(age: Int) {
        self.nickname = "mina"
        self.age = age
    }
    
    deinit {
        print("deinitialized! ")
    }
}
var user = User(nickname: "doyeon", age: 4)

user.nickname
user.age

var user2 = User(age: 18)
user2.age

var user3: User? = User(age: 1)
user3 = nil //인스턴스가 필요하지 않으면 메모리를 자동으로 관리 해지!

//반대 역활을 하는 아이 -> 인스턴스가 해지되기 직전에 부르는 아이 deinit

//: [Next](@next)
