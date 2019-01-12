//
//  NarBarUtil.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/4.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "NarBarUtil.h"

@implementation NarBarUtil
+ (BOOL)strNilOrEmpty:(NSString *)str {
    return str == nil
    || str == NULL
    || [str isKindOfClass:[NSNull class]]
    ||([str respondsToSelector:@selector(length)]
       && [(NSData *)str length] == 0)
    || ([str respondsToSelector:@selector(count)]
        && [(NSArray *)str count] == 0);
}

+ (NSString *)strRelay:(NSString *)str
{
    if([NarBarUtil strNilOrEmpty:str]){
        return @"";
    }
    else if([str isKindOfClass:[NSString class]]){
        return str;
    } else if ([str isKindOfClass:[NSNumber class]]) {
        return [((NSNumber *)str) stringValue];
    }
    return str;
}

+ (UIImage *)createImageFromColor:(UIColor *)color
{
    CGSize sz = CGSizeMake(1, 1);
    CGRect rect = CGRectMake(0, 0, sz.width,sz.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (CGSize)sizeForFont:(NSString *)str Font:(UIFont *)font CtrlSize:(CGSize)size
{
    CGSize sz = CGSizeZero;
    NSDictionary *attributes = @{NSFontAttributeName:font,};
    sz = [str boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine |
          NSStringDrawingUsesLineFragmentOrigin |
          NSStringDrawingUsesFontLeading
                        attributes:attributes
                           context:nil].size;
    return sz;
}

@end
