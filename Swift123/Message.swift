//
//  Message.swift
//  Swift123
//
//  Created by Katagiri11 on 2016/08/08.
//  Copyright © 2016年 RodhosSoft. All rights reserved.
//

import Foundation

class Message {
    let text : String
    let time : Date
    let from : PersonID
    let to : [PersonID] = Array()
    init(text:String, from:PersonID) {
        self.text = text
        self.time = Date()
        self.from = from
    }
}
