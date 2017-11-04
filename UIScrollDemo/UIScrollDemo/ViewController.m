//
//  ViewController.m
//  UIScrollDemo
//
//  Created by jiangqianghua on 17/7/24.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scrolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    imageView = [[UIImageView alloc] initWithImage:
                              [UIImage imageNamed:@"erliangcun.png"]];
    CGSize size = [UIImage imageNamed:@"erliangcun.png"].size;
    
    [scrolView addSubview:imageView];
    [self.view addSubview:scrolView];
    scrolView.backgroundColor = [UIColor greenColor];
    scrolView.contentSize = size;
    
    // scrollView
    
    // 边距
    scrolView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    // 不显示水平滚动条
    scrolView.showsHorizontalScrollIndicator = NO;
    // 不现实垂直滚动条
    scrolView.showsVerticalScrollIndicator = NO;
    //*** 偏移位置
    scrolView.contentOffset = CGPointMake(200,200);
    
    // test 偏移
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center= self.view.center ;
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    // 去掉弹簧效果
    scrolView.bounces = NO;
}

-(void)btnClick
{
    CGPoint offset = scrolView.contentOffset;
    offset.x += 20 ;
    offset.y += 20;
    //执行offset，回忽略contentSize
    scrolView.contentOffset = offset;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
