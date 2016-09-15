//
//  HumanStocker.swift
//  Swift123
//
//  Created by Katagiri11 on 2016/08/08.
//  Copyright © 2016年 RodhosSoft. All rights reserved.
//

import Foundation

class HumanStocker {
    private var humanDic:Dictionary<PersonID, Human> = Dictionary()
    
    func stock(_ human:Human) {
        self.humanDic[human.personID] = human
    }
    
    func human(_ personID:PersonID) -> Human? {
        return self.humanDic[personID]
    }
}
