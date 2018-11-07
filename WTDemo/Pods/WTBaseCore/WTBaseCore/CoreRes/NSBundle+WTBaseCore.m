//
//  NSBundle+WTBaseCore.h
//  WTLibrary
//
//  Created by jienliang on 16/6/13.
//  Copyright © 2016年 jienliang. All rights reserved.
//

#import "NSBundle+WTBaseCore.h"
#import "WTBoundle.h"

@implementation NSBundle (WTBaseCore)
+ (instancetype)wt_resourceBundle
{
    static NSBundle *resourceBundle = nil;
    if (resourceBundle == nil) {
        resourceBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[WTBoundle class]] pathForResource:@"WTBaseCore" ofType:@"bundle"]];
    }
    return resourceBundle;
}

+ (UIImage *)getImageFromBoundle:(NSString *)imageName {
    NSBundle *bbb = [NSBundle wt_resourceBundle];
    UIImage *backImg = [[UIImage imageWithContentsOfFile:[bbb pathForResource:imageName ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    return backImg;
}
@end
