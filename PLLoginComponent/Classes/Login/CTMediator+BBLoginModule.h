//
//  CTMediator+BBLoginModule.h
//  PLLoginComponent_Example
//
//  Created by 潘亮 on 2021/3/26.
//  Copyright © 2021 solerpan. All rights reserved.
//

#import "CTMediator.h"

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (BBLoginModule)
- (UIViewController *)LoginModule_viewControllerWithParam:(NSDictionary *)pararm callback:(void(^)(NSString *result))callback;
@end

NS_ASSUME_NONNULL_END
