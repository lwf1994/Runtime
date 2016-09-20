//
//  RTObj.m
//  RuntimeTest
//
//  Created by liuwanfang on 16/9/20.
//  Copyright © 2016年 liuwanfang. All rights reserved.
//

#import "RTObj.h"
#import <objc/message.h>
@implementation RTObj
// 获取一个类的所有属性
// 父类的属性获取不到
- (void)getAllObj {
    unsigned int outCount = 0;
    Ivar *vars = class_copyIvarList([RTObj class], &outCount);
    // 便利所有成员变量
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = vars[i];// 去除第一个位置的成员变量
        const char *propertyName = ivar_getName(ivar); // 获取变脸名
        const char *propertyType = ivar_getTypeEncoding(ivar); // 获取成员变量类型
        printf("---%s---%s\n", propertyName, propertyType);
        
    }
}

@end
