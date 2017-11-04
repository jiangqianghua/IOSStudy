//
//  ViewController.m
//  ThreadDemo
//
//  Created by jiangqianghua on 17/8/8.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//
#define HMGlobalQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT , 0 )
#define HMMainQueue dispatch_get_main_queue()
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)download
{
    //[NSThread sleepForTimeInterval:5000];
    NSLog(@"down load  -----%@, %@",[NSThread mainThread],  [NSThread currentThread]);
    [NSThread exit];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad ------ %@", [NSThread currentThread]);
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(download) object:nil];
    thread.name = @"下载线程";
    [thread isMainThread];
    [NSThread isMainThread];
   // [thread start];
}

// 了解线程状态
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    dispatch_async(HMGlobalQueue, ^{
        int threadVal = 1 ;
        NSLog(@"子线程 thread %@",[NSThread currentThread]);
        
        dispatch_async(HMMainQueue, ^{
            NSLog(@"主线程 thread %@ %d",[NSThread currentThread],threadVal);
        });
    });
    
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
