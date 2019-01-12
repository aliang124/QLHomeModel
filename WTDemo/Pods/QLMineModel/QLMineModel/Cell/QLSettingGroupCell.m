//
//  QLSettingGroupCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLSettingGroupCell.h"
#import "WTBaseCore.h"

@implementation QLSettingGroupItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 48;
        self.bgColor = [UIColor whiteColor];
        self.hasBottomLine = NO;
        self.canHighlighted = NO;
    }
    return self;
}

@end

@interface QLSettingGroupCell()
{
}
@end

@implementation QLSettingGroupCell

- (void)cellDidLoad
{
    [super cellDidLoad];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = self.item.bgColor;
    [self onCreateSubView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)onCreateSubView {
    [self.contentView removeAllSubviews];
    self.item.cellHeight = self.item.dataArray.count * 48;
    self.height = self.item.cellHeight;
    int arrowWidth = 6;
    
    UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(16, 0, WTScreenWidth-16-16, self.height)];
    bgV.userInteractionEnabled = NO;
    bgV.layer.cornerRadius = 4;
    bgV.layer.borderWidth = 1;
    bgV.layer.borderColor = WTColorHex(0xEEEEE5).CGColor;
    [self.contentView addSubview:bgV];
    
    for (int i = 0; i < self.item.dataArray.count; i++) {
        NSDictionary *dic = self.item.dataArray[i];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(16, i*48, WTScreenWidth-16-16, 48)];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        
        if (i!=self.item.dataArray.count-1) {
            UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 47, btn.width-12-12, 1)];
            lineImg.backgroundColor = WTColorHex(0xEEEEE5);
            [btn addSubview:lineImg];
        }
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, btn.width-16-16, btn.height)];
        titleLab.font = WTFontSys(14);
        titleLab.textColor = QL_UserName_TitleColor_Black;
        titleLab.text = [WTUtil strRelay:dic[@"leftTitle"]];
        [btn addSubview:titleLab];

        UILabel *descLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, btn.width-16-16, btn.height)];
        descLab.font = WTFontSys(12);
        descLab.textAlignment = NSTextAlignmentRight;
        descLab.textColor = QL_DescColor_Gray;
        descLab.text = [WTUtil strRelay:dic[@"rightTitle"]];
        [btn addSubview:descLab];
        
        ButtonType btnType = [[WTUtil strRelay:dic[@"ButtonType"]] intValue];
        if (btnType==ButtonType_LeftRightTextArrow ||
            btnType==ButtonType_IconLeftRightTextArrow) {
            UIImageView *arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(btn.width-16-arrowWidth, (48-10)/2, arrowWidth, 10)];
            [arrowImg setImage:[UIImage imageNamed:@"arrowImg"]];
            [btn addSubview:arrowImg];
        }
        if (btnType==ButtonType_IconLeftRightTextArrow ||
            btnType==ButtonType_IconLeftRightText) {
            UIImageView *iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(16, (48-26)/2, 26, 26)];
            [iconImg setImage:[UIImage imageNamed:[WTUtil strRelay:dic[@"IconImage"]]]];
            [btn addSubview:iconImg];
        }
        
        if (btnType==ButtonType_LeftRightText) {
            titleLab.left = 16;
            descLab.width = btn.width-16-16;
        } else if (btnType==ButtonType_LeftRightTextArrow) {
            titleLab.left = 16;
            descLab.width = btn.width-16-16-arrowWidth-15;
        } else if (btnType==ButtonType_IconLeftRightTextArrow) {
            titleLab.left = 16+26+12;
            descLab.width = btn.width-16-16-arrowWidth-15;
        } else if (btnType==ButtonType_IconLeftRightText) {
            titleLab.left = 16+26+12;
            descLab.width = btn.width-16-16;
        }
    }
}

- (void)btnPress:(UIButton *)bbb {
    if (self.item.btnPress) {
        self.item.btnPress((int)bbb.tag);
    }
}
@end
