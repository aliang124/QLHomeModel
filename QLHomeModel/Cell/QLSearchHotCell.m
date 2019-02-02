//
//  QLHomeHotTagCell.h
//  QLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLSearchHotCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLSearchHotItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 80;
    }
    return self;
}

@end

@interface QLSearchHotCell()
{
}
@end

@implementation QLSearchHotCell

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
