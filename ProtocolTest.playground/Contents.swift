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


protocol Nextable {
    mutating func next()
}

enum AnimalEnum : Nextable {
    case Fish, Amphibia, Reptile
    
    mutating func next() {
        switch self {
        case .Fish:
            self = .Amphibia
        case .Amphibia:
            self = .Reptile
        case .Reptile:
            self = .Reptile
        }
    }
}

var l = AnimalEnum.Fish
l.next()
l.next()

protocol InitProtocol {
    init(x: Int)
}

class XX : InitProtocol {
    required init(x: Int) {
        
    }
}


protocol Human {
    func message(human:Human, message:String) -> String
    func wrap<T>(x:T) -> [T]
}



func talk<M1:Any&Human, M2:Human>(m1:M1, m2:M2) -> String where  M2:Any {
    let r = m1.message(human: m2, message: "hello")
    return r
}

struct Japanese : Human {
    func message(human: Human, message: String) -> String {
        return "hello2"
    }
    
    func wrap<T>(x: T) -> [T]{
        return [x,x];
    }
}

let m1 = Japanese()
let m2 = Japanese()


let d = talk(m1: m1, m2: m2)








