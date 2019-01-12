//
//  QLSettingButtonCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLSettingButtonCell.h"
#import "WTBaseCore.h"
#import "QLDefine.h"

@implementation QLSettingButtonItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 38;
        self.bgColor = [UIColor clearColor];
        self.hasBottomLine = NO;
        self.canHighlighted = NO;
    }
    return self;
}

@end

@interface QLSettingButtonCell()
{
    UIButton *btn;
}
@end

@implementation QLSettingButtonCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    btn = [[UIButton alloc] initWithFrame:CGRectMake(16, 0, WTScreenWidth-16-16, 38)];
    [btn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateNormal];
    btn.titleLabel.font = WTFontSys(14);
    btn.layer.cornerRadius = 4;
    btn.layer.masksToBounds = YES;
    [btn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    [self.contentView addSubview:btn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = self.item.bgColor;
    [btn setTitle:[WTUtil strRelay:self.item.titleText] forState:UIControlStateNormal];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
