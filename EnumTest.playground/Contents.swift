//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


protocol Animal {
    var name:String {get}
}

protocol Dog:Animal {
    
}

protocol Cat:Animal {
    
}

protocol Fish:Animal {
    
}


enum AnimalEnum {
    case Dog(raw:Dog, date:Date)
    case Cat(raw:Cat, date:Date)
    case Fish(raw:Fish, date:Date)
}

struct DogStrct : Dog {
    var name:String
}

struct CatStrct : Cat {
    var name:String
}

struct FishStrct : Fish {
    var name:String
}

let a = AnimalEnum.Dog(raw: DogStrct(name: "pog"), date:Date())

switch a {
case .Dog(raw:let dog, date:_):
    print("\(dog.name)")
default:
    break
}

switch a {
case let a as Dog:
    print("\(a.name)")
default:
    break
}

enum Math {
    case num(Int)
    indirect case add(Math, Math)
    indirect case prod(Math, Math)
    func eval(_ exp:Math) -> Int {
        switch exp {
        case let .num(v):
            return v
        case let .add(l, r):
            return eval(l) + eval(r)
        case let .prod(l, r):
            return eval(l)*eval(r)
        }
    }
    
    func eval()->Int {
        return eval(self)
    }
}

let siki = Math.add(.num(3), .prod(.num(2), .num(5)))
let ans = siki.eval()







