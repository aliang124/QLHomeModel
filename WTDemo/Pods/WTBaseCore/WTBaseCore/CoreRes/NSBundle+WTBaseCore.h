//
//  NSBundle+WTBaseCore.h
//  WTBaseCore
//
//  Created by jienliang on 16/6/13.
//  Copyright © 2016年 jienliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSBundle (WTBaseCore)
+ (instancetype)wt_resourceBundle;
+ (UIImage *)getImageFromBoundle:(NSString *)imageName;
@end
