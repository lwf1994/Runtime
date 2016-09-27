//
//  UIButton+DoExchange.h
//  RuntimeTest
//
//  Created by liuwanfang on 16/9/27.
//  Copyright © 2016年 liuwanfang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DoExchange)
- (void)doExchange;
- (void)newAddTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
@end
