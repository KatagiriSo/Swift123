//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func f(x:Int, y:Int)->Int {
    return x+y
}

func f(x:Int, y:Int, z:Int) ->Int {
    return x+y+z
}

let g = f(x:y:)
g(3,2)

let h = f(x:y:z:)
h(3,2,1)

let c = {3 + 2}
let d = c()
let e = {f(x:y:)}
e()(1,2)


@available(iOS 8.0,macOS 10.0,*)
func hello() {
    print("hello")
}

if #available(iOS 8.0, *) {
    print("Hi")
}

struct Pooi {
    
}

@available(*, unavailable, renamed: "Pooi")
typealias Poi = Pooi


@objc
class ObjCClass : NSObject {
    var flag: Bool {
        @objc(isFlag) get {
            return self.flag
        }
    }
}

let o = ObjCClass()




