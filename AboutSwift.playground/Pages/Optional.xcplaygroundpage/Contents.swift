//: [Previous](@previous)

import Foundation

var name: String?

var optionalName: String? = "Doyeon"
print(optionalName)

//var requiredName: String = optionalName

var number: Int? = 3

print(number)
print(number!) // force

//값이 nil인 변수를 강제로 추출하게 되면 에러가 날수있다.
//그럼 방법은? 비강제로 추출해야한다.

if let result = number {
    print(result)
}

func test(number: Int?) {
    guard let result = number else { return }
    print(result)
}

test(number: number)

let value: Int? = 6
if value == 6 {
    print("value가 6 입니다")
} else {
    print("value가 6이 아닙니다")
}

let string = "12"
var stringToInt: Int! = Int(string)
print(stringToInt + 1)
/**/
//: [Next](@next)

