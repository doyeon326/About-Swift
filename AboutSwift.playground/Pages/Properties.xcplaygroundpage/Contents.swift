//: [Previous](@previous)

import Foundation

/*


 
 * 저장 프로퍼티 (변수 또는 상수)
 * 연산 프로퍼티 (값 저장 ㄴㄴ)
 * 타입 프로퍼티
 
 */

//저장 프로퍼티 = 클래스 구조체만가능
struct Dog {
    var name: String
    let gender: String
}

var dog = Dog(name: "Sally", gender: "Male")
print(dog)

//값이 저장된걸 저장 프로퍼티라고 불린다.

dog.name = "MEME"

class Cat {
    var name: String
    let gender: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
    }
}

let cat = Cat(name: "json", gender: "male")
cat.name = "mike"
print(cat.name)

//계산프로퍼티 = 열거형까지 가능

struct Stock {
    var averagePrice: Int
    var quantity: Int
    var purchasePrice: Int {
        get{
            return averagePrice * quantity
        }
        
        set(newPrice) { //값이 설정이 되어있지않으면 newValue 로 가능하다.
            averagePrice = newPrice / quantity
        }
    }
}

var stock = Stock(averagePrice: 2300, quantity: 3)
print(stock)

print("--> \(stock.purchasePrice)")

//프로퍼티 옵져버
class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)으로 변경 되었습니다.")
        }
    }
}

var account = Account()
account.credit = 1000

//타입프로퍼티 static 으로 접근가능..

struct SomeStructure {
    static var storedTypeProperty = "Something"
    static var computedTypeProperty: Int {
        return 1
    }
}

SomeStructure.storedTypeProperty
//: [Next](@next)
