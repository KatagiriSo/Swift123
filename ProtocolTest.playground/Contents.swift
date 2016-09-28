//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

protocol Animal {
    
}

protocol Helloable {
    func hello()
}

protocol Relation {
    associatedtype Enemy
    func attack(p:Enemy)
}


struct Dog : Animal, Helloable, Relation {
    
    typealias Enemy = Cat
    
    let name:String
    let legs:Int
    let age:Int
    
    func hello() {
        print("bow!")
    }
    
    func attack(p: Cat) {
        print("\(name) -> \(p.name) bow!")
    }
}

struct Cat : Animal, Helloable, Relation {
    
    typealias Enemy = Fish
    
    let name:String
    let legs:Int
    let age:Int
    
    func hello() {
        print("nyao!")
    }
    
    func attack(p: Fish) {
        print("\(name) -> \(p.name) nyao!")
    }
}

struct Fish : Animal {
    let name:String
    let age:Int
}

let seri = Dog(name: "Seri", legs: 4, age:13)
seri.hello()

let tama = Cat(name: "Tama", legs: 4, age:5)
tama.hello()

seri.attack(p: tama)

let kin = Fish(name: "Kin", age:1)

let animal:Animal = seri
let animal2:Helloable = seri
let animal3:Animal & Helloable = seri
let animal4:Any&Helloable = seri

let animals:[Animal] = [seri, tama, kin]

animals.forEach { (p:Animal) in
    switch(p) {
    case let p as Animal & Helloable:
        p.hello()
    default:
        break
    }
}