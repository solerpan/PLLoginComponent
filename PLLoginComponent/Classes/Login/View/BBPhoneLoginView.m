//
//  BBPhoneLoginView.m
//  YOLO
//
//  Created by 潘亮 on 2021/3/5.
//

#import "BBPhoneLoginView.h"
#import "ProtocolLable.h"
#import "Header.h"

@interface BBPhoneLoginView()

@property (nonatomic, strong) UIImageView       *logoImg;
@property (nonatomic, strong) UILabel           *phoneLabel;
@property (nonatomic, strong) UIButton          *changeBtn;
@property (nonatomic, strong) UIButton          *loginBtn;
@property (nonatomic, strong) ProtocolLable     *proView;
@property (nonatomic, strong) UIImageView       *closeImg;

@end
@implementation BBPhoneLoginView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.closeImg];
        [self addSubview:self.logoImg];
        [self addSubview:self.phoneLabel];
        [self addSubview:self.changeBtn];
        [self addSubview:self.loginBtn];
        [self addSubview:self.proView];
        [self addMasonry];
    }
    return  self;
}
#pragma mark  ---- 事件
- (void)close{
    if (self.closePhoneLoginBlock) {
        self.closePhoneLoginBlock();
    }
}

- (void)moreAction:(UIButton *)sender{
    [[Helper viewController:self] dismissViewControllerAnimated:YES completion:nil];
}

- (void)phoneLogin:(UIButton *)sender{
    [[Helper viewController:self] dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark ----lazy
-(UIImageView *)closeImg{
    if (!_closeImg) {
        _closeImg = [[UIImageView alloc] init];
        _closeImg.image = kImage(@"login_Close");
        _closeImg.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
        [_closeImg addGestureRecognizer:tap];
    }
    return _closeImg;
}
-(ProtocolLable *)proView{
    if (!_proView) {
        _proView = [[ProtocolLable alloc] init];
    }
    return _proView;
}
-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.backgroundColor = kColor(@"FF2D55");
        _loginBtn.titleLabel.font = kBoldFont(15);
        _loginBtn.layer.cornerRadius = 22;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_loginBtn setTitle:@"本机号码登录" forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(phoneLogin:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
-(UIButton *)changeBtn{
    if (!_changeBtn) {
        _changeBtn = [[UIButton alloc] init];
        _changeBtn.titleLabel.font = kFont(17);
        _changeBtn.titleLabel.textColor = kColor(@"797F8B");
        [_changeBtn setTitle:@"更多" forState:UIControlStateNormal];
        [_changeBtn addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeBtn;
}
-(UILabel *)phoneLabel{
    if (!_phoneLabel) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.font = kBoldFont(17);
        _phoneLabel.textColor = kColor(@"FFFFFF");
        _phoneLabel.text = @"186****9394";
    }
    return _phoneLabel;
}
- (UIImageView *)logoImg{
    if (!_logoImg) {
        _logoImg = [[UIImageView alloc] init];
        NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:@"PLLoginComponent" withExtension:@"bundle"];
                if (bundleURL) {
                    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
                    NSInteger scale = [[UIScreen mainScreen] scale];
                    NSString *imgName = [NSString stringWithFormat:@"%@@%zdx.png", @"logoyolo",scale];
                    _logoImg.image = [UIImage imageWithContentsOfFile:[bundle pathForResource:imgName ofType:nil]];
                }
    }
    return _logoImg;
}

#pragma mark ---- adMasonry
- (void)addMasonry{
    WEAKSELF
    [self.closeImg makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(JSCaleW(21));
        make.top.equalTo(weakSelf).offset(JSCaleH(58));
        make.width.height.equalTo(JSCaleW(16));
    }];
    
    [self.logoImg makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf);
        make.top.equalTo(weakSelf).offset(JSCaleScrenH(512));
        make.width.equalTo(JSCaleW(182.5));
        make.height.equalTo(JSCaleH(45));
    }];
    
    [self.phoneLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.logoImg.bottom).offset(JSCaleH(30));
        make.left.equalTo(weakSelf).offset(JSCaleW(111));
        make.height.equalTo(JSCaleH(24));
        make.width.equalTo(JSCaleW(105));
    }];
    
    [self.changeBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.phoneLabel);
        make.width.equalTo(JSCaleW(34));
        make.height.equalTo(JSCaleH(24));
        make.left.equalTo(weakSelf.phoneLabel.right).offset(JSCaleW(15));
    }];
    
    [self.loginBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf);
        make.left.equalTo(weakSelf).offset(JSCaleW(30));
        make.right.equalTo(weakSelf).offset(JSCaleW(-30));
        make.height.equalTo(JSCaleH(44));
        make.top.equalTo(weakSelf.phoneLabel.bottom).offset(JSCaleH(50));
    }];
    
    [self.proView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginBtn.bottom).offset(JSCaleH(20));
        make.height.equalTo(JSCaleW(24));
        make.width.equalTo(weakSelf);
    }];
}
@end
