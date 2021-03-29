//
//  MyNavigationController.h
//  TogetherFortune
//
//  Created by soler on 15/01/2018.
//  Copyright © 2018 Centerm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNavigationController : UINavigationController

@end
@interface UINavigationController (SlideBack)

@property (nonatomic, assign) BOOL closeSlideBack;

@end
