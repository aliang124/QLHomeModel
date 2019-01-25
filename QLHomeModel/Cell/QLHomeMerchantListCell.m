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
    UILabel *addrLab;
    
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
    
    addrLab = [[UILabel alloc] initWithFrame:CGRectMake(titleLab.left, ageLab.bottom+7, titleLab.width, 9)];
    addrLab.textColor = QL_DescColor_Gray;
    addrLab.font = WTFontSys(10);
    [self.contentView addSubview:addrLab];
    
    tagLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImage.right+12, addrLab.bottom+9, 28, 14)];
    tagLab.backgroundColor = QL_TagColor_Green;
    tagLab.textColor = QL_TagTextColor_Green;
    tagLab.font = WTFontSys(10);
    tagLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:tagLab];
    
    lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(iconImage.right+12, 108-WT_Line_Height, WTScreenWidth-iconImage.right-12, WT_Line_Height)];
    lineImg.backgroundColor = WT_Color_Line;
    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [iconImage setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
    
    titleLab.text = @"Lunaluz露娜家亲子餐厅";
    ageLab.text = @"0-12岁";
    tagLab.text = @"西餐";
    [tagLab sizeToFit];
    tagLab.width = tagLab.width+8;
    addrLab.text = @"安徽省合肥市蜀山区长江西路288号好利来大酒店";
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
