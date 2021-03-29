//
//  Header.h
//  YOLO
//
//  Created by 潘亮 on 2021/2/25.
//

#ifndef Header_h
#define Header_h

#import <PLCategoryPubKit/UIColor+Hex.h>
#import <PLCategoryPubKit/UIFont+Extend.h>
#import "Helper.h"
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "MyNavigationController.h"

static NSString *const kBaseUrl = @"https://";//测试
static NSString * const kAFNetworkReachabilityStatus = @"AFNetworkReachabilityStatus";//获取网络状态
static NSString *const kMessage = @"message";
static NSString *const kCode = @"code";
static NSString *const kData = @"data";
static NSString *const kContent = @"content";
static NSString *const kToken = @"token";
static NSString *const kUserToken = @"userToken";
static NSString *const kMember_id = @"member_id";
static NSString *const kMember_info = @"member_info";
static NSString *const kVisitor = @"visitor";
static NSString *const klogOutToken = @"logOutToken";
static NSString *const kCmd = @"cmd";
static NSString *const kAction = @"action";
static NSString *const kUDID = @"UDID";
static NSString *const kUsers = @"Users";
static NSString *const kUdid = @"udid";
static NSString *const kBorrowApplyExtApi = @"BorrowApplyExtApi";


static NSString *const kTestTFJavaServerUrl     = @"https://apit.17shanyuan.com/1.0" ;//java测试域名
static NSString *const kOnlineTFJavaServerUrl     = @"https://api.17shanyuan.com" ;//java正式域名https://api.17shanyuan.com
static NSString *const kSimulationTFJavaServerUrl     = @"https://pre-api.17shanyuan.com";//java仿真域名
static NSString *const kGetPopupPopupImg = @"/layout-center/popup/popupImg";//获取闪屏图
static NSString *const kNotificationNeedAppearLogin = @"needAppearLogin";//弹起登录页面

static NSString *const kDownloadSplash_v1Url = @"/bocm/index.php?act=upload&op=updateSplashLogoV1";
#pragma mark - 屏幕尺寸
//设备全屏尺寸
#define TFFullScreenSize       [UIScreen mainScreen].bounds.size
//设备全屏宽度
#define TFFullScreenWidth      [UIScreen mainScreen].bounds.size.width
//设备全屏高度
#define TFFullScreenHeight     [UIScreen mainScreen].bounds.size.height

#define TFStatusBarHeight      [[UIApplication sharedApplication] statusBarFrame].size.height
// warning: iPhone X 中不是64，用 self.navigationController.navigationBar.ak_height + kStatusH  替换

#define Data_CENTER [Context sharedInstance].m_dataCenter

//测试用
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WINDOW_HEIGHT (SCREEN_HEIGHT-(STATUS_HEIGHT+44))
#define STATUS_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height//状态栏高度

#define kIsNull(obj)   (((obj) == nil) || ([(obj) isEqual:[NSNull null]]))
#define kVKString(str) (kIsNull(str) ? @"" : str)

#define StandardUserDefaults [NSUserDefaults standardUserDefaults]

#define JSCaleW(WIDTH) (WIDTH * (TFFullScreenWidth /375.000000))
#define JSCaleH(WIDTH) (WIDTH * (TFFullScreenWidth /375.000000))
#define JSCaleScrenH(HEIGHT) (HEIGHT * (TFFullScreenHeight /812.000000))
//kIsiPhoneX ? (HEIGHT * 1.1) : (HEIGHT * (TFFullScreenHeight /667.000000))
#pragma mark - 快速获取 App Delegate  和 keyWindow
#define APP_Delegate  [[UIApplication sharedApplication] delegate]
#define Progress_Window [[UIApplication sharedApplication] keyWindow]

//当前设备是不是iPhone and iPod touch
#define kIsiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define QM_IS_IPHONEX (([[UIScreen mainScreen] bounds].size.height-812)?NO:YES)
//设备适配
//当前设备的开发宽度
#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)
//当前设备的开发高度
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)

//当前手机是不是3.5寸手机
#define kIsiPhone4 (kIsiPhone && kScreenHeight == 480.0)
//当前设备是不是4寸手机
#define kIsiPhone5 (kIsiPhone && kScreenHeight == 568.0)
//当前设备是不是4.7寸手机
#define kIsiPhone6 (kIsiPhone && kScreenHeight == 667.0)
//当前设备是不是5.5寸手机
#define kIsiPhone6P (kIsiPhone && kScreenHeight == 736.0)
#define kIsThreeImg (kIsiPhone6P ? @"3" : @"2")
#define kIPhoneXTabbarHeight 83

