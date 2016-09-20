//
//  NSObject+WFADition.m
//  RuntimeTest
//
//  Created by liuwanfang on 16/9/20.
//  Copyright © 2016年 liuwanfang. All rights reserved.
//

#import "NSObject+WFADition.h"
#import <objc/runtime.h>
static void *WFObjProkey = @"WFObjProKey";

@implementation NSObject (WFADition)
- (void)setHotelName:(NSString *)hotelName {
    objc_setAssociatedObject(self, &WFObjProkey
                             , hotelName, OBJC_ASSOCIATION_COPY);
}
- (NSString *)hotelName {
    return objc_getAssociatedObject(self, &WFObjProkey);
}
@end
