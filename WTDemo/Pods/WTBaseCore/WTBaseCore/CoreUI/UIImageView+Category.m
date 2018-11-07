//
//  UIImageView+Category.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "UIImageView+Category.h"
#import "UIImageView+YYWebImage.h"
#import "WTUtil.h"
#import "NSString+Category.h"

@implementation UIImageView (WTBaseCore)
- (void)setWebImageWithUrl:(NSString *)url placeHolder:(UIImage *)placeImg {
    [self yy_setImageWithURL:[NSURL URLWithString:[WTUtil strRelay:url]] placeholder:placeImg];
}
@end

