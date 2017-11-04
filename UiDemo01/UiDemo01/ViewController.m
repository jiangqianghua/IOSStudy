//
//  ViewController.m
//  UiDemo01
//
//  Created by jiangqianghua on 17/7/23.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // add UIButton
    UIButton *btn = [UIButton  buttonWithType:UIButtonTypeContactAdd];
    // 居中
    btn.center = self.view.center ;
    // 添加到父窗口中
    [self.view addSubview:btn];
    // 添加点击事件
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    UITextField *textFiled = [UITextField new];
    textFiled.frame = CGRectMake(10, 100, 300, 30);
    textFiled.backgroundColor = [UIColor greenColor] ;
    [self.view addSubview:textFiled];
    //设置代理，代理为本对象
    textFiled.delegate = self ;
    NSLog(@"viewDidLoad...");
}

-(void)click:(UIButton *)btn
{
    NSLog(@"btn click...");
}

// textFiled 文字变化代理方法,作用时可以捕获数据数据，做一些限制，下面是限制输入字符为6
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"%@ %@",NSStringFromRange(range),string);
    
    int loc = range.location;
    if(loc < 6)
        return YES;
    return NO; //返回NO，表示不向文本框显示文字
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
