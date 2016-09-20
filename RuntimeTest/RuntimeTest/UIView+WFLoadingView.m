//
//  UIView+WFLoadingView.m
//  RuntimeTest
//
//  Created by liuwanfang on 16/9/20.
//  Copyright © 2016年 liuwanfang. All rights reserved.
//

#import "UIView+WFLoadingView.h"
#import <objc/runtime.h>
#import "MBProgressHUD.h"
static const  void*kHttpRequestHUDkeyWF = @"kHttpRequwetHUDKyeWF";

@interface UIView ()
@property (nonatomic, strong) MBProgressHUD *progress;
@end


@implementation UIView (WFLoadingView)
// 设置属性的getter方法, 利用runtime添加属性
- (MBProgressHUD *)progress {
    MBProgressHUD *HUD = objc_getAssociatedObject(self, &kHttpRequestHUDkeyWF);
    if (HUD == nil) {
        HUD = [[MBProgressHUD alloc] initWithView:self];
        [self addSubview:HUD];
        objc_setAssociatedObject(self, &kHttpRequestHUDkeyWF, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self addSubview:HUD];
    }
    return HUD;
}

// 出现动画和隐藏动画
- (void)showLoadingViewWithMessage:(NSString *)message {
    if (message) {
        self.progress.labelText = @"mesasge";
        
    } else {
        self.progress.labelText = @"";
    }
    [self.progress show:YES];
}

- (void)stopLoadingViewWithMessage:(NSString *)message {
    if (message.length) {
        self.progress.labelText = message;
        [self.progress hide:YES afterDelay:2];
    } else {
        [self.progress hide:YES];
    }
}

/**
 * 只要引用头文件 #import "UIView+FYLoadingView.h"
 
 如果实在 UIViewController 里面，调用是这样的
 动画出现
 
 [self.view showLoadingViewWithMessage:@"加载中"];
 动画消失
 
 // 直接消失
 [self.view stopLoadingViewWithMessage:@""];
 // 先显示字，延迟消失
 [self.view stopLoadingViewWithMessage:@"网络不给力"];
 
*/
@end
