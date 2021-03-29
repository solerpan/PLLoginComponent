//
//  CTMediator+BBLoginModule.m
//  PLLoginComponent_Example
//
//  Created by 潘亮 on 2021/3/26.
//  Copyright © 2021 solerpan. All rights reserved.
//

#import "CTMediator+BBLoginModule.h"

@implementation CTMediator (BBLoginModule)
- (UIViewController *)LoginModule_viewControllerWithParam:(NSDictionary *)pararm callback:(void(^)(NSString *result))callback{
    NSMutableDictionary *url_params = [[NSMutableDictionary alloc] init];
    url_params[@"callback"] = callback;
    url_params[@"params"] = pararm;
    return [self performTarget:@"BBLoginModule" action:@"jumpVC" params:url_params shouldCacheTarget:NO];
}
@end
