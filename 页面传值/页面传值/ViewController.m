//
//  ViewController.m
//  页面传值
//
//  Created by jiangqianghua on 17/7/30.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "DefaultInstance.h"
@interface ViewController ()
@property (nonatomic,strong) UILabel *label ;
@property (nonatomic,strong) UIButton *btn ;
@property (nonatomic,strong) SecondViewController *nextVC ;
@end

@implementation ViewController

-(UILabel *)label
{
    if(_label == nil)
    {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
        
        _label.backgroundColor = [UIColor blackColor];
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:20];
        [self.view addSubview:_label];
    }
    
    return _label ;
}


-(UIButton *)btn
{
    if(_btn == nil)
    {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 40)];
        _btn.backgroundColor = [UIColor redColor];
        [_btn setTitle:@"界面1，跳转到页面2" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn];
        
    }
    return _btn;
}

-(void)btnClick
{
    self.nextVC = [[SecondViewController alloc ] init];
    self.nextVC.str = @"属性传值";
    [DefaultInstance sharedInstance].str = @"单利传值";
    [self presentViewController:self.nextVC animated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _label = self.label ;
    _btn = self.btn;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
