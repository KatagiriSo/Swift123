//
//  HumanRecord.swift
//  Swift123
//
//  Created by Katagiri11 on 2016/08/08.
//  Copyright © 2016年 RodhosSoft. All rights reserved.
//

import Foundation

typealias PersonID = String


class Human {
    var age = 1
    var name : String?
    let personID : PersonID
    var postedMessages : [Message] = Array()
    var receivedMessages : [Message] = Array()
    
    init(personID:PersonID) {
        self.personID = personID
    }
    
    func description() -> String {
        if name == nil {
            return "**** age.\(age)"
        } else {
            return "\(name!) age.\(age)"
        }
    }
    
    func add(message:Message) {
        self.receivedMessages.append(message)
    }
}