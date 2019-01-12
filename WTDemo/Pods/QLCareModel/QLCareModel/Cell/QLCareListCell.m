//
//  QLCareListCell.h
//  QLCareModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLCareListCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLCareListItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 330;
        self.descHeight = 0;
        self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface QLCareListCell()
{
    UIButton *bgView;
    UIImageView *userIcon;
    UILabel *userNameLab;
    UILabel *dateLab;

    UILabel *ageLab;
    UILabel *tagLab;
    UILabel *addrLab;
    
    UIImageView *lineImg;
}
@end

@implementation QLCareListCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = WT_Color_ViewBackGround;
    
    bgView = [[UIButton alloc] initWithFrame:CGRectMake(8, 0, WTScreenWidth-8-8, 330)];
    [bgView setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [bgView setBackgroundImage:[WTUtil createImageFromColor:WT_Color_ViewBackGround] forState:UIControlStateHighlighted];
    bgView.layer.cornerRadius = 4;
    bgView.layer.masksToBounds = YES;
    [self.contentView addSubview:bgView];
    
    //用户信息区域
    userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 28, 28)];
    userIcon.backgroundColor = [UIColor redColor];
    userIcon.layer.cornerRadius = 14;
    userIcon.layer.masksToBounds = YES;
    [bgView addSubview:userIcon];
    
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(userIcon.right+6, 12, bgView.width-userIcon.right-6-110, 28)];
    userNameLab.font = WTFontSys(12);
    userNameLab.textColor = QL_UserName_TitleColor_Black;
    [bgView addSubview:userNameLab];
    
    dateLab = [[UILabel alloc] initWithFrame:CGRectMake(bgView.width-110, 12, 110-20, 28)];
    dateLab.font = WTFontSys(10);
    dateLab.textAlignment = NSTextAlignmentRight;
    dateLab.textColor = QL_DateTextColor_Gray;
    [bgView addSubview:dateLab];

//
//    ageLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImage.right+12, titleLab.bottom+16, 34, 14)];
//    ageLab.backgroundColor = QL_NavBar_BgColor_Yellow;
//    ageLab.font = WTFontSys(8);
//    ageLab.textAlignment = NSTextAlignmentCenter;
//    ageLab.textColor = QL_UserName_TitleColor_Black;
//    [self.contentView addSubview:ageLab];
//
//    tagLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImage.right+12, ageLab.bottom+26, 28, 14)];
//    tagLab.backgroundColor = QL_TagColor_Green;
//    tagLab.textColor = QL_TagTextColor_Green;
//    tagLab.font = WTFontSys(10);
//    tagLab.textAlignment = NSTextAlignmentCenter;
//    [self.contentView addSubview:tagLab];
//
//    addrLab = [[UILabel alloc] initWithFrame:CGRectMake(tagLab.right+12, tagLab.top, WTScreenWidth-tagLab.right-12-12, 14)];
//    addrLab.textColor = QL_UserName_TitleColor_Black;
//    addrLab.font = WTFontSys(10);
//    [self.contentView addSubview:addrLab];
//
//    lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(iconImage.right+12, 108-WT_Line_Height, WTScreenWidth-iconImage.right-12, WT_Line_Height)];
//    lineImg.backgroundColor = WT_Color_Line;
//    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    userNameLab.text = @"用户A";
    dateLab.text = @"11月22日 12:22";
//    tagLab.text = @"西餐";
//    [tagLab sizeToFit];
//    tagLab.width = tagLab.width+8;
//    addrLab.frame = CGRectMake(tagLab.right+12, tagLab.top, WTScreenWidth-tagLab.right-12-12, 14);
//    addrLab.text = @"西城区西直门外大街1号购物中心B1...";
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
