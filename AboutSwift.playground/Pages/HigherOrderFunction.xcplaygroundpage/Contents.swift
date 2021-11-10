//: [Previous](@previous)

import Foundation

//map

let numbers = [0,1,2,3]
let mapArray = numbers.map { (number) -> Int in
    return number * 2
}
print("map \(mapArray)")

//filter - 값을 거러서 새로운 컨테이너에다가 저장!
let intArray = [10, 5, 20, 14, 3]
let filterArray = intArray.filter {$0 > 5}
print(filterArray)

//reduce
let someArray = [1,2,3,4,5]
let reduceResult = someArray.reduce(0) {
(result: Int, element: Int) -> Int in
    print("\(result) + \(element)")
    return result + element

}
print("reduce \(reduceResult)")

//: [Next](@next)
