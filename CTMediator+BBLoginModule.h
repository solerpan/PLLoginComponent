//
//  CTMediator+BBLoginModule.h
//  PLLoginComponent-PLLoginComponent
//
//  Created by 潘亮 on 2021/3/26.
//

#import <CTMediator/CTMediator.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (BBLoginModule)
- (UIViewController *)LoginModule_viewControllerWithParam:(NSDictionary *)pararm callback:(void(^)(NSString *result))callback;
@end

NS_ASSUME_NONNULL_END
