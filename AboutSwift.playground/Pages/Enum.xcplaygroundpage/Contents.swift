//: [Previous](@previous)

import Foundation

enum CompassPoint: String {
    case north = "북"
    case east = "동"
    case west = "서"
}
//
//enum CompassPoint {
//    case north, east, weat
//}

//하나의 타입으로 사용가능, 대문자로 시작해야함

var direction = CompassPoint.east
direction = .west

switch direction {
case .north : print(direction.rawValue)
case .east : print("south")
default: print("default")
}

let direction2 = CompassPoint(rawValue: "동")

enum PhoneError {
    case unknown
    case batteryLow(String)
    
}
let error = PhoneError.batteryLow("배터리가 곧 방전됩니다.")

switch error {
case .batteryLow(let message):
    print(message)
case .unknown: print("알수없는 에러입니다.")
}
//: [Next](@next)
