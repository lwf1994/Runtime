//
//  UIButton+DoExchange.m
//  RuntimeTest
//
//  Created by liuwanfang on 16/9/27.
//  Copyright © 2016年 liuwanfang. All rights reserved.
//

#import "UIButton+DoExchange.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation UIButton (DoExchange)
- (void)doExchange {
    Method addTarget = class_getClassMethod(self, @selector(addTarget:action:forControlEvents:));
    Method newAddTarget = class_getClassMethod(self, @selector(newAddTarget:action:forControlEvents:));
    method_exchangeImplementations(newAddTarget, addTarget);
}
- (void)newAddTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    NSLog(@"change the addTarget method");
//    [self addTarget:target action:@selector(selector) forControlEvents:UIControlEventTouchUpInside];
    [self newAddTarget:target action:action forControlEvents:controlEvents];
}
@end
