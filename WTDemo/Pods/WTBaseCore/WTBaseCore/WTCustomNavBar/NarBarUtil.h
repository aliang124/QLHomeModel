//
//  NarBarUtil.h
//  WTDemo
//
//  Created by 计恩良 on 2018/12/4.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NarBarUtil : NSObject
+ (BOOL)strNilOrEmpty:(NSString *)str;
+ (NSString *)strRelay:(NSString *)str;
+ (UIImage *)createImageFromColor:(UIColor *)color;
+ (CGSize)sizeForFont:(NSString *)str Font:(UIFont *)font CtrlSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
