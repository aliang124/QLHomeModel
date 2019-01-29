//
//  QLMerchantListCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLHomeMerchantListCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"

@implementation QLHomeMerchantListItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 108;
        self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface QLHomeMerchantListCell()
{
    UIImageView *iconImage;
    UILabel *titleLab;
    UILabel *ageLab;
    UILabel *tagLab;
    UIImageView *addrIcon;
    UILabel *addrLab;
    UILabel *distanceLab;
    
    UIImageView *lineImg;
}
@end

@implementation QLHomeMerchantListCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 112, 84)];
    [self.contentView addSubview:iconImage];
    
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImage.right+12, 16, WTScreenWidth-iconImage.right-12-12, 13)];
    titleLab.font = WTFontSys(14);
    titleLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:titleLab];
    
    ageLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImage.right+12, titleLab.bottom+9, 34, 14)];
    ageLab.backgroundColor = QL_NavBar_BgColor_Yellow;
    ageLab.font = WTFontSys(8);
    ageLab.textAlignment = NSTextAlignmentCenter;
    ageLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:ageLab];
    
    addrIcon = [[UIImageView alloc] initWithFrame:CGRectMake(titleLab.left, ageLab.bottom+7, 10, 10)];
    [addrIcon setImage:[UIImage imageNamed:@"dingwei"]];
    [self.contentView addSubview:addrIcon];
    
    addrLab = [[UILabel alloc] initWithFrame:CGRectMake(addrIcon.right+5, ageLab.bottom+7, titleLab.width-15, 9)];
    addrLab.textColor = QL_DescColor_Gray;
    addrLab.font = WTFontSys(10);
    [self.contentView addSubview:addrLab];
    
    tagLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImage.right+12, addrLab.bottom+9, 28, 14)];
    tagLab.backgroundColor = QL_TagColor_Green;
    tagLab.textColor = QL_TagTextColor_Green;
    tagLab.font = WTFontSys(10);
    tagLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:tagLab];
    
    distanceLab = [[UILabel alloc] initWithFrame:CGRectMake(tagLab.right, tagLab.top, WTScreenWidth-tagLab.right-13, 14)];
    distanceLab.textColor = QL_DescColor_Gray;
    distanceLab.font = WTFontSys(10);
    distanceLab.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:distanceLab];
    
    lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(iconImage.right+12, 108-0.5, WTScreenWidth-iconImage.right-12, 0.5)];
    lineImg.backgroundColor = QL_Border_LineColor;
    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [iconImage setWebImageWithUrl:[WTUtil strRelay:self.item.info[@"logo"]] placeHolder:nil];
    titleLab.text = [WTUtil strRelay:self.item.info[@"name"]];
    ageLab.text = [WTUtil strRelay:self.item.info[@"ageGroup"]];
    //分类标签
    tagLab.text = [WTUtil strRelay:self.item.info[@"label"]];
    [tagLab sizeToFit];
    tagLab.width = tagLab.width+8;
    tagLab.height = tagLab.height+3;
    [tagLab setNeedsDisplay];
    //距离
    double ttt = [[WTUtil strRelay:self.item.info[@"distance"]] doubleValue]/1000;
    distanceLab.text = [NSString stringWithFormat:@"%0.1fkm",ttt];
    distanceLab.frame = CGRectMake(tagLab.right, tagLab.top, WTScreenWidth-tagLab.right-13, tagLab.height);
    //地址
    addrLab.text = [WTUtil strRelay:self.item.info[@"address"]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
