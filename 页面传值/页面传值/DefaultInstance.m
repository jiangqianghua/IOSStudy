//
//  DefaultInstance.m
//  页面传值
//
//  Created by jiangqianghua on 17/7/30.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import "DefaultInstance.h"

@implementation DefaultInstance

+(DefaultInstance *)sharedInstance{
    static DefaultInstance *sharedVC = nil ;
    if(sharedVC == nil)
    {
        sharedVC = [[DefaultInstance alloc] init];
    }
    
    return sharedVC ;
}
@end
