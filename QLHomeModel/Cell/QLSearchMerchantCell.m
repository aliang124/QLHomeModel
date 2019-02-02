//
//  QLGuanZhuMerchantCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLSearchMerchantCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"

@implementation QLSearchMerchantItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 108;
        self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface QLSearchMerchantCell()
{
    UIImageView *iconImage;
    UILabel *titleLab;
    UILabel *ageLab;
    UILabel *tagLab;
    UILabel *addrLab;
    
    UIImageView *lineImg;
}
@end

@implementation QLSearchMerchantCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 112, 84)];
    [self.contentView addSubview:iconImage];
    
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImage.right+12, 16, WTScreenWidth-iconImage.right-12-12, 13)];
    titleLab.font = WTFontSys(14);
    titleLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:titleLab];
    
    ageLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImage.right+12, titleLab.bottom+16, 34, 14)];
    ageLab.backgroundColor = QL_NavBar_BgColor_Yellow;
    ageLab.font = WTFontSys(8);
    ageLab.textAlignment = NSTextAlignmentCenter;
    ageLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:ageLab];

    tagLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImage.right+12, ageLab.bottom+26, 28, 14)];
    tagLab.backgroundColor = QL_TagColor_Green;
    tagLab.textColor = QL_TagTextColor_Green;
    tagLab.font = WTFontSys(10);
    tagLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:tagLab];

    addrLab = [[UILabel alloc] initWithFrame:CGRectMake(tagLab.right+12, tagLab.top, WTScreenWidth-tagLab.right-12-12, 14)];
    addrLab.textColor = QL_UserName_TitleColor_Black;
    addrLab.font = WTFontSys(10);
    [self.contentView addSubview:addrLab];
    
    lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(iconImage.right+12, 108-WT_Line_Height, WTScreenWidth-iconImage.right-12, WT_Line_Height)];
    lineImg.backgroundColor = WT_Color_Line;
    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [iconImage setWebImageWithUrl:[WTUtil strRelay:self.item.info[@"logo"]] placeHolder:nil];
    
    titleLab.text = [WTUtil strRelay:self.item.info[@"name"]];
    ageLab.text = @"0-12岁";
    tagLab.text = @"西餐";
    [tagLab sizeToFit];
    tagLab.width = tagLab.width+8;
    addrLab.frame = CGRectMake(tagLab.right+12, tagLab.top, WTScreenWidth-tagLab.right-12-12, 14);
    addrLab.text = [WTUtil strRelay:self.item.info[@"address"]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
