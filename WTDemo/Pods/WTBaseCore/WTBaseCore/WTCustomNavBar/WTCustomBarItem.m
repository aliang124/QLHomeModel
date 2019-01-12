//
//  WTCustomBarItem.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/4.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTCustomBarItem.h"

@implementation WTCustomBarItem
- (id)init {
    if (self = [super init]) {
        self.imgSize = CGSizeMake(20, 20);
        self.itemTextColor = [UIColor blackColor];
        self.itemTextFont = [UIFont systemFontOfSize:14];
        self.itemHighlightBackgroundColor = [UIColor colorWithRed:231 green:231 blue:231 alpha:1];
    }
    return self;
}
@end

@implementation WTCustomBarButton
@end
