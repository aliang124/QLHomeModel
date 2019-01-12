//
//  UIImageView+WebImage.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "UIImageView+WebImage.h"
#import "UIImageView+YYWebImage.h"

@implementation UIImageView (WebImage)
- (void)setWebImageWithUrl:(NSString *)url placeHolder:(UIImage *)placeImg {
    [self yy_setImageWithURL:[NSURL URLWithString:[self strRelay:url]] placeholder:placeImg];
}







- (BOOL)strNilOrEmpty:(NSString *)str {
    return str == nil
    || str == NULL
    || [str isKindOfClass:[NSNull class]]
    ||([str respondsToSelector:@selector(length)]
       && [(NSData *)str length] == 0)
    || ([str respondsToSelector:@selector(count)]
        && [(NSArray *)str count] == 0);
}

- (NSString *)strRelay:(NSString *)str
{
    if([self strNilOrEmpty:str]){
        return @"";
    }
    else if([str isKindOfClass:[NSString class]]){
        return str;
    } else if ([str isKindOfClass:[NSNumber class]]) {
        return [((NSNumber *)str) stringValue];
    }
    return [self trim:str];
}

- (NSString *)trim:(NSString *)str {
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end

