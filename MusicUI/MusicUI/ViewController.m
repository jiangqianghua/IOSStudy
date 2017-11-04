//
//  ViewController.m
//  MusicUI
//
//  Created by jiangqianghua on 17/7/25.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ViewController.h"
#import "ToolUtils.h"

@interface ViewController ()

    @property UIScrollView *mainScrollView ;
    @property ToolUtils *tool ;
    @property int defaulCol ;
    @property int imageMargin ;

@end

@implementation ViewController

-(void ) initLocalData
{
    self.tool = [ToolUtils getInstance];
    self.defaulCol = 2 ;
    self.imageMargin = 10 ;
};

-(NSArray *) loadData{
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:@"finditem_hotpeople.png"];
    [arr addObject:@"finditem_hotsound.png"];
    [arr addObject:@"finditem_ad.png"];
    [arr addObject:@"finditem_newpeople.png"];
    [arr addObject:@"finditem_newsound.png"];
    [arr addObject:@"finditem_wallspoint.png"];
    [arr addObject:@"finditem_hotpeople.png"];
    [arr addObject:@"finditem_hotsound.png"];
    [arr addObject:@"finditem_ad.png"];
    [arr addObject:@"finditem_newpeople.png"];
    [arr addObject:@"finditem_newsound.png"];
    [arr addObject:@"finditem_wallspoint.png"];
    return [arr copy];
}
// 自定义导航栏
-(void)initNavi
{
    // 创建一个导航栏
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 44)];
    // 导航栏背景颜色
//    navBar.barTintColor = [UIColor colorWithRed:101/255.0 green:215/255.0 blue:237/255.0 alpha:0.0];
    navBar.alpha = 0.5 ;
    // 自定义导航栏的title，用UILabel实现
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    titleLabel.text = @"自定义";
    titleLabel.textColor = [UIColor redColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    
    // 创建导航栏组件
    UINavigationItem *navItem = [[UINavigationItem alloc] init];
    // 设置自定义的title
    navItem.titleView = titleLabel;
    
    // 创建左侧按钮
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"leftButton" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonClick)];
    leftButton.tintColor = [UIColor purpleColor];
    
    // 创建右侧按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"rightButton" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick)];
    rightButton.tintColor = [UIColor orangeColor];
    
    // 添加左侧、右侧按钮
//    [navItem setLeftBarButtonItem:leftButton animated:false];
//    [navItem setRightBarButtonItem:rightButton animated:false];
    // 把导航栏组件加入导航栏
    [navBar pushNavigationItem:navItem animated:false];
    
    // 导航栏添加到view上
    [self.view addSubview:navBar];
}

-(void)leftButtonClick
{
    
}

-(void)rightButtonClick
{
    
}

-(void) initView
{
    CGSize size = self.view.bounds.size;
    int navigationH = 64 ;
    // init scrollview
    self.mainScrollView = [[UIScrollView alloc] init];

    int viewW = size.width ;
    int viewH = size.height;
    CGRect contentRect =  CGRectMake(0, navigationH, viewW, viewH-50);
    self.mainScrollView.frame = contentRect ;
    self.mainScrollView.contentSize = size;
    // 不显示水平滚动条
    self.mainScrollView.showsHorizontalScrollIndicator = NO;
    // 不现实垂直滚动条
    self.mainScrollView.showsVerticalScrollIndicator = NO;
    // 去掉弹簧效果
    self.mainScrollView.bounces = NO;
    self.mainScrollView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.mainScrollView];
  //  self.mainScrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    int i = 0 ;
    int imageW = 0;
    int imageH = 0 ;
    for (i = 0; i <tabArray.count; i++) {
        
        NSString *name = tabArray[i];
        UIImageView *imageView = [[UIImageView alloc] init];
        UIImage * uiImage = [self.tool getImageWithName:name];
        imageView.image = uiImage ;
        imageW = uiImage.size.width ;
        imageH = uiImage.size.height ;
        [imageView sizeToFit];
        int index = i + 1 ;
        int imageViewX = self.imageMargin;
        int imageViewY = self.imageMargin;
        if(index%self.defaulCol == 0)
            imageViewX = size.width/self.defaulCol + (size.width/self.defaulCol - (imageW + self.imageMargin));
        else
            imageViewX = self.imageMargin ;
        
        int row = i/self.defaulCol  ;
        imageViewY = self.imageMargin + (imageH+10)*row;
        
        CGRect imageView1Rect1 =  CGRectMake(imageViewX, imageViewY, uiImage.size.width , uiImage.size.height);
        imageView.frame = imageView1Rect1 ;
        [self.mainScrollView addSubview:imageView];

    }
    double num = (tabArray.count*1.0)/(self.defaulCol*1.0) ;
    // 四舍五入
    int rowNum = (int)(num+0.5)>(int)num?(int)num+1:(int)num;
    int allH = rowNum*(imageH + self.imageMargin)+10 ;
    //int allW = self.defaulCol * (imageW + self.imageMargin) + 10;
    CGSize cgSize = CGSizeMake(0, allH);
    self.mainScrollView.contentSize = cgSize;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initLocalData];
    tabArray = [self loadData];
    [self initView];
    [self initNavi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
