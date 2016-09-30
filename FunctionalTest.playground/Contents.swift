//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let flatList = [[1],[2],[3,4]].flatMap { (list:[Int]) -> Int? in
    list.reduce(1, { (result, x) -> Int in
        return result * x
    })
}

// monad

func unit(x:Int) -> [Int] {
    return [x]
}

enum Maybe<U> {
    case Just(U)
    case Nothing
}

func bind<U,V>(_ x:Maybe<U>, f:(U) -> Maybe<V>) -> Maybe<V> {
    switch x {
    case .Nothing:
        return .Nothing
    case let .Just(v):
        return f(v)
    }
}

func lift<U>(_ f:@escaping (U,U)->U) -> (Maybe<U>, Maybe<U>) -> Maybe<U> {
    
    func mf(mx:Maybe<U>, my:Maybe<U>) -> Maybe<U> {
        return bind(mx) { (x:U) -> Maybe<U> in
            bind(my) {(y:U) -> Maybe<U> in
                unit(f(x,y))
            }
        }
    }
    
    return mf
}

func lift<U,V>(_ f:@escaping (U) -> V) -> (Maybe<U>) -> Maybe<V> {
    func mf(mx:Maybe<U>) -> Maybe<V> {
        return bind(mx) {(x:U) -> Maybe<V> in
            let xx:V = f(x)
            return unit(xx)
        }
    }
    
    return mf
}

func unit<U>(_ x:U) -> Maybe<U> {
    return Maybe.Just(x)
}

let addm = lift((+) as (Int,Int) -> Int)

let r = addm(Maybe.Just(3), Maybe.Just(4))
let r2 = addm(Maybe.Just(3), Maybe.Nothing)

func add(mx:Maybe<Int>, my:Maybe<Int>) -> Maybe<Int> {
  return bind(mx) { (x:Int) -> Maybe<Int> in bind(my) {(y:Int) -> Maybe<Int> in unit(x + y)}}
}

func length(_ x:String)->Maybe<Int> {
    let l =  x.lengthOfBytes(using: .utf8)
    if l >= 8 {
        return Maybe.Nothing
    }
    return unit(l)
}


// monnad raw
let r3:Maybe<Int> = bind(unit("hoge"), f:length)
let r4:Maybe<Int> = length("hoge")

func fMap<U,V>(_ f:@escaping (U)->V) -> (Maybe<U>) -> Maybe<V> {
    func mf(_ x:Maybe<U>) -> Maybe<V> {
        switch x {
        case .Nothing:
            return .Nothing
        case let .Just(u):
            return .Just(f(u))
        }
    }
    return mf
}

func join<U>(_ x:Maybe<Maybe<U>>) -> Maybe<U> {
    switch x {
    case .Nothing:
        return .Nothing
    case let .Just(mu):
        return mu
    }
}


let mf = fMap((+) as (Int,Int)->Int)

func bind_<U,V>(_ x:Maybe<U>, f:@escaping (U) -> Maybe<V>) -> Maybe<V> {
    return join(fMap(f)(x))
}

// State monad
typealias State<S,T> = (S) -> (T,S)

func unit<S,T>(_ t:T) -> State<S,T> {
    func state(s:S) -> (T,S) {
        return (t,s)
    }
    return state
}

let state:State<Int, String> = unit("a")

let (t:String, s:Int) = state(3)

//func bind<S,T1,T2>(_ s:State<S,T1>, f:((S)->T1) -> State<T2,S>) -> State<T2,S> {
//    
//    func mf(_ r:Any -> State<T2,S>) {
//        s
//    }
//    
//
//}















