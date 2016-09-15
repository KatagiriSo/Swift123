//
//  HumanManager.swift
//  Swift123
//
//  Created by Katagiri11 on 2016/08/08.
//  Copyright © 2016年 RodhosSoft. All rights reserved.
//

import Foundation

class HumanManager {
    
    static let shareInstance:HumanManager = HumanManager()
    
    let stocker : HumanStocker = HumanStocker()
    
    private init() {
        
    }
    
    private(set) var humanNumber = 0
    
    class func getID(_ number:Int)->PersonID {
        return "ID:\(number)"
    }
    
    func newHuman()->Human {
        self.humanNumber = self.humanNumber + 1
        let personID : PersonID = HumanManager.getID(self.humanNumber)
        let human = Human(personID: personID)
        self.stocker.stock(human)
        return human
    }
}


