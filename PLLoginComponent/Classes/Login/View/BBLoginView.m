//
//  BBLoginView.m
//  YOLO
//
//  Created by 潘亮 on 2021/3/8.
//

#import "BBLoginView.h"
#import "ProtocolLable.h"
#import "LoginVideoViewController.h"
#import "Header.h"

@interface BBLoginView()
@property (nonatomic ,strong) UIImageView           *closeImage;
@property (nonatomic ,strong) UIImageView           *loginImage;
@property (nonatomic ,strong) UILabel               *descLabel;
@property (nonatomic ,strong) UIView                *phoneFieldView;
@property (nonatomic ,strong) UITextField           *phoneField;
@property (nonatomic ,strong) UIView                *codeFieldView;
@property (nonatomic ,strong) UITextField           *codeField;
@property (nonatomic ,strong) UILabel               *lineLabel;
@property (nonatomic ,strong) UIButton              *codeBtn;
@property (nonatomic ,strong) UIButton              *loginBtn;
@property (nonatomic, strong) ProtocolLable         *proView;
@end

@implementation BBLoginView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.closeImage];
        [self addSubview:self.loginImage];
        [self addSubview:self.descLabel];
        [self addSubview:self.phoneFieldView];
        [self.phoneFieldView addSubview:self.phoneField];
        [self addSubview:self.codeFieldView];
        [self.codeFieldView addSubview:self.codeField];
        [self.codeFieldView addSubview:self.lineLabel];
        [self.codeFieldView addSubview:self.codeBtn];
        [self addSubview:self.loginBtn];
        [self addSubview:self.proView];
        [self addMasonry];
    }
    return  self;
}

#pragma mark ---- method
- (void)getCodeBtnLoginClick:(UIButton *)sender{
    /**
     模拟推出login
     */
    LoginVideoViewController * vc = [[LoginVideoViewController alloc] init];
    
    MyNavigationController * nav = [[MyNavigationController alloc] initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [[Helper viewController:self] presentViewController:nav animated:YES completion:^{
        
    }];
}
- (void)colsePage{
    [[Helper viewController:self] dismissViewControllerAnimated:YES completion:nil];
}

- (void)login:(UIButton *)sender{
//    [[Helper viewController:self] dismissViewControllerAnimated:YES completion:^{
//        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//
//        MyTabBarViewController *tabViewController = (MyTabBarViewController *) appDelegate.window.rootViewController;
//
//       [tabViewController setSelectedIndex:4];
//    }];
}
#pragma mark   -----     lazy
- (UIImageView *)closeImage{
    if (!_closeImage) {
        _closeImage = [[UIImageView alloc] init];
        _closeImage.image = kImage(@"login_Close");
        _closeImage.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colsePage)];
        [_closeImage addGestureRecognizer:tap];
    }
    return _closeImage;
}

- (UIImageView *)loginImage{
    if (!_loginImage) {
        _loginImage = [[UIImageView alloc] init];
        _loginImage.image = kImage(@"YOLO");
        NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:@"PLLoginComponent" withExtension:@"bundle"];
                if (bundleURL) {
                    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
                    NSInteger scale = [[UIScreen mainScreen] scale];
                    NSString *imgName = [NSString stringWithFormat:@"%@@%zdx.png", @"YOLO",scale];
                    _loginImage.image = [UIImage imageWithContentsOfFile:[bundle pathForResource:imgName ofType:nil]];
                }
    }
    return _loginImage;
}

- (UILabel *)descLabel{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.font = kBoldFont(17);
        _descLabel.textColor = kColor(@"FFFFFF");
        _descLabel.text = @"定制您的专属快乐";
    }
    return _descLabel;
}

-(UIView *)phoneFieldView{
    if (!_phoneFieldView) {
        _phoneFieldView = [[UIView alloc] init];
        _phoneFieldView.layer.cornerRadius = JSCaleW(22);
        _phoneFieldView.layer.masksToBounds = YES;
        _phoneFieldView.backgroundColor = kColor(@"FFFFFF");
        _phoneFieldView.alpha = 0.7;
    }
    return _phoneFieldView;
}

