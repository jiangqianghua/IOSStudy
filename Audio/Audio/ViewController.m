//
//  ViewController.m
//  Audio
//
//  Created by jiangqianghua on 17/7/30.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>


@interface ViewController ()

@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) AVAudioRecorder *recorder ;
@property (nonatomic,strong) UIButton *playBtn;
@property (nonatomic,strong) AVAudioPlayer *player ;

@end

@implementation ViewController

-(AVAudioRecorder *)recorder
{
    if(_recorder == nil)
    {
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/record"];
        // 录音设置
        NSMutableDictionary *settingsDic = [[NSMutableDictionary alloc] init];
        
        // 采样率
        [settingsDic setValue:[NSNumber numberWithInt:44100] forKey:AVSampleRateKey];
        //录音格式
        [settingsDic setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC ] forKey:AVFormatIDKey];
        
        // 录音通道
        [settingsDic setValue:[NSNumber numberWithInt:1] forKey:AVNumberOfChannelsKey];
        // 录音质量
        [settingsDic setValue:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVEncoderAudioQualityKey];
        
        _recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:path] settings:settingsDic error:nil];
        
    }
    return _recorder ;
}

-(AVAudioPlayer *) player
{
    if(_player == nil)
    {
        // 获取录音路径
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/record"];
        
        // 获取本地播放路径
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"mpname" ofType:@"mp3"];
        _player = [[AVAudioPlayer alloc ] initWithContentsOfURL:[NSURL fileURLWithPath:path ] error:nil];
        [_player prepareToPlay];
    }
    
    return _player ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = CGRectMake(50,50, 300, 50);
    [self.btn setTitle:@"录音" forState:UIControlStateNormal];
    [self.btn setTitle:@"停止" forState:UIControlStateSelected];
    
    [self.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.btn setSelected:NO];
    [self.view addSubview: self.btn];
    
    self.playBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.playBtn.frame = CGRectMake(50,100, 300, 50);
    [self.playBtn setTitle:@"播放" forState:UIControlStateNormal];
    [self.playBtn setTitle:@"停止" forState:UIControlStateSelected];
    [self.playBtn addTarget:self action:@selector(playBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.playBtn setSelected:NO];
    [self.view addSubview: self.playBtn];
    
    
}

-(void)btnClick:(UIButton *)btn
{
   if(_btn.isSelected == NO)
   {
       [self.recorder record];
       [_btn setSelected:YES];
   }
   else{
       [self.recorder stop];
       [_btn setSelected:NO];
   }
}


-(void)playBtnClick:(UIButton *)btn
{
    if(_playBtn.isSelected == NO)
    {
        [self.player play];
        [_playBtn setSelected:YES];
    }
    else{
      
        [self.player stop];
        [_playBtn setSelected:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
