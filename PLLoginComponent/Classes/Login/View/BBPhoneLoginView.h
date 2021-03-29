//
//  BBPhoneLoginView.h
//  YOLO
//
//  Created by 潘亮 on 2021/3/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBPhoneLoginView : UIView
@property (nonatomic, copy) void(^closePhoneLoginBlock)(void);
@end

NS_ASSUME_NONNULL_END
