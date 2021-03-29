//
//  MyBaseViewController.h
//  YOLO
//
//  Created by 潘亮 on 2021/2/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyBaseViewController : UIViewController

/** 发送验证码倒计时 */
- (void)startTimeBtn:(UIButton *)button second:(int)second;

@end

NS_ASSUME_NONNULL_END
