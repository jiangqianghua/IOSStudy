//
//  ToolUtils.m
//  MusicUI
//
//  Created by jiangqianghua on 17/7/25.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "ToolUtils.h"
static ToolUtils *instance = nil;
@implementation ToolUtils

+(ToolUtils *)getInstance
{
    @synchronized(self) {
        if(instance == nil)
        {
            instance = [[self alloc] init];
        }
    }
    return instance ;
}

-(UIImage *) getImageWithName:(NSString *)name
{
    UIImage * uiImage = [UIImage imageNamed:name];
    return uiImage;
}

-(UIImageView *) getImageViewWithName:(NSString *)name
{
    UIImageView *imageView = [[UIImageView alloc] init];
    UIImage * uiImage = [self getImageWithName:name];
    imageView.image = uiImage ;
    return imageView ;
}

@end
