//: [Previous](@previous)

import Foundation

/*
 Protocol 이름 {
 
 }
 
 
 */


protocol SomeProtocol {
    
}

protocol SomeProtocol1 {
    
}

struct SomeStructure: SomeProtocol, SomeProtocol1 {
    
}

//클래스
//class SomeClass: SuperClass, Firstprotocol, AnotherProtocol {
//
//}

protocol FirstProtocol {
    var name: Int { get set }
    var age: Int { get }
}

protocol AnotherProtocol {
    //typeproperty를 요규하려면 static 을 적어줘야한다.
    static var someTypeProperty: Int { get set }
}

protocol FullyNames {
    var fullName: String { get set }
    func printfullName()
}

struct Person: FullyNames {
    var fullName: String
    printfullName() {
        print(fullName)
    }
}

protocol SomeProtocol3 {
    func someTypeMethod()
}

protocol SomProtocol4 {
    init(someParameter: Int)
}
protocol SomeProtocol5 {
    init()
}

class SomeClass: SomeProtocol5 {
    required init() {
        // class 는 required 가 필요하고 struct 면 필요가없
        //final 키워드가 붙은 클래스도 필요가없다.
    }
}
//: [Next](@next)
