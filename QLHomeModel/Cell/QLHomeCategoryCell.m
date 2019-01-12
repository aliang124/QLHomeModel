//
//  QLHomeCategoryCell.h
//  QLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLHomeCategoryCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLHomeCategoryItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 120;
    }
    return self;
}

@end

@interface QLHomeCategoryCell()
{
}
@end

@implementation QLHomeCategoryCell

- (void)cellDidLoad
{
    [super cellDidLoad];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
