//
//  ObCFrameWorkExampleTests.m
//  ObCFrameWorkExampleTests
//
//  Created by 片桐奏羽 on 2016/09/15.
//  Copyright © 2016年 RodhosSoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ObCFrameWorkExample/ObCFrameWorkExample.h>

@interface ObCFrameWorkExampleTests : XCTestCase

@end

@implementation ObCFrameWorkExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    Hello *hello = [Hello new];
    NSString *res = [hello hello];
    XCTAssert([res isEqualToString:@"hello"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
