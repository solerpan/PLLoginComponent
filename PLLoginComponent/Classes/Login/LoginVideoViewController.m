//
//  LoginVideoViewController.m
//  YOLO
//
//  Created by 潘亮 on 2021/3/4.
//

#import "LoginVideoViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "BBPhoneLoginView.h"
#import "Header.h"

@interface LoginVideoViewController ()
@property (nonatomic, strong) AVPlayerItem      *getPlayItem;
@property (nonatomic, strong) AVPlayerLayer     *playerLayer;
@property (nonatomic, strong) AVPlayer          *player;

@property (nonatomic, strong) BBPhoneLoginView  *viedeoBackView;
@end

@implementation LoginVideoViewController

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
    /**
     blockAction
     */
    [self allActions];
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
#pragma mark ---UI
- (void)setUI{
    
    [self.view addSubview:self.viedeoBackView];
    [self addMasonry];
}
- (void)allActions{
    WEAKSELF
    self.viedeoBackView.closePhoneLoginBlock = ^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
}
-(UIView *)viedeoBackView{
    if (!_viedeoBackView) {
        _viedeoBackView = [[BBPhoneLoginView alloc] initWithFrame:self.view.bounds];
//        _viedeoBackView.backgroundColor = [UIColor blackColor];
//        _viedeoBackView.alpha = 0.3;
    }
    return _viedeoBackView;
}
- (void)setupForAVplayerView
{
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    playerLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:playerLayer];
}

#pragma mark ---- adMasonry
- (void)addMasonry{
    
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
