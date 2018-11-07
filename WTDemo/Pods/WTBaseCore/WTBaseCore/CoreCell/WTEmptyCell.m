//
//  WTEmptyCell.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTEmptyCell.h"

@implementation WTEmptyItem
+ (id)initWithHeight:(float)height {
     WTEmptyItem *it = [[WTEmptyItem alloc] init];
     it.cellHeight = height;
     it.bgColor = [UIColor clearColor];
     return it;
}

- (id)init{
    if (self = [super init]) {
        self.cellHeight = 10;
        self.bgColor = [UIColor clearColor];
         self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface WTEmptyCell()
{
}
@end

@implementation WTEmptyCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor = self.item.bgColor;
}

@end
