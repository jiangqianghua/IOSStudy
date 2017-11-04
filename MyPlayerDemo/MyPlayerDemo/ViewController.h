//
//  ViewController.h
//  MyPlayerDemo
//
//  Created by jiangqianghua on 17/7/31.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vitamio.h"
@interface ViewController : UIViewController
{
    NSString* videoPath;
    VMediaPlayer *mPlayer;
    BOOL didPrepared;
}
@property (strong, nonatomic)  UILabel *lblTitle;
@property (strong, nonatomic)  UIView *playerView;
@property (strong, nonatomic)  UIButton *btnPlayOrPause;
- (IBAction)btnPlayOrPauseClick:(id)sender;
@end

