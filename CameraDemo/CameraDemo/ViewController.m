//
//  ViewController.m
//  CameraDemo
//
//  Created by jiangqianghua on 17/7/30.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
@interface ViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) UIButton *playBtn;

// 采集视频
@property (nonatomic,strong) UIImagePickerController *imagePickerCon;
@property (nonatomic,strong)AVPlayerViewController *player;
@property NSURL *mediaUrl ;
@end

@implementation ViewController

-(AVPlayerViewController *) player
{
    if(_player == nil)
    {
        _player= [[AVPlayerViewController alloc ] init];
        _player.player = [[AVPlayer alloc] initWithURL:self.mediaUrl];
        // 全频播放
        
        //[self presentViewController:self.player animated:YES completion:nil];
        
        // 自定义窗口大小
        
        _player.view.frame = CGRectMake(10,100, 400, 400);
        [self.view addSubview:_player.view];
        
    }
    return _player ;
}
-(UIImagePickerController *)imagePickerCon
{
    if(_imagePickerCon == nil)
    {
        _imagePickerCon = [[UIImagePickerController alloc] init];
        
        _imagePickerCon.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        _imagePickerCon.mediaTypes = [NSArray arrayWithObject:(__bridge NSString *)kUTTypeMovie];
        
        _imagePickerCon.delegate = self ;
    }
    
    return _imagePickerCon ;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = CGRectMake(50,50, 300, 50);
    [self.btn setTitle:@"录制视频" forState:UIControlStateNormal];
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
        //[self.recorder record];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            [self presentViewController:self.imagePickerCon animated:YES completion:nil];
        }
        //[_btn setSelected:YES];
    }
}

-(void)playBtnClick:(UIButton *)btn
{
    if(_playBtn.isSelected == NO)
    {
        [self.player.player play];
    }
 
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"开始采集图片后的回调");
    NSString *type = info[UIImagePickerControllerMediaType];
    // 判断是否是视频类型
    if([type isEqualToString:(__bridge NSString *)kUTTypeMovie])
    {
        self.mediaUrl = info[UIImagePickerControllerMediaURL];
        
       // UIImage *image = info[UIImagePickerControllerOriginalImage];
      //  self.imageView.image = image ;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"取消采集图片处理");
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
