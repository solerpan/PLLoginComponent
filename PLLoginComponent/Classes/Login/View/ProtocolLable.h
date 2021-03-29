//
//  ProtocolLable.h
//  ShanyuanPulic
//
//  Created by gongyizhongguo on 2019/3/7.
//  Copyright © 2019 solerpan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProtocolLable : UIView
@property (nonatomic ,copy)void(^userProClickBlock)(void);
@property (nonatomic ,copy)void(^privacyClickBlcok)(void);
@end

NS_ASSUME_NONNULL_END
