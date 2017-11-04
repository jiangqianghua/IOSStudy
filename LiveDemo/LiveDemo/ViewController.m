//
//  ViewController.m
//  LiveDemo
//
//  Created by jiangqianghua on 17/8/1.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ViewController.h"
@interface ViewController () <AlivcLiveSessionDelegate>
@property (strong, nonatomic)  UIButton *btnPlayOrPause;
@end

@implementation ViewController

-(void) initView
{
    _btnPlayOrPause = [UIButton buttonWithType:UIButtonTypeSystem];
    _btnPlayOrPause.frame = CGRectMake(50,50, 300, 50);
    [_btnPlayOrPause setTitle:@"推流" forState:UIControlStateNormal];
    [_btnPlayOrPause setTitle:@"停止" forState:UIControlStateSelected];
        [_btnPlayOrPause addTarget:self action:@selector(btnPlayOrPauseClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnPlayOrPause];

}

-(void)initConfig
{
    //初始化 config 配置类
   configuration = [[AlivcLConfiguration alloc] init];
    //设置推流地址
    configuration.url = @"rtmp://livemediabs.xdfkoo.com/mediaserver/myroom";
    //设置最大码率
    configuration.videoMaxBitRate = 1500 * 1000;
    //设置当前视频码率
    configuration.videoBitRate = 600 * 1000;
    //设置最小码率
    configuration.videoMinBitRate = 400 * 1000;
    //设置视频帧率
    configuration.fps = 25;
    //设置音频码率
    configuration.audioBitRate = 64 * 1000;
    //设置直播分辨率
    configuration.videoSize = CGSizeMake(360, 640);
    //设置横竖屏
    configuration.screenOrientation = AlivcLiveScreenVertical;
    //设置摄像头采集质量
    configuration.preset = AVCaptureSessionPresetiFrame1280x720;
    //设置前置摄像头或后置摄像头
    configuration.position = AVCaptureDevicePositionFront;
    //设置水印图片
    configuration.waterMaskImage = [UIImage imageNamed:@"watermask"];
    //设置水印位置
    configuration.waterMaskLocation = 1;
    //设置水印相对x边框距离
    configuration.waterMaskMarginX = 10;
    //设置水印相对y边框距离 
    configuration.waterMaskMarginY = 10;
    //设置重连超时时长
    configuration.reconnectTimeout = 5;
}

-(void)createSession
{
    //初始化 liveSession 类
    self.liveSession = [[AlivcLiveSession alloc]
                        initWithConfiguration: configuration];
    //设置session代理
    self.liveSession.delegate = self;
}

-(void)liveOperation
{
    
    //设置闪光灯模式
    self.liveSession.torchMode = AVCaptureTorchModeOn;
    //关闭AVCaptureTorchModeOff
    //开启美颜
    [self.liveSession setEnableSkin:YES];
    //缩放
    [self.liveSession alivcLiveVideoZoomCamera:1.0f];
    //聚焦
    //    [self.liveSession alivcLiveVideoFocusAtAdjustedPoint:percentPoint autoFocus:YES];
    //调试信息
    //AlivcLDebugInfo  *i = [self.liveSession dumpDebugInfo];
    //静音
    //[self.liveSession setMute:YES];
}

-(void)btnPlayOrPauseClick:(UIButton *)btn
{
    if(btn.isSelected == NO)
    {
        //开启直播预览
        [self.liveSession alivcLiveVideoStartPreview];
        //开启直播
        [self.liveSession alivcLiveVideoConnectServer];
        //获取直播预览视图
        [self.liveSession previewView];
        [btn setSelected:YES];
    }
    else{
        //停止预览，注意:停止预览后将liveSession置为nil
        [self.liveSession alivcLiveVideoStopPreview];
        //关闭直播
        [self.liveSession alivcLiveVideoDisconnectServer];
        //销毁直播 session
        self.liveSession = nil;
        [btn setSelected:NO];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    [self initConfig];
    
    [self createSession];
    
    [self liveOperation];


 
    
 
}

//直播出错的代理方法
-(void)alivcLiveVideoLiveSession:(AlivcLiveSession *)session error:(NSError *)error
{
    NSLog(@"alivcLiveVideoLiveSession");
}

//网速较慢时的代理方法
-(void)alivcLiveVideoLiveSessionNetworkSlow:(AlivcLiveSession *)session
{
   NSLog(@"alivcLiveVideoLiveSessionNetworkSlow");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
