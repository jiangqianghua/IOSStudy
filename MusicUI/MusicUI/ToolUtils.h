//
//  ToolUtils.h
//  MusicUI
//
//  Created by jiangqianghua on 17/7/25.
//  Copyright © 2017年 jiangqianghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ToolUtils : NSObject
{
  
}

+(ToolUtils *)getInstance ;
-(UIImage *) getImageWithName:(NSString *)name ;
-(UIImageView *) getImageViewWithName:(NSString *)name;
@end