#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size): NO)
//判断iPhoneXsMax
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE_ALL (IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs_Max)
//#define kIsiPhoneX (kIsiPhone && kScreenHeight == 1218.0)
#pragma mark - 适配

#define SCREEN_HEIGHTL [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTHL [UIScreen mainScreen].bounds.size.width
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPhoneX_All_New ((int)((SCREEN_HEIGHTL/SCREEN_WIDTHL)*100) == 216) ? YES : NO

#define kIsIPhoneX ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)

//状态栏+导航栏的高度
#define kStatusBarAndNavigationBarHeight (kIsIPhoneX ? 88.f : 64.f)

//底部高的
#define kBottomSafeHeight (kIsIPhoneX ? 34.f : 0.f)

#define  SYSTEM_VERSION  [[[UIDevice currentDevice] systemVersion] floatValue]

#define  IOS7_Later      ([[[UIDevice currentDevice] systemVersion]floatValue] >= 7.0)
#define  IOS8_Later      ([[[UIDevice currentDevice] systemVersion]floatValue] >= 8.0)
#define  IOS9_Later      ([[[UIDevice currentDevice] systemVersion]floatValue] >= 9.0)
#define  IOS10_Later      ([[[UIDevice currentDevice] systemVersion]floatValue] >= 10.0)
#define  IOS11_Later      ([[[UIDevice currentDevice] systemVersion]floatValue] >= 11.0)


#define isIPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define isIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define isIPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define isIPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define isIPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define TZ_isIphoneX ({\
int tmp = 0;\
if (@available(iOS 11.0, *)) {\
if ([UIApplication sharedApplication].delegate.window.safeAreaInsets.top > 20) {\
tmp = 1;\
}else{\
tmp = 0;\
}\
}else{\
tmp = 0;\
}\
tmp;\
})


// block self
#define WEAKSELF typeof(self) __weak weakSelf = self;

#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(...)
#endif

#pragma mark - 第三方库key


#pragma mark -  快速设置 字体 图片
#define kFont(Size) [UIFont customRegularFontOfSize:(Size)]
#define kBoldFont(Size) [UIFont customBoldFontOfSize:(Size)]
#define kColor(Number) [UIColor colorWithHexString:Number];
#define kRegularFont(Size) [UIFont customRegularFontOfSize:(Size)]
#define kImage(Name) [UIImage imageNamed:Name]

#pragma mark - 图片尺寸相关
#define JSCaleImageW(Image) (JSCaleW(Image.size.width))
#define JSCaleImageH(Image) (JSCaleH(Image.size.height))
#define JSCaleImageSize(Image) (CGSizeMake(JSCaleImageW(Image), JSCaleImageH(Image)))

#pragma mark - 常用界面设置
#define kMargin (JSCaleW(15.0))           //水平边缘间距左右
#define kVertical_Margin (JSCaleH(10.0))        //垂直间距上下
#define kLineH (0.4)                 //分割线高度
#define kRowH (JSCaleH(44))                   //行高
#define kBtnH (JSCaleH(49))                //按钮高度
#define kStatusH [[UIApplication sharedApplication] statusBarFrame].size.height
//#define kNavBarH 64
#define kNoNavHeight (SCREEN_HEIGHT - kNavBarH) //没有导航栏的高度

/**
 状态栏 导航栏  tabbar高度
 
 */
#define kIs_iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kIs_iPhoneX kScreenWidth >=375.0f && kScreenHeight >=812.0f&& kIs_iphone
    
/*状态栏高度*/
#define kStatusBarHeight (CGFloat)(kIs_iPhoneX?(44.0):(20.0))
/*导航栏高度*/
#define kNavBarHeight (44)
/*状态栏和导航栏总高度*/
#define kNavBarAndStatusBarHeight (CGFloat)(kIs_iPhoneX?(88.0):(64.0))
/*TabBar高度*/
#define kTabBarHeight (CGFloat)(kIs_iPhoneX?(49.0 + 34.0):(49.0))
/*顶部安全区域远离高度*/
#define kTopBarSafeHeight (CGFloat)(kIs_iPhoneX?(44.0):(0))
 /*底部安全区域远离高度*/
