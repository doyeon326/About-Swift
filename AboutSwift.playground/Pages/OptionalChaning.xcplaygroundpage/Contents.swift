//: [Previous](@previous)

import Foundation

/* 옵셔널 체이닝?
 - 옵셔널에 속해있는 nil일지도 모르는 프로퍼티, 메서드, 서브스크립션등을 가져오거나 호출할 때 사용할 수 있는 일련의 과정
 */

struct Developer {
    let name: String
}

struct Company {
    let name: String
    var developer: Developer?
}
var developer = Developer(name: "kim")
var company = Company(name: "Doyeon", developer: developer)

print(company.developer?.name)
print(company.developer!.name)

//: [Next](@next)
