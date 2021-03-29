
//
//  BBNavigationController.m
//  AlenMicroblog
//
//  Created by soler on 15/01/2018.
//  Copyright © 2018 Centerm. All rights reserved.
//

#import "MyNavigationController.h"
#import <objc/runtime.h>
#import "Header.h"

static const void *kcloseSlideBack = "closeSlideBack";
@interface MyNavigationController ()<UIGestureRecognizerDelegate>


@end

@implementation MyNavigationController

+ (void)load{
    [UINavigationBar appearance].barTintColor= [UIColor generateDynamicColor:[UIColor colorWithHexString:@"20242F"] darkColor:[UIColor colorWithHexString:@"#000000"]];
    NSMutableDictionary *atts = [[NSMutableDictionary alloc] init];
    atts[NSFontAttributeName] = kFont(18);
    atts[NSForegroundColorAttributeName] =[UIColor generateDynamicColor:[UIColor whiteColor] darkColor:[UIColor colorWithHexString:@"#F3F3F3"]];
    [[UINavigationBar appearance] setTitleTextAttributes:atts];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    // navigationBar 设置阴影
    self.navigationBar.layer.shadowColor =  [[UIColor colorWithHexString:@"20242F"] CGColor];
    self.navigationBar.layer.shadowOffset = CGSizeMake(0.3f , 0.3f);
    self.navigationBar.layer.shadowOpacity = 0.15f;
    self.navigationBar.layer.shadowRadius = 0.8f;
    
//    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    bgImgView.image = [UIImage imageNamed:@"huoying.jpg"];
//    [self.view addSubview:bgImgView];
//
//    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
//    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
//    effectView.frame = CGRectMake(0, -20, TFFullScreenWidth, 64);
////    [bgImgView addSubview:effectView];
//    [self.navigationBar addSubview:effectView];
    // 去掉 navigationBar 下面的线
    UIImageView *navLineImageView = [self findHairlineImageViewUnder:self.navigationBar];
    navLineImageView.hidden = YES;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
    }
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count >= 1) {
        
        if (YES == animated) {
            viewController.hidesBottomBarWhenPushed = YES;
        }
        if (viewController.navigationController.navigationItem.leftBarButtonItem == nil) {
            // 左上角的返回箭头
//            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navi_ic_back" highImage:@"navi_ic_back"];
        }
    }
    [super pushViewController:viewController animated:animated];
}
/**
 解决iOS14tabbar导航消失的bug
 */
- (NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    if (self.viewControllers.count > 1) {
        self.topViewController.hidesBottomBarWhenPushed = NO;
    }
    
    NSArray<UIViewController *> *viewControllers = [super popToRootViewControllerAnimated:animated];
    // self.viewControllers has two items here on iOS14
    return viewControllers;
}
- (void)back{
    [self popViewControllerAnimated:YES];
}

/**
 * 每当用户触发[返回手势]时都会调用一次这个方法
 * 返回值:返回YES,手势有效; 返回NO,手势失效
 * 可以处理在一级没有导航栏的页面，做左滑动手势，导致导航栏的卡顿
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    NSLog(@"%ld",self.childViewControllers.count);
    if (self.closeSlideBack) {
        return NO;
    }
    return self.childViewControllers.count > 1;
}
@end

@implementation UINavigationController (SlideBack)

- (void)setCloseSlideBack:(BOOL)closeSlideBack{
    objc_setAssociatedObject(self,kcloseSlideBack, [NSNumber numberWithBool:closeSlideBack], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)closeSlideBack{
    return [objc_getAssociatedObject(self, kcloseSlideBack) boolValue];
}

@end
