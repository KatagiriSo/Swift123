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





