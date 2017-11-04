//
//  ViewController.m
//  MyPlayerDemo
//
//  Created by jiangqianghua on 17/7/31.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<VMediaPlayerDelegate>


@end

@implementation ViewController


-(void)initPlayer
{
    if (!mPlayer) {
        mPlayer = [VMediaPlayer sharedInstance];
        [mPlayer setupPlayerWithCarrierView:self.playerView withDelegate:self];
    }
}

-(void)initView
{
    _lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 600, 40)];
    
    _btnPlayOrPause = [UIButton buttonWithType:UIButtonTypeSystem];
    _btnPlayOrPause.frame = CGRectMake(50,50, 300, 50);
    [_btnPlayOrPause setTitle:@"播放视频" forState:UIControlStateNormal];
    [_btnPlayOrPause setTitle:@"停止" forState:UIControlStateSelected];
    
    [_btnPlayOrPause addTarget:self action:@selector(btnPlayOrPauseClick:) forControlEvents:UIControlEventTouchUpInside];
    [_btnPlayOrPause setSelected:NO];
    
    _playerView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 400, 300)];
    _playerView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_btnPlayOrPause];
    
    [self.view addSubview:_playerView];
    
    [self.view addSubview:_lblTitle];
    
    
    
}
// 准备播放
-(void)prepareVideo
{
    if(videoPath)
    {
        //播放时不要锁屏
        [UIApplication sharedApplication].idleTimerDisabled = YES;
        NSURL* videoURL = [NSURL URLWithString:videoPath];
        // for loacl file path
        //NSURL* videoURL = [NSURL fileURLWithPath:videoPath];
        [mPlayer setDataSource:videoURL];
        [mPlayer prepareAsync];
    }
}

-(void)btnPlayOrPauseClick:(UIButton *)btn
{
    if(videoPath)
    {
        BOOL isPlaying = [mPlayer isPlaying];
        if (isPlaying) {
            [mPlayer pause];
            _btnPlayOrPause.selected = NO;
        } else {
            if(didPrepared)
                [mPlayer start];
            else
                [self prepareVideo];
            _btnPlayOrPause.selected = YES;
        }
    }
}
// 播放器调用prepareAsync后回调
-(void)mediaPlayer:(VMediaPlayer *)player didPrepared:(id)arg
{
    //显示“暂停”两字
    _btnPlayOrPause.selected = YES;
    didPrepared = YES;
    [player start];
}
// 播放结束
-(void)mediaPlayer:(VMediaPlayer *)player playbackComplete:(id)arg
{
    _btnPlayOrPause.selected = NO;
    [player reset];
    didPrepared = NO;
}
// 播放错误
-(void)mediaPlayer:(VMediaPlayer *)player error:(id)arg
{
    NSLog(@"VMediaPlayer Error: %@", arg);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
  //  videoPath = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
  //  videoPath = @"http://mirror.aarnet.edu.au/pub/TED-talks/911Mothers_2010W-480p.mp4";
    videoPath = @"rtmp://livemediabs.xdfkoo.com/mediaserver/myroom";
    if(videoPath)
    {
        _lblTitle.text = [videoPath lastPathComponent];
        [self initPlayer];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
