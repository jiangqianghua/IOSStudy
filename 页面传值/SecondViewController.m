//
//  SecondViewController.m
//  页面传值
//
//  Created by jiangqianghua on 17/7/30.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "SecondViewController.h"
#import "DefaultInstance.h"

@interface SecondViewController()
    @property (nonatomic,strong) UILabel *label ;
    @property (nonatomic,strong) UIButton *btn ;

@end

@implementation SecondViewController
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
        [_btn setTitle:@"界面2，返回到跳转到页面1" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn];
        
    }
    return _btn;
}

-(void)btnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    _label = self.label ;
    _btn = self.btn;
    
    [_label setText:self.str ];
    [_label setText:[DefaultInstance sharedInstance].str ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

