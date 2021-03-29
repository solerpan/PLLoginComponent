//
//  ProtocolLable.m
//  ShanyuanPulic
//
//  Created by gongyizhongguo on 2019/3/7.
//  Copyright © 2019 solerpan. All rights reserved.
//

#import "ProtocolLable.h"
#import "TTTAttributedLabel.h"
#import <PLCategoryPubKit/UIColor+Hex.h>
#import "Header.h"


#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface ProtocolLable()<TTTAttributedLabelDelegate>
@property (nonatomic ,weak)TTTAttributedLabel * holeLabel;
@end

@implementation ProtocolLable
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setProtocolLable];
    }
    return self;
}
- (void)setProtocolLable{
    TTTAttributedLabel * holeLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
    holeLabel.delegate = self;
    [self addSubview:holeLabel];
    holeLabel.textColor = [UIColor colorWithHexString:@"797F8B"];
    NSMutableAttributedString *str =
     [[NSMutableAttributedString alloc] initWithString:@"登录即代表您同意 YOLO服务协议 及 隐私政策" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName :[UIFont systemFontOfSize:12]}];
    holeLabel.attributedText = str;
    holeLabel.textAlignment = NSTextAlignmentCenter;
    [holeLabel makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.width);
        make.top.equalTo(self);
        make.height.equalTo(JSCaleH(24));
    }];
    holeLabel.linkAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"FF2D55"],
                                 NSUnderlineStyleAttributeName : [NSNumber numberWithInteger:NSUnderlineStyleSingle]
    };
    [holeLabel addLinkToURL:[NSURL URLWithString:@"firstAction"] withRange:NSMakeRange(9,8)];
    [holeLabel addLinkToURL:[NSURL URLWithString:@"secondAction"] withRange:NSMakeRange(20,4)];
}

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url {
    if ([url.absoluteString isEqualToString:@"firstAction"]) {
        //响应点击事件
        [self firstAction];
    }
    if ([url.absoluteString isEqualToString:@"secondAction"]) {
           //响应点击事件
        [self secondAction];
       }
}
- (void)secondAction{
    if (self.privacyClickBlcok) {
        self.privacyClickBlcok();
    }
}
- (void)firstAction{
    if (self.userProClickBlock) {
        self.userProClickBlock();
    }
}
@end
