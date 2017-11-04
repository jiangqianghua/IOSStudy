//
//  ViewController.m
//  TimeTest
//
//  Created by jiangqianghua on 17/7/28.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSTimer *timer ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self startTimer];
    [self alertMsg];

}
//启动时钟
-(void)startTimer
{
    // 第一种
//       self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer:) userInfo:@"hello timer" repeats:YES];
    
    // 第二种
    self.timer = [NSTimer  timerWithTimeInterval:1.0 target:self selector:@selector(updateTimer:) userInfo:@"hello timer" repeats:YES];
    // 添加到运行循环中
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}
// 停止时钟
-(void)pauseTimer
{
    [self.timer invalidate];
}
// 监听时钟回调
-(void)updateTimer:(NSTimer *)timer
{
    NSLog(@"%s",__func__);
    NSLog(@"%@",timer.userInfo);
}

// 弹框
-(void)alertMsg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"开始计时" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"开始",@"等等", nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
