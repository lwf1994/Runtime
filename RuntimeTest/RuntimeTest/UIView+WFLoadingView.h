//
//  UIView+WFLoadingView.h
//  RuntimeTest
//
//  Created by liuwanfang on 16/9/20.
//  Copyright © 2016年 liuwanfang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WFLoadingView)
- (void)showLoadingViewWithMessage:(NSString *)message;

/**
 * message 为空会马上消失
 * message 不为空, 会先显示文字, 延迟消失
 */
- (void)stopLoadingViewWithMessage:(NSString *)message;
@end

