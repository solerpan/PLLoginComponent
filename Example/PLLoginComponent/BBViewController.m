//
//  BBViewController.m
//  PLLoginComponent
//
//  Created by solerpan on 03/25/2021.
//  Copyright (c) 2021 solerpan. All rights reserved.
//

#import "BBViewController.h"
#import "PLLoginComponent/BBLoginViewController.h"
#import "PLLoginComponent/MyNavigationController.h"
#import <CTMediator+BBLoginModule.h>

@interface BBViewController ()

@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    BBLoginViewController*vc = [[CTMediator sharedInstance] LoginModule_viewControllerWithParam:@{} callback:^(NSString * _Nonnull result) {
        NSLog(@"resultA: --- %@", result);
    }];
        
    
    
    MyNavigationController * nav = [[MyNavigationController alloc] initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}
@end
