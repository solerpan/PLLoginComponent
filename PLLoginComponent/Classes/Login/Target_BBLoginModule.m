//
//  Target_BBLoginModule.m
//  PLLoginComponent_Example
//
//  Created by 潘亮 on 2021/3/26.
//  Copyright © 2021 solerpan. All rights reserved.
//

#import "Target_BBLoginModule.h"
#import "BBLoginViewController.h"

@implementation Target_BBLoginModule
- (UIViewController *)Action_jumpVC:(NSDictionary *)params{
    Class class = NSClassFromString(@"BBLoginViewController");
    BBLoginViewController * vc = (BBLoginViewController *)[[class alloc] init];
    vc.loginCallBack = params[@"callback"];
    vc.params = params[@"params"];
    return vc;
}
@end
