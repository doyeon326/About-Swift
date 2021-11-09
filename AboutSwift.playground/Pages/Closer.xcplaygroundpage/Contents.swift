//: [Previous](@previous)

import Foundation

let hello = { () -> () in
    print("hello")
}

hello()


let hello2 = { (name: String) -> String in
    return "hello \(name)"
}

hello2("hello")

func doSomething(closure: () -> ()) {
    closure()
}

doSomething(closure: { () -> () in
    print("hello")
})

doSomething() {
    //생략가능..
    print("hello2")
}
doSomething {
    //생략가능..
    print("hello2")
}

func doSomething2() -> () -> () {
    return { () -> () in
        print("hello4")
    }
}

doSomething2()()

func doSomething2(success: ()-> (), fail: () -> () ){
    
}

doSomething2 {
    //code
} fail: {
    //code
}

func doSomething3(closure: (Int, Int, Int) -> Int) {
    closure(1,2,3)
}

doSomething3(closure: { (a, b, c) in
    return a+b+c
})

doSomething3(closure: {
    return $0*$1*$2
})
doSomething3(closure: {
    $0*$1*$2
})
doSomething3() {
    $0*$1*$2
}
doSomething3 {
    $0*$1*$2
}

//: [Next](@next)




﻿
