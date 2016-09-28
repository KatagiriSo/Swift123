//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func addOne(_ x:Int)->Int {
    print("hello")
    return x + 1
}

addOne(3)

let c = addOne

let d:(Int)->Int = addOne

let f:(Int)->Int = { (x:Int) -> Int in
    return x + 10
}

let g = {(x:Int) -> Int in x + 10}

let h:(Int)->Int = {$0 + 10}

let i:(Int,Int)->Int = {$0.0 + 10}

f(d(c(4)))

[1,3,4].sorted(by: >)
print([1,5,2].sorted{$0>$1})
[1,5,2].sorted { (x:Int, y:Int) -> Bool in
    return x > y
}

let comp = {(x:Int, y:Int) -> Bool in
    return x > y
}

func compfunc(x:Int, y:Int) -> Bool {
    return x>y
}

[1,5,2].sorted(by:comp)
[1,5,2].sorted(by: compfunc)

func c(x:Int) -> (x:Int,y:Int,z:Int) {
    return (x,x,x)
}

func evaluate(x:Int, y:Int, z:Int) -> (Int) -> Int {
    return {(l:Int) -> Int in (x + y + z) * l}
}

evaluate(x: 2, y: 3, z: 4)(10)


let e0 = evaluate
let e1 = evaluate(x: 1, y: 2, z: 3)
let e2 = evaluate(x: 1, y: 2, z: 3)(10)


protocol A{}
protocol B{}
protocol C{}

protocol D {
    func ff(_ x:A) -> B
    func gg(_ x:B) -> C
}

extension D {
    func hh(_ x:A) -> C {
        return gg(ff(x))
    }
}

struct X {
    let f:(A) -> B
    let g:(B) -> C
}

func add(x:Int, y:Int) -> Int {
    return x + y
}

func cadd(_ x:Int) -> (Int) -> Int {
    return {(y:Int) -> Int in add(x:x, y:y)}
}

let add3 = cadd(3)
add3(10)

func cadd2(_ x:Int) -> (Int) -> Int {
    return {(y:Int) -> Int in x+y}
}

func curry(_ f:@escaping (Int,Int) -> Int) -> (Int) -> (Int) -> Int {
    
    func F(x:Int) -> (Int) -> Int {
        return {(y:Int) in f(x,y)
            
        }
    }
    
    return F
}

let curryadd = curry(+)
let add3_ = curryadd(3)
add3_(10)

(+)(3,4)
let x = (+) as (Int,Int)->Int


func curry2<T1,T2,T3>(_ f:@escaping (T1,T2) -> T3) -> (T1) -> (T2) -> T3 {
    
    func F(x:T1) -> (T2) -> T3 { return {(y:T2) in f(x,y)}}
    return F
}


let curryadd2 = curry2((+) as (Int,Int) -> Int)
let add3__ = curryadd2(3)
add3__(10)






















