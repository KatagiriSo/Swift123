//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

for _ in 1...3 {
    print("a")
}

[1...3].forEach { (n) in
    print("\(n)")
}

let e = ["a","b","c"].enumerated()
for t in e {
    print ("\(t.offset) -> \(t.element)")
}
