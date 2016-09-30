//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

enum SomeError : Error {
    case invalidParameter
    case invalidState(state:Int)
    case other
}


func some(_ parameter:Int) throws -> Int {
    
    defer {
        //
    }
    
    if parameter == 3 {
        throw SomeError.invalidParameter
    }
    return parameter
}


func some2() throws {
    try some(3)
}


do {
    try some2()
} catch SomeError.invalidParameter {
    print("invalidParameter")
} catch SomeError.invalidState(let state) where state == 200 {
    print("200")
} catch SomeError.invalidState(_) {
    print("invalidState")
}

try? some2()

if let x = try? some(3) {
    print("\(x)")
}

let d = try! some(10)





















