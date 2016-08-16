//: Playground - noun: a place where people can play

import Foundation

do {
    //: Basic
    
    var str = "Hello, playground"
    
    1+1
    
    let a = 3
    
    if a == 3 {
        print("a == \(a)")
    } else {
        print("a != 3")
    }
    
    //: 3 time
    for i in 1...3 {
        print(i)
    }
    
    //: 2 time
    for i in 1..<3 {
        print(i)
    }
    
    //: array
    
    let ls = ["a","b","c"]
    for l in ls {
        print(l)
    }
    
    print("a" + "b")
}


//: scope
do {
    let a = 3
    
    do {
        let a = 3
    }
    
}

//: closure

do {
    
    let cl = {()->Int in
        return 3
    }
    
    let d = cl()
    
    let b = {()->Int in
        return 3
    }()
    
    let s1 = [1,2,3].map({a in return 3*a})
    s1 // 3,6,9
    
    let s2 = [1,2,3].map({a->String in return "\(a)"})
    s2 // ["1","2","3"]
    
    let s3 = [1,2,3].filter({a->Bool in a==1})
    s3 // [1]
    
    let s4 = [1,2,3].reduce(0, combine:
        {(a,b) -> Int in
            return a + b })
    s4 // 6
    
    let s5:String = [1,2,3].reduce("start", combine:
        {(a:String,b:Int) -> String in
            return a + "\(b)" })
    s5 // "start123"
    
    
    let s6 = [1,2,3].map({a in a * 2}).filter({a in a >= 4}).reduce(0, combine: {(a,b) in a+b})
    s6
    
    let twice = {a in a*2}
    let over4 = {a in a>=4}
    let sum = {(a:Int,b:Int) in a+b}
    
    let s7 = [1,2,3].map(twice).filter(over4).reduce(0, combine: sum)
    
    let over = {(c:Int) in {(a) in a>=c}}
    over(4)(3) // false
    over(4)(5) // true
    
    let s8 = [1,2,3].map(twice).filter(over(4)).reduce(0, combine: sum) // 10
    let s9 = [1,2,3].map(twice).filter(over(1)).reduce(0, combine: sum) // 12
    
    

}




// call c->b->a
do {
    defer {
        print("a!")
    }
    defer {
        print("b!")
    }
    
    print("c!")
}



//:class

class Sample {
   
    let a:String = "a"
    let b:String?
    var c:String?
    var d:String
    let e:String
    let f = Inner()
    
    class Inner {
        var x:Int = 3
        func d()->Int {
            return x * 5
        }
    }
    
    init(b:String) {
        self.b = b
        d = "d"
        e = "e"
    }
    
    static func abc()->String {
        return "abc"
    }
    
    func de()->String {
        return "de"
    }
}

extension Sample {
    func fg()->String {
        return "g\(self.f.x)"
    }
}


Sample.abc()
let s = Sample(b:"aaa")
s.de()
s.d = "dd"
s.fg()


//: enum

do {
    
    enum En1 {
        case A
        case B
        case C
    }
    
    enum En2 : String {
        case A = "a"
        case B = "b"
        case C = "c"
    }
    
    En2.A
    En2.A.rawValue // "a"
    
    let c : En1 = .A
    
    func sw(a:En1)->String {
        switch a {
        case .A:
            return "word A"
        default:
            return ""
        }
    }
    
    sw(c)
    
    
    enum Pet {
        case TypeA(name:String)
        case TypeB(name:String, id:Int)
        
        func toStr()->String {
            switch self {
            case .TypeA(name:let name):
                return ("A => \(name)")
            case .TypeB(name:let name, id:let id):
                return ("\(name) \(id)")
            }
        }
    }
    
    let d = Pet.TypeB(name:"a", id:10)
    d.toStr()

    
    
    
    
}