#define kBottomSafeHeight (CGFloat)(kIs_iPhoneX?(34.0):(0))
/*iPhoneX的状态栏高度差值*/
#define kTopBarDifHeight (CGFloat)(kIs_iPhoneX?(24.0):(0))
/*导航条和Tabbar总高度*/
#define kNavAndTabHeight (kNavBarAndStatusBarHeight + kTabBarHeight)


//video
#define RECORD_MAX_TIME 8.0           //最长录制时间
#define TIMER_INTERVAL 0.05         //计时器刷新频率
#define VIDEO_FOLDER @"videoFolder" //视频录制存放文件夹

#pragma mark - 按钮状态 颜色
#define kBtnTitle  AKColorFromRGB(0xffffff)  //按钮正常状态文字颜色
#define kBtnTitle_Pre AKColorFromRGB(0xffffff)  //按钮按下状态文字颜色
#define kBtnTitle_Dis AKColorFromRGB(0xffffff) //按钮不可点击文字颜色
#define kBtnBg AKColorFromRGB(0xDB4528)          //按钮正常状态背景颜色
#define kBtnBg_Pre AKColorFromRGB(0xDB4528 )          //按钮按下状态背景颜色
#define kBtnBg_Dis AKColorFromRGB(0x4A90E2)          //按钮不可点击背景颜色

#pragma mark - 常用主色
#define kBgColor AKColorFromRGB(0x20242F)          //背景色
#define kThemeColor AKColorFromRGB(0xFF1919)        //主色调
#define kLineColor AKColorFromRGB(0xdcdcdc)        //分割线颜色
#define kGray3Color AKColorFromRGB(0x333333)    //主要的黑
#define kGray6Color AKColorFromRGB(0x666666)
#define kGray9Color AKColorFromRGB(0x999999)

// back
#define kColor4b4f63 AKColorFromRGB(0x4b4f63)
#define kColor666A7F AKColorFromRGB(0x666A7F)
#define kColor818C9E AKColorFromRGB(0x818C9E)
#define kColorB1B8C4 AKColorFromRGB(0xB1B8C4)
#define kColorDADEE4 AKColorFromRGB(0xDADEE4)

#define kColor4A90E2 AKColorFromRGB(0x4A90E2)  //蓝色

// 16进制灰色
#define kGrayHexColor(hexNum) Color_RGB((hexNum & 0xFF),(hexNum & 0xFF),(hexNum & 0xFF))
// 16进制灰色 + 透明度
#define kGrayHexColorA(hexNum,A) Color_RGBA((hexNum & 0xFF),(hexNum & 0xFF),(hexNum & 0xFF),A)
// 10进制灰色
#define kGrayDecimalColor(decimalColorNum) Color_RGB(decimalColorNum,decimalColorNum,decimalColorNum)
// 10进制灰色 + 透明度
#define kGrayDecimalColorA(decimalColorNum,A) Color_RGBA(decimalColorNum,decimalColorNum ,decimalColorNum,A)

// 十六进制颜色值
#define AKColorFromRGB(RGBValue) [UIColor colorWithRed:((float)((RGBValue & 0xFF0000) >> 16))/255.0 green:((float)((RGBValue & 0xFF00) >> 8))/255.0 blue:((float)(RGBValue & 0xFF))/255.0 alpha:1]

//十进制颜色转换
#define RGBCOLOR(r,g,b)         [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a)      [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
//十六进制颜色转换（0xFFFFFF）
#define HEXRGBCOLOR(hex)        [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]
#define HEXRGBACOLOR(hex,a)     [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:a]

#define AKColorFromRGBA(RGBValue , a) [UIColor colorWithRed:((float)((RGBValue & 0xFF0000) >> 16))/255.0 green:((float)((RGBValue & 0xFF00) >> 8))/255.0 blue:((float)(RGBValue & 0xFF))/255.0 alpha:a]
// 随机色
#define AKRandomColor AKColor(arc4random_uniform(256), arc4random_uniform(256),arc4random_uniform(256))
// 随机暖色
#define AKRandomNumber (arc4random_uniform(40) + 210)
#define AKRandomColorBeauty [UIColor colorWithRed:AKRandomNumber/255.0 green:AKRandomNumber/255.0 blue:AKRandomNumber/255.0 alpha:1]

#define AKColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#endif /* Header_h */
