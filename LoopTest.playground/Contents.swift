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

let list:[Int] = [1,2,3]
[1,2,3].max()
[1,2,3].min()
[1,2,3].dropFirst()
[1,2,3].dropLast()
[1,2,3].dropLast(2)
[1,2,3].dropFirst(2)
[1,2,3].prefix(2)
[1,2,3].suffix(2)
[1,2,3].first
[1,2,3].first { (n) -> Bool in n % 2 == 1}
[1,2,3,4,5].split(separator: 2)
["a","b","c","b","d"].split(separator: "b")

let r = list.map{$0 * 2}
let r1 = list.map{n in n*2}
let r2 = list.map{(n:Int)->Int in n*2}
let r3 = list.map{n in "\(n)"}
let r4 = list.map{(n:Int)->String in return "\(n)"}

let r5 = list.filter{n in n%2==0}

let r6 = list.reduce(0){(x,y) in x+y}

let list2:[[Int]] = [[1],[2],[3]]
let r7 = list2.flatMap { (ns) in ns[0] }
print(r7)








