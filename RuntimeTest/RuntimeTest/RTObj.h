//
//  RTObj.h
//  RuntimeTest
//
//  Created by liuwanfang on 16/9/20.
//  Copyright © 2016年 liuwanfang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RTObj : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *webUrl;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *type;
- (void)getAllObj;

@end
