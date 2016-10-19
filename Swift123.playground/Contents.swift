//: Playground - noun: a place where people can play

import Foundation

//: 基本

// doでスコープを区切れる
do {

    // 可変な変数
    var str = "Hello, playground"
    str = "hoge" // 変更できる

    // 定数
    let str2 = "Hello"
//    str2 = "hoge"　// 変更できない
    
    // 型を明示的に指定
    let str3:String = "AAA"
    
    1+1
    
    let a = 3
    
    // if文は括弧がいらない。
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

// optional
do {
    // optionalは?をつけたものでnilも入れられる
    var str:String? = nil
    
    str = "hoge"

    // ?をとるには!をつける、しかしstrがnilだと落ちる
    var str2:String = str!

    // nilでないなら{}内が実行される。
    if let str3 = str {
        var str4:String = str3
    }

    // ガード式
    let a = 3
    guard a==3 else {
        
    }

}


// scope
do {
    let a = 3

    do {
        let a = 3
    }
    
}

// function
do {
    func funcA() {
        print("hello")
    }
    funcA()
    
    func funcB()->String {
        return "hello"
    }
    let s = funcB()
    
    func funcC(x:Int)->Int {
        return x + 1
    }
    
    let x = funcC(x:4)
    
    func funcD(_ x:Int)->Int {
        return x * 2
    }
    
    let y = funcD(4)
    
    func funcE(x:Int) ->(Int)->Int {
        func funcF(y:Int) -> Int {
            return x + y
        }
        return funcF
    }
    
    let f = funcE(x:4)
    
    let r = f(3) // 7
    
    let g = funcC
    let r2 = g(10) // 11
    
    func funcG<T>(xs:[T])->Int {
        return xs.count * 2
    }
    
    
    
}


// closure = 型つきのラムダ式
do {
    
    // 基本の定義の仕方、型を指定する
    let cl = {()->Int in
        return 3
    }
    
    let cl2 = {3}
    
    // 使う
    let d = cl()
    let d2 = cl2()
    
    // 定義してすぐ使う
    let b = {()->Int in
        return 3
    }()

    // mapで使う
    let s1 = [1,2,3].map({a in return 3*a})
    s1 // 3,6,9
    
    // 関数の引数の末尾がクロージャの引数の場合、このような書き方もできる。
    let s1_1 = [1,2,3].map{a in return 3*a}
    s1_1 // 3,6,9

    // return の省略
    let s1_2 = [1,2,3].map{a in 3*a}
    s1_2 // 3,6,9
    
    // 引数の省略
    let s1_3 = [1,2,3].map{$0*3}
    s1_3 // 3,6,9

    // 型の指定
    let s2 = [1,2,3].map{a->String in return "\(a)"}
    s2 // ["1","2","3"]
    
    // フィルター
    let s3 = [1,2,3].filter{a->Bool in a==1}
    s3 // [1]
    
    // フィルター
    let s3_1 = [1,2,3].filter{$0==1}
    s3_1 // [1]
    
    // reduce 初期値を指定し次々と計算していく
    let s4 = [1,2,3].reduce(0, {(a,b) -> Int in
            return a + b })
    s4 // 6
    
    // 引数が二つあるクロージャ
    let s4_1 = [1,2,3].reduce(0){$0 + $1}
    s4_1 // 6

    // reduceの応用
    let s5:String = [1,2,3].reduce("start") {(a:String,b:Int) -> String in
            return a + "\(b)" }
    s5 // "start123"
    
    // 配列をつなげる
    let s6 = [1,2,3].map{$0 * 2}.filter{$0 >= 4}.reduce(0){ $0+$1 }
    s6

    // flatmap
    let s6_1 = [[1,2],[2],[3]].flatMap{ (list:[Int]) -> Int in list.count }
    s6_1 // [2,1,1]
    
    // flatmap
    let s6_2 = [[1,2],[2],[3]].flatMap{(list:[Int]) -> [Int] in list}
    s6_2 // [1,2,2,3]

    
    // クロージャを渡して配列を操作する
    let twice = {a in a*2}
    let over4 = {a in a>=4}
    let sum = {(a:Int,b:Int) in a+b}
    
    let s7 = [1,2,3].map(twice).filter(over4).reduce(0, sum)
    
    // カリー化されたクロージャ
    let over = {(c:Int) in {(a) in a>=c}}
    over(4)(3) // false
    over(4)(5) // true
    
    let s8 = [1,2,3].map(twice).filter(over(4)).reduce(0, sum) // 10
    let s9 = [1,2,3].map(twice).filter(over(1)).reduce(0, sum) // 12
    
    

}



// defer 括弧から抜けるときに必ず呼ばれる。
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
    
    enum MyEnum {
        case a,b,c
    }
    
    // 内部クラス
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
    
    // 破棄時に呼ばれる
    deinit {
        
    }
    
    // クラスメソッド
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

// genericsを使う
class MyClass<A,B> {
    let a:[A]
    let b:[B]
    var cl:MyClass<A,B>? = nil
    init (x:A,y:B,cl:MyClass<A,B>? = nil) {
        self.a = [x]
        self.b = [y]
        self.cl = cl
    }
    
    func funcX<C>(c:MyClass<B,C>) -> Int {
        return a.count + b.count + c.a.count
    }
}

do {
    let m = MyClass(x: "hoge", y: 3, cl: MyClass(x: "poi", y: 2))
}

//: enum
do {
    
    enum En1 {
        case a
        case b
        case c
    }
    
    // enumにrawValueを定義
    enum En2 : String {
        case A = "a"
        case B = "b"
        case C = "c"
    }
    
    En2.A
    En2.A.rawValue // "a"
    
    let c : En1 = .a
    
    func sw(_ a:En1)->String {
        switch a {
        case .a:
            return "word A"
        default:
            return ""
        }
    }
    
    sw(c)
    
    if case(.a) = c {
        print("c == .a")
    }
    
    switch 5 {
    case let x where x%5 == 0:
            print(x)
    default:
        break
    }
    
    switch 4 {
    case 0...3:
        break
    case let x as Int:
        print(x)
    default:
        break
    }
    
    
    
    
    // enumに付属型をつける。
    enum Pet {
        case typeA(name:String)
        case typeB(name:String, id:Int)
        
        func toStr()->String {
            switch self {
            case .typeA(name:let name):
                return ("A => \(name)")
            case .typeB(name:let name, id:let id):
                return ("\(name) \(id)")
            }
        }
    }
    
    let d = Pet.typeB(name:"a", id:10)
    d.toStr()
}

//: extension
extension String {
    init(name:String) {
        self.init()
        print("hello \(name)")
    }
}

let a = String(name: "Hoge")

extension CGRect {
    var poi:CGFloat {
        if width > height {
            return width
        } else {
            return height
        }
    }
}


let r = CGRect(x: 0, y: 0, width: 100, height: 200)
let big = r.poi


// struct 構造体を使う
struct Vec {
    let x:Int
    let y:Int
    
    func add(_ v:Vec)->Vec {
        return Vec(x: x + v.x, y: y + v.y)
    }
}

let v = Vec(x: 1, y: 2)
let v2 = v.add(v)



//: CoreFoundation
//: CFType -> AnyObject
//: Annotated API  automatically memory managed in Swift
//: Non annotated API  -> UnManaged<T> .. takeUnretainedValue or takeRetainedValue


//: Protocolを使う
protocol SomeDelegate {
    func hoge()->Int
}

class MyDelegate : SomeDelegate {
    func hoge()->Int {
        print("hello.")
        return 3
    }
}

var m:MyDelegate? = MyDelegate()

if let l = m?.hoge() {
    print("l=\(l)")
}


// 関連型を使う
protocol MyProtocol {
    associatedtype T
    associatedtype S
    func request(x:T) -> S
}

protocol MyProtocol2 : MyProtocol {
    func request2(x:S)
}

protocol DescProtocol {
    func desc<T>(x:T)->String
}

protocol CallProtocol {
    func call()
}

// 構造体にプロトコルを適用した例
struct MyStruct<U:DescProtocol&CallProtocol> : MyProtocol2, CallProtocol {

    typealias T = U
    typealias S = String
    
    func request(x: U) -> String {
        return x.desc(x: "poi")
    }
    
    internal func request2(x: String) {
        print(x)
    }
    
    func call() {
        print("hello")
    }
    
    func funcX()->CallProtocol {
        return self
    }
    
    func funcY<X:CallProtocol>()->X? {
        return nil
    }
    
    let x:CallProtocol
    
    let y:CallProtocol & DescProtocol
}



//: KVO

class Target : NSObject {
    var a : NSInteger = 3
}

class Observer : NSObject {
    
    let t = Target()
    
    override init() {
        super.init()
        print("init!")
        let s = t.value(forKey: #keyPath(Target.a))
        print("value \(s)")
        t.addObserver(self, forKeyPath: #keyPath(Target.a), options: .new, context: nil)
        t.a = 20
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("observe a == \(change![NSKeyValueChangeKey.newKey])")
    }
    
    func hello()->Int {
        print("hello")
        return o.t.a
    }
    
    deinit {
        t.removeObserver(self, forKeyPath: "a")
    }
}


let o = Observer()
o.t.a = 4
o.t.a = 10
let x = o.hello()



//! C
do {
    let a:Bool = true
    let ca:CBool = true
    let b:Int = 3
    let cb:CInt = 3
    
}














