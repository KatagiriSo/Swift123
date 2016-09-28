//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let bits : UInt8 = 0b00000011

let invred : UInt8 = ~bits
assert(invred == 0b11111100)

let m: UInt8 = 0b00000110
let r = bits & m
assert(r == 0b00000010)

let o: UInt8 = 0b10000000
let r2 = bits | o
assert(r2 == 0b10000011)

let x: UInt8 = 0b10000001
let r3 = bits ^ x
assert(r3 == 0b10000010)

let r4: UInt8 = 0b00000001 << 1
let r5: UInt8 = 0b00000010 >> 1

let pink:UInt32 = 0xCC6699
let redcomponent = pink & 0xFF0000 >> 16

//let over : UInt8 = 0b11111111 + 0b00000001
let over : UInt8 = 0b11111111 &+ 0b00000001

let p = CGPoint(x:1,y:2)
let q = CGPoint(x:2,y:3)
let q2 = CGPoint(x:2,y:3)

prefix operator +++

extension CGPoint {
    static func + (left:CGPoint, right:CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y:left.y + right.y)
    }
    
    static prefix func - (p:CGPoint) -> CGPoint {
        return CGPoint(x: -p.x, y:-p.y)
    }
    
    static func += (left: inout CGPoint, right:CGPoint) {
        left = left + right
    }
    
    static prefix func +++ (p: inout CGPoint) -> CGPoint {
        p += p
        return p
    }
}



let r6 = p + q
let r7 = -p

var v = CGPoint(x:1, y:1)
v += p

let r8 = +++v

infix operator +-: AdditionPrecedence
extension CGPoint {
    static func +- (left:CGPoint, right:CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y:left.x - right.y)
    }
}

let r9 = p +- q

/* Precedencegroup see https://developer.apple.com/reference/swift/1851035-swift_standard_library_operators
 BitwiseShift
 Multiplication
 Addition
 Rangeformation
 Casting
 Nil Coalescing
 Comparison
 Logical condjunction
 Logical disjunction
 Ternary
 Assgnment
*/

precedencegroup MyPredence {
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
    associativity: left
    assignment:true // optional chain
    
}

infix operator <+>: MyPredence // /, =, -, +, !, *, %, <, >, &, |, ^, ?, ~

func <+> (left:Int, right:Int) -> Int {
    return left * 3 + left * 3
}


let r10 = 2 + 3 <+> 3




