//
//  ViewController.m
//  RuntimeTest
//
//  Created by liuwanfang on 16/9/20.
//  Copyright © 2016年 liuwanfang. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "NSObject+WFADition.h"
@interface ViewController ()<UIAlertViewDelegate>
- (IBAction)AlertShow:(id)sender;

@end

static void *WFMyAlerViewKey = "myAlertVeiwKey";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)adition:(UIButton*)button {
    NSLog(@"click button");
}
// AlertView
- (void)askUserAQuestions {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"通过runtime添加block减少代码" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"action1", @"action2", nil];
    alertView.delegate = self;
    [alertView show];
    
    /**
     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"action1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"click actionone");
    }];
    UIAlertAction *actionTwo = [UIAlertAction actionWithTitle:@"action2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"click aciton2");
    }];
    [alert addAction:action];
    [alert addAction:actionTwo];
    [self presentViewController:alert animated:YES completion:nil];
    */
    
    
    void (^blok)(NSInteger) = ^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            NSLog(@"buttonIndex = 0");
        } else {
            NSLog(@"buttonIndex = 1");
        }
    };
    objc_setAssociatedObject(alertView, WFMyAlerViewKey, blok, OBJC_ASSOCIATION_COPY);
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    void (^blcok)(NSInteger) = objc_getAssociatedObject(alertView, WFMyAlerViewKey);
    blcok(buttonIndex);
}
//- (void)block{
//    void (^block)(NSInteger) = objc_getAssociatedObject( , <#const void *key#>)
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)AlertShow:(id)sender {
    [self askUserAQuestions];
}
@end
