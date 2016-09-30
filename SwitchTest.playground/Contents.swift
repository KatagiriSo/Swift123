//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let x = 3
switch x {
    case 0...2:
        print("x")
    case 3..<10:
        print("y")
    case _:
        break
}

protocol APro{}
protocol BPro{}

struct Sc:APro {}

let b:Sc = Sc()

switch b {
case let p as APro:
    print("Apro")
case let p as BPro:
    print("BPro")
default:
    print("None")
}

let d = 4.5
switch d {
case 0.0..<200.0:
    print("0-200")
default:
    break
}

let s = 1000
switch s {
case 1,2,3:
    print("1,2,3")
default:
    break
}

let dv = 131232
switch dv {
case let x where x % 2 == 0:
    print("\(x) is even")
default:
    break
}

enum ErrorStatus {
    case Success
    case Error(code:Int)
}

let e = ErrorStatus.Error(code: 300)
switch e {
case .Success:
    break
case .Error(code:300..<400):
    print("300-400")
case let .Error(code:x) where (400..<500).contains(x):
    print("\(x) in 400..500")
default:
    break
}

let xx = (1,2)
switch xx {
case (0,0):
    print("origin")
case (_,0):
    print("x-axis")
case (0,_):
    print("y-axis")
case let (x,y) where x == y:
    print("diagonal")
case (1,let x):
    print("1,\(x)")
default:
    print("other")
}

let list = [Any]()

for o in list {
    switch o {
    case 0 as Int:
        print("0")
    case 0 as Double:
        print("0.0")
    case let x as Int:
        print("\(x)")
    case let (x,y) as (Int, Int):
        print("(x,y)")
    default:
        break
    }
}













