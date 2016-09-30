//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func hello() {
    print(#function)
}

@objc class A:NSObject {
    var b:Int = 3
}

let c = #keyPath(A.b)

class C {
    class func hello() {
        print("hello")
    }
}


let man = C()

type(of:man).hello()

#if os(macOS)
#endif

#if arch(arm)
#endif

#if swift(>=3.0) && os(macOS)
#endif


var url = URLComponents()
url.scheme = "https"
url.host = "google.co.jp"
url.path = "/search"
url.queryItems = [URLQueryItem(name: "q", value: "x")]

let b = url.url
