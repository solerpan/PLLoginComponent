//
//  Helper.m
//  generalDemo
//
//  Created by Alen on 17-2-27.
//  Copyright (c) 2014年 币宝. All rights reserved.
//
#import "Helper.h"
#import "Header.h"


@implementation Helper

+ (NSString *)getBuildString{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)getCurrentVersion {

    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    return appVersion;
}
/**
 通过view获取vc
 */
+(UIViewController*)viewController:(UIView *)responder{
    UIResponder *nextResponder =  responder;
    do{
    nextResponder = [nextResponder nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
    } while (nextResponder != nil);
    return nil;
}

#pragma mark - 对图片尺寸进行压缩
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

+ (NSString *)saveImage:(UIImage *)image imageName:(NSString *)imageName{
    if (!image) {  //防止image不存在，存一个占位图
        image = [UIImage imageNamed:@"posters_default_horizontal"];
    }
    if (!imageName) { //防止imgName不存在,获取一个随机字符串
        //        imageName = [NSString uuid];
    }
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    path = [path stringByAppendingPathComponent:imageName];
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:path atomically:YES];
    return path;
}

+ (UIImage *)imageWithColor:(UIColor *)color

{

    CGRect rect = CGRectMake(0, 0, 1, 1);

    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);

    [color setFill];

    UIRectFill(rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();


    return image;

}

#pragma mark  ---- 贝塞尔曲线
+ (CAShapeLayer *)bezierCircle:(CGPoint )point radius:(CGFloat)radiu{
    CAShapeLayer *layer = [CAShapeLayer new];
       layer.lineWidth = 2;
       //圆环的颜色
       layer.strokeColor = [UIColor colorWithHexString:@"FF2D55"].CGColor;
       //背景填充色
       layer.fillColor = [UIColor clearColor].CGColor;
       //设置半径为10
       CGFloat radius = radiu;
       //按照顺时针方向
       BOOL clockWise = true;
       //初始化一个路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:(0) endAngle:M_PI * 2 clockwise:clockWise];
       layer.path = [path CGPath];
     return layer;
}
@end

