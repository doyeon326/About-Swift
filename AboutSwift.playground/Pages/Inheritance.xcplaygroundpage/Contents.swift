//: [Previous](@previous)

import Foundation

//상속

class Vehicle {
    var currentSpeed = 00
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        print("Speaker is on")
    }
}
/*
 class 클래스이름: 부모클래스 이름 (베이스클래스) {
    하위 클래스 정의
 }
 
 */

class Bicycle: Vehicle {
    var hasBasket = false
}

var bicycle = Bicycle()
bicycle.currentSpeed
bicycle.currentSpeed = 15
bicycle.currentSpeed

//Overriding

class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise()
        print("choo choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 30
car.gear = 2
print(car.description)


class AutomaticCar: Car {
    override var currentSpeed: Int {
        didSet {
            gear = Int(currentSpeed / 10 ) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35
print("AutomaticCar: \(automatic.description)")
//: [Next](@next)
