//
//  ViewController.m
//  图拼轮动
//
//  Created by jiangqianghua on 17/7/29.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
#define kImageCount 5 ;

@property (nonatomic,strong)UIScrollView *scrollView ;
@property (nonatomic,strong)UIPageControl *pageControl ;
@property (nonatomic,strong)NSTimer * timer ;
@end

@implementation ViewController

-(UIScrollView *)scrollView
{
    if(_scrollView == nil)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 20, 300, 130)];
        _scrollView.backgroundColor = [UIColor redColor];
        
        [self.view addSubview:_scrollView];
        
        self.scrollView.pagingEnabled = YES ;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO ;
        self.scrollView.bounces = NO ;
        self.scrollView.contentSize = CGSizeMake(5*_scrollView.bounds.size.width, 0);
        self.scrollView.delegate = self ;
    }

    return _scrollView;
}
//  分页控制
-(UIPageControl *)pageControl
{
    if(_pageControl == nil)
    {
        // 添加指示器
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = 5;
        CGSize size = [_pageControl sizeForNumberOfPages:5];
        _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
        _pageControl.center = CGPointMake(self.view.center.x,130);
        //颜色
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        [self.view addSubview:_pageControl];
        [_pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl ;
}
// 分页控件监听方法
-(void) pageChange:(UIPageControl *)page
{
    CGFloat x = page.currentPage * self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self scrollView];
    
    //  设置图片
    for(int i = 0 ; i < 5; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"img_%02d",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:_scrollView.bounds];
        imageView.image = image;
        
        [_scrollView addSubview:imageView];
    }
    
    // 遍历图片，计算位置
    [_scrollView.subviews enumerateObjectsUsingBlock:^(UIImageView *imageView,NSUInteger idx,BOOL *stop){
        CGRect frame = imageView.frame ;
        frame.origin.x = idx*frame.size.width;
        imageView.frame = frame ;
    }];

    // 设置分页
    self.pageControl.currentPage = 0 ;
    
    //启动timer
    [self startTimer];
}
/**
 启动时钟
 */
-(void)startTimer
{
    // 改方法有个问题就是抓图图片，时钟依然会走
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
     // 方法二
    
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)updateTimer
{
    int page = (self.pageControl.currentPage + 1)%5;
    self.pageControl.currentPage = page ;
    [self pageChange:self.pageControl];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 抓住图片停止时钟
    [self.timer invalidate];
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [self startTimer];
}
// 代理，scrollView滚动停下来执行
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    self.pageControl.currentPage = page;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
