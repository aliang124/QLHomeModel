//
//  QLHomeHotTagCell.h
//  QLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLHomeHotTagCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLHomeHotTagItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 31;
    }
    return self;
}

@end

@interface QLHomeHotTagCell()
{
}
@end

@implementation QLHomeHotTagCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WTScreenWidth, 12)];
    titleLab.text = @"热门推荐";
    titleLab.font = WTFontSys(12);
    titleLab.textColor = QL_NavBar_TitleColor_Black;
    [self.contentView addSubview:titleLab];
    
    [titleLab sizeToFit];
    titleLab.left = (WTScreenWidth-titleLab.width)/2;
    titleLab.top = 0;
    titleLab.height = 31;
    
    UIView *yellowLine1 = [[UIView alloc] initWithFrame:CGRectMake(titleLab.left-4-9, 15, 9, 1)];
    yellowLine1.backgroundColor = QL_NavBar_BgColor_Yellow;
    [self.contentView addSubview:yellowLine1];

    UIView *yellowLine2 = [[UIView alloc] initWithFrame:CGRectMakes(titleLab.right+4, 15, 9, 1)];
    yellowLine2.backgroundColor = QL_NavBar_BgColor_Yellow;
    [self.contentView addSubview:yellowLine2];
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
