//
//  ViewController.h
//  LiveDemo
//
//  Created by jiangqianghua on 17/8/1.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AlivcLiveVideo/AlivcLiveVideo.h>
@interface ViewController : UIViewController
{
    AlivcLConfiguration *configuration;
}

@property (strong,nonatomic) AlivcLiveSession *liveSession ;
@end

