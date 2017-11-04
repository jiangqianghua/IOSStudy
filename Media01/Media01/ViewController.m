//
//  ViewController.m
//  Media01
//
//  Created by jiangqianghua on 17/7/29.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface ViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong,nonatomic) UIImagePickerController *imagePickerCon ;
@property (strong,nonatomic) UIImageView *imageView ;

@property (strong,nonatomic) UIButton *btn ;
@end

@implementation ViewController

-(UIImagePickerController *) imagePickerCon{
    if(_imagePickerCon == nil)
    {
        _imagePickerCon = [[UIImagePickerController alloc] init];
        // 采集类型
        _imagePickerCon.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 媒体类型
        _imagePickerCon.mediaTypes = [NSArray arrayWithObject:(__bridge NSString *)kUTTypeImage];
        // 设置代理
        _imagePickerCon.delegate = self ;
        
    }
    return _imagePickerCon ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _btn =  [UIButton  buttonWithType:UIButtonTypeContactAdd];
    _btn.frame = CGRectMake(100, 20, _btn.frame.size.width, _btn.frame.size.height);
    [self.view addSubview:_btn];
    
    _imageView = [[UIImageView alloc ] initWithFrame:CGRectMake(0,100, 400, 300)];
    _imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_imageView];
    
    
    [self.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)btnClick:(UIButton *)btn
{
    // 通过摄像头采集
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        self.imagePickerCon.sourceType = UIImagePickerControllerSourceTypeCamera ;
    }
    // 通过图片库采集
    else{
        self.imagePickerCon.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:self.imagePickerCon animated:YES completion:nil];
    
}

// 协议方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"开始采集图片后的回调");
    NSString *type = info[UIImagePickerControllerMediaType];
    if([type isEqualToString:(__bridge NSString *)kUTTypeImage])
    {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        self.imageView.image = image ;
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
