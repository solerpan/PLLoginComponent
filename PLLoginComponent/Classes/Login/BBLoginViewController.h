//
//  BBLoginViewController.h
//  YOLO
//
//  Created by 潘亮 on 2021/3/8.
//

#import "MyBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BBLoginViewController : MyBaseViewController
@property (nonatomic ,copy) void(^loginCallBack) (NSString *);
@property (nonatomic ,strong) NSDictionary * params;

@end

NS_ASSUME_NONNULL_END
