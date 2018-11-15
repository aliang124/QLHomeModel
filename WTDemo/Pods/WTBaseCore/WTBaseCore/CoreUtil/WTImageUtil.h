//
//  WTImageUtil.h
//  WTLibrary
//
//  Created by jienliang on 2018/2/6.
//  Copyright © 2018年 jienliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTImageUtil : NSObject
//压缩一张图片 最大宽高1280 类似于微信算法
+ (UIImage *)getJPEGImagerImg:(UIImage *)image;
//压缩多张图片 最大宽高1280 类似于微信算法
+ (NSArray *)getJPEGImagerImgArr:(NSArray *)imageArr;
//压缩一张图片 自定义最大宽高
+ (UIImage *)getJPEGImagerImg:(UIImage *)image compressibilityFactor:(CGFloat)compressibilityFactor;
//压缩多张图片 自定义最大宽高
+ (NSArray *)getJPEGImagerImgArr:(NSArray *)imageArr compressibilityFactor:(CGFloat)compressibilityFactor;
//根据宽高压缩图片
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
@end
