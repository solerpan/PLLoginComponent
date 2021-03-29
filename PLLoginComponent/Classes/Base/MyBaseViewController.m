//
//  MyBaseViewController.m
//  YOLO
//
//  Created by 潘亮 on 2021/2/26.
//

#import "MyBaseViewController.h"
#import "LoginVideoViewController.h"
#import "BBLoginViewController.h"
#import "MJTimer.h"
#import "MyNavigationController.h"
#import "Header.h"

@interface MyBaseViewController ()
@end

@implementation MyBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
        //接受登录的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoLogin:) name:kNotificationNeedAppearLogin object:nil];
}

- (void)gotoLogin:(NSNotification *)noti
{
    BBLoginViewController * vc = [[BBLoginViewController alloc] init];
    
    MyNavigationController * nav = [[MyNavigationController alloc] initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}


// 发送验证码倒计时
- (void)startTimeBtn:(UIButton *)button second:(int)second{
    __block int timeout = second - 1;
    NSString * mjTimer = [MJTimer execTask:^(NSString * timer) {
        
        if(timeout<=0){
            [MJTimer cancelTask:timer];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                button.enabled = YES;
                [button setTitle:@"重新获取" forState:UIControlStateNormal];
            });
        }else{
            int seconds = timeout % second;
            NSLog(@"验证后台倒计时");
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                button.enabled = NO;
                [button setTitle:[NSString stringWithFormat:@"(%@s)",strTime] forState:UIControlStateDisabled];
                [UIView commitAnimations];
            });
            timeout--;
        }
    } start:0 interval:1 repeats:YES async:NO];
    [button setTitle:mjTimer forState:UIControlStateSelected];
    return;
}

#pragma mark  ----- addMasonry

@end
