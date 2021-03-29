//
//  BBLoginViewController.m
//  YOLO
//
//  Created by 潘亮 on 2021/3/8.
//

#import "BBLoginViewController.h"
#import "BBLoginView.h"
#import <AVFoundation/AVFoundation.h>
#import "LoginVideoViewController.h"

@interface BBLoginViewController ()
@property (nonatomic, strong) AVPlayerItem      *getPlayItem;
@property (nonatomic, strong) AVPlayerLayer     *playerLayer;
@property (nonatomic, strong) AVPlayer          *player;

@property (nonatomic ,strong) BBLoginView           *loginView;
@end

@implementation BBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     构建视频layer
     */
    [self setupForAVplayerView];
    
    /**
     构建UI
     */
    [self setUI];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    //视频播放
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playVideos) name:@"appBecomeActive" object:nil];
}
- (void)playVideos
{
    [self.player play];
}
- (void)setUI{
    [self.view addSubview:self.loginView];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.loginCallBack){
        self.loginCallBack(@"把token留出来");
    }
}
#pragma mark ---- lazy
- (BBLoginView *)loginView{
    if (!_loginView) {
        _loginView = [[BBLoginView alloc] initWithFrame:self.view.bounds];
    }
    return _loginView;
}
#pragma mark  ---- 视频播放
- (void)setupForAVplayerView
{
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    playerLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:playerLayer];
}
/**
 *  初始化播放器
 */
- (AVPlayer *)player
{
    if (!_player) {
        AVPlayerItem *playerItem = [self getPlayItem];
        _player = [AVPlayer playerWithPlayerItem:playerItem];
        //设置重复播放
        _player.actionAtItemEnd = AVPlayerActionAtItemEndNone; // set this
        //视频播放完发通知
        [_player play];
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(__playerItemDidPlayToEndTimeNotification:)
                                                    name:AVPlayerItemDidPlayToEndTimeNotification
                                                  object:nil];
        
    }
    return _player;
}

- (AVPlayerItem *)getPlayItem
{
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]]; //图片名称要写全称
    NSString *path = [currentBundle pathForResource:@"1.mp4" ofType:nil inDirectory:@"PLLoginComponent.bundle"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
    return playerItem;
}

- (void)__playerItemDidPlayToEndTimeNotification:(NSNotification *)sender
{
    [_player seekToTime:kCMTimeZero]; // 设置从头继续播放
}
- (void)dealloc{
    NSLog(@"%@销毁了",NSStringFromClass([self class]));
}
@end
