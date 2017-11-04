//
//  ViewController.m
//  ImageDisply
//
//  Created by jiangqianghua on 17/7/26.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ViewController.h"
/**
 图片缩放
 **/
@interface ViewController () <UIScrollViewDelegate>


@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UIScrollView *scrollView ;

@end



@implementation ViewController

-(void) setImage:(UIImage *)image1
{
    self.imageView.image = image1 ;
    // 自动调整大小
    [self.imageView sizeToFit];
    self.scrollView.contentSize = image1.size;
}

-(UIImageView *)imageView1
{
    if(self.imageView == nil){
        self.imageView = [[UIImageView alloc] init];
        [self.scrollView addSubview:self.imageView];
    }
    return self.imageView;
}

-(UIScrollView *) scrollView
{
    if(_scrollView == nil)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        
        _scrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO ;
        
        _scrollView.contentOffset = CGPointMake(0,0);
        
        // 设置代理
        _scrollView.delegate = self ;
        
        // 设置缩放比例
        _scrollView.maximumZoomScale = 2;
        _scrollView.minimumZoomScale = 0.2 ;
        [self.view addSubview:_scrollView];
        
    }
    return _scrollView ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    image = [UIImage imageNamed:@"erliangcun.png"];
    self.imageView = [self imageView1];
    [self setImage:image];
    
    }

// 代理协议函数
-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView ;  // 返回要缩放的view
}
// 即将开始缩放
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view
{
    NSLog(@"%s",__func__);
}
// 缩放完成
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
     NSLog(@"%s",__func__);
}

//正在缩放
-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"%s",__func__);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
