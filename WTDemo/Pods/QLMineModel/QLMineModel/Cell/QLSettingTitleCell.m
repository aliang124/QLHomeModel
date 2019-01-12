//
//  QLSettingTitleCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLSettingTitleCell.h"
#import "WTBaseCore.h"

@implementation QLSettingTitleItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 43;
        self.bgColor = [UIColor whiteColor];
        self.hasBottomLine = NO;
        self.canHighlighted = NO;
    }
    return self;
}

@end

@interface QLSettingTitleCell()
{
    UILabel *titleLab;
}
@end

@implementation QLSettingTitleCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 16, WTScreenWidth-16-16, 11)];
    titleLab.font = WTFontSys(12);
    titleLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:titleLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = self.item.bgColor;
    titleLab.text = [WTUtil strRelay:self.item.titleText];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
