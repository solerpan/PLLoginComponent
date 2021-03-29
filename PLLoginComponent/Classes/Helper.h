//
//  Helper.h
//  generalDemo
//
//  Created by Alen on 17-2-27.
//  Copyright (c) 2014年 币宝. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject

/**
 *  获取版本号bulid
 *
 *
 */
+ (NSString *)getBuildString;

/**
 *  @author lixianhong, 16-08-11 16:08:59
 *
 *  获取当前版本号
 *
 *  @return 去除.后的版本号
 */
+ (NSString *)getCurrentVersion;

/**
 *  通过view获取vc
 *
 *
 */
+(UIViewController*)viewController:(UIView *)responder;

/**
 *  根据颜色切图片
 *
 *
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
/**
 *  画圆环
 *
 *
 */
+ (CAShapeLayer *)bezierCircle:(CGPoint )point radius:(CGFloat)radiu;
//对图片尺寸进行压缩
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

/** 存储图片到document */
+ (NSString *)saveImage:(UIImage *)image imageName:(NSString *)imageName;
@end


