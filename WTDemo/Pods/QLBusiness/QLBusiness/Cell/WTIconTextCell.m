//
//  QLMineHeadCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTIconTextCell.h"
#import "WTBaseCore.h"
#import "QLDefine.h"
@implementation WTIconTextItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 54;
    }
    return self;
}

@end

@interface WTIconTextCell()
{
    UIImageView *iconImg;
    UILabel *textLab;
    UIImageView *arrowImg;
    UIImageView *lineImg;
}
@end

@implementation WTIconTextCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    //图标
    iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(21, 15, 24, 24)];
    [self.contentView addSubview:iconImg];
    //图标
    arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(WTScreenWidth-30, 22, 6, 10)];
    [self.contentView addSubview:arrowImg];
    //文本
    textLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right+12, 20, WTScreenWidth-iconImg.right-12-30-5, 12)];
    textLab.font = WTFontSys(12);
    textLab.textColor = WT_Color_TextBlackColor;
    [self.contentView addSubview:textLab];
    //
    lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(21, 54-WT_Line_Height, WTScreenWidth-21-24, WT_Line_Height)];
    lineImg.backgroundColor = QL_TableView_LineColor;
    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    if (highlighted) {
        self.backgroundColor = WT_Color_ViewBackGround;
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [iconImg setImage:self.item.iconImg];
    [arrowImg setImage:[UIImage imageNamed:@"arrowImg"]];
    textLab.text = [WTUtil strRelay:self.item.textString];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
