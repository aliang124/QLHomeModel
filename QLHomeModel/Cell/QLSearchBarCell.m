//
//  QLHomeHotTagCell.h
//  QLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLSearchBarCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLSearchBarItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 36;
    }
    return self;
}

@end

@interface QLSearchBarCell()
{
}
@end

@implementation QLSearchBarCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 12, WTScreenWidth-12-12, 11)];
    titleLab.font = WTFontBoldSys(12);
    titleLab.text = @"热门搜素";
    titleLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:titleLab];
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
