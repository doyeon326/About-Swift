//: [Previous](@previous)

import Foundation

enum PhoneError: Error {
    case unknown
    case batteryLow(batteryLevel: Int)
    
    
}
//에러 발생 시키기
//throw PhoneError.batteryLow(batteryLevel: 20)

//발생된 에러 처리하기
/*
 1. 해당 함수에 전파
 2. 두캐치
 3. 옵셔널 에러 처리
 4. 에러 발생하지 않을거라는 확신
 */
func checkPhoneBatteryStatus(batteryLevel: Int) throws -> String {
    guard batteryLevel != -1 else { throw PhoneError.unknown }
    guard batteryLevel > 20 else { throw PhoneError.batteryLow(batteryLevel: 20)}
    return "배터리 상태가 정상입니다."
}

/*
 do {
 try 오류 발생 가능 코드
 } Catch 오류 패턴 {
 처리코드
 }
 */

do {
    try checkPhoneBatteryStatus(batteryLevel: 20)
} catch PhoneError.unknown {
    print("알 수 없는 에러입니다.")
} catch PhoneError.batteryLow(let batteryLevel) {
    print("배터리 전원 부족 남은 배터리: \(batteryLevel)%")
} catch {
    print("그 외 오류 발생: \(error)")
}


let status = try? checkPhoneBatteryStatus(batteryLevel: 30)
print(status)

let statuss = try! checkPhoneBatteryStatus(batteryLevel: 30)
print(statuss)


//: [Next](@next)
