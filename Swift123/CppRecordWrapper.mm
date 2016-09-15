//
//  CppRecordWrapper.mm
//  Swift123
//
//  Created by 片桐奏羽 on 2016/09/15.
//  Copyright © 2016年 RodhosSoft. All rights reserved.
//

#import "CppRecordWrapper.h"
#import "CppRecord.hpp"

@implementation CppRecordWrapper
- (int)plus:(int)a and:(int)b
{
    CppRecord* rec = new CppRecord();
    int r = rec->plus(a,b);
    delete rec;
    
    return r;
}
@end
