//
//  Swift123Tests.swift
//  Swift123Tests
//
//  Created by Katagiri11 on 2016/08/08.
//  Copyright © 2016年 RodhosSoft. All rights reserved.
//

import XCTest
@testable import Swift123

class Swift123Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testHuman() {
        
        let man = HumanManager.shareInstance.newHuman()
        
        XCTAssert(man.age == 1, "man age initial == 1")
        XCTAssert(man.name == nil, "man age initial == nil")
        
        man.age = 20
        man.name = "hoge"
        
        let desc = man.description()
        let expdesc = "hoge age.20"
        XCTAssert(desc == expdesc, "\(expdesc) == \(desc)")
        
        let message1 = Message(text: "hm...", from: man.personID)
        let message2 = Message(text: "oh...", from: man.personID)
        let message3 = Message(text: "ok...", from: man.personID)
        
        man.add(message1)
        man.add(message2)
        man.add(message3)
        
        XCTAssert(man.receivedMessages.count == 3)

    }
    
    func testHumanManager() {
        
        let first = HumanManager.shareInstance.humanNumber
        let man1 = HumanManager.shareInstance.newHuman()
        let man2 = HumanManager.shareInstance.newHuman()
        let man3 = HumanManager.shareInstance.newHuman()
        
        let second = HumanManager.shareInstance.humanNumber
        
        
        XCTAssert(man1.personID != man2.personID)
        XCTAssert(man2.personID != man3.personID)
        XCTAssert(man1.personID != man3.personID)
        
        XCTAssert(second - first == 3)
        
        let man = HumanManager.shareInstance.stocker.human(man1.personID)
        XCTAssert(man!.personID == man1.personID)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    
}