- (UITextField *)phoneField{
    if (!_phoneField) {
        _phoneField = [[UITextField alloc] init];
        _phoneField.placeholder = @"输入手机号码";
        _phoneField.font = kFont(17);
        _phoneField.backgroundColor = kColor(@"FFFFFF");
    }
    return _phoneField;
}

-(UIView *)codeFieldView{
    if (!_codeFieldView) {
        _codeFieldView = [[UIView alloc] init];
        _codeFieldView.layer.cornerRadius = JSCaleW(22);
        _codeFieldView.layer.masksToBounds = YES;
        _codeFieldView.backgroundColor = kColor(@"FFFFFF");
        _codeFieldView.alpha = 0.7;
    }
    return _codeFieldView;
}

-(UITextField *)codeField{
    if (!_codeField) {
        _codeField = [[UITextField alloc] init];
        _codeField.placeholder = @"输入验证码";
        _codeField.font = kFont(17);
        _codeField.backgroundColor = kColor(@"FFFFFF");
    }
    return _codeField;
}

-(UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = kColor(@"FF2D55");
    }
    return _lineLabel;
}

- (UIButton *)codeBtn{
    if (!_codeBtn) {
        _codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _codeBtn.titleLabel.font = kFont(15);
        [_codeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_codeBtn addTarget:self action:@selector(getCodeBtnLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeBtn;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.backgroundColor = kColor(@"FF2D55");
        _loginBtn.titleLabel.font = kBoldFont(15);
        _loginBtn.layer.cornerRadius = 22;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

-(ProtocolLable *)proView{
    if (!_proView) {
        _proView = [[ProtocolLable alloc] init];
    }
    return _proView;
}
#pragma mark  -----   masonry

- (void)addMasonry{
    WEAKSELF
    [self.closeImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(JSCaleW(21));
        make.top.equalTo(weakSelf).offset(JSCaleH(58));
        make.width.height.equalTo(JSCaleW(16));
    }];
    
    [self.loginImage makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(JSCaleW(30));
        make.top.equalTo(JSCaleScrenH(115));
        make.height.equalTo(JSCaleH(34));
        make.width.equalTo(JSCaleW(150));
    }];
    
    [self.descLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(weakSelf.loginImage);
        make.top.equalTo(weakSelf.loginImage.bottom).offset(JSCaleH(17.5));
        make.height.equalTo(JSCaleH(22));
    }];
    
    [self.phoneFieldView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.loginImage);
        make.right.equalTo(weakSelf.right).offset(JSCaleW(-30));
        make.height.equalTo(JSCaleH(44));
        make.top.equalTo(weakSelf.descLabel.bottom).offset(JSCaleW(60));
    }];
    
    [self.phoneField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.phoneFieldView).offset(JSCaleW(20));
        make.right.equalTo(weakSelf.phoneFieldView);
        make.top.height.equalTo(weakSelf.phoneFieldView);
    }];
    
    [self.codeFieldView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.loginImage);
        make.right.equalTo(weakSelf.right).offset(JSCaleW(-30));
        make.height.equalTo(JSCaleH(44));
        make.top.equalTo(weakSelf.phoneField.bottom).offset(JSCaleW(10));
    }];
    
    [self.codeField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.codeFieldView).offset(JSCaleW(20));
        make.right.equalTo(weakSelf.codeFieldView);
        make.top.height.equalTo(weakSelf.codeFieldView);
    }];
    
    [self.lineLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.codeFieldView);
        make.height.equalTo(JSCaleH(22));
        make.width.equalTo(JSCaleW(0.5));
        make.right.equalTo(weakSelf.codeFieldView.right).offset(JSCaleW(-130));
    }];
    
    [self.codeBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.codeFieldView);
        make.left.equalTo(weakSelf.lineLabel.right).offset(JSCaleW(15));
        make.height.equalTo(JSCaleH(22));
    }];
    
    [self.loginBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.loginImage);
        make.right.equalTo(weakSelf.right).offset(JSCaleW(-30));
        make.height.equalTo(JSCaleH(44));
        make.top.equalTo(weakSelf.codeField.bottom).offset(JSCaleW(40));
    }];
    
    [self.proView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.loginBtn.bottom).offset(JSCaleH(20));
        make.height.equalTo(JSCaleW(24));
        make.width.equalTo(weakSelf);
    }];
    
}
@end
