//
//  QLTieBaShopCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLTieBaShopCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLTieBaShopItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 76;
        self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface QLTieBaShopCell()
{
    UIButton *bgView;
    UIImageView *iconImg;
    UILabel *nameLab;
    UILabel *moneyLab;
    UILabel *tagLab;
    UILabel *addressLab;
    UILabel *distanceLab;
}
@end

@implementation QLTieBaShopCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];

    bgView = [[UIButton alloc] initWithFrame:CGRectMake(16, 0, WTScreenWidth-16-16, 76)];
    bgView.layer.cornerRadius = 3;
    bgView.layer.masksToBounds = YES;
    bgView.backgroundColor = WTColorHex(0xFAFAF7);
    bgView.layer.borderWidth = 1;
    bgView.layer.borderColor = WTColorHex(0xE4E4DA).CGColor;
    [self.contentView addSubview:bgView];
    
    iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 80, 60)];
    iconImg.backgroundColor = [UIColor redColor];
    [bgView addSubview:iconImg];
    
    nameLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right+10, 9, bgView.width-iconImg.right-10-10, 13)];
    nameLab.font = WTFontBoldSys(14);
    nameLab.textColor = QL_UserName_TitleColor_Black;
    [bgView addSubview:nameLab];

    moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(nameLab.left, nameLab.bottom+11, nameLab.width, 9)];
    moneyLab.font = WTFontSys(10);
    moneyLab.textColor = QL_DescColor_Gray;
    [bgView addSubview:moneyLab];
    
    //下面布局
    tagLab = [[UILabel alloc] initWithFrame:CGRectMake(moneyLab.left, 0, 10, 14)];
    tagLab.font = WTFontSys(10);
    tagLab.textColor = QL_TagTextColor_Green;
    tagLab.backgroundColor = WTColorHex(0xE5FBF7);
    tagLab.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:tagLab];

    addressLab = [[UILabel alloc] initWithFrame:CGRectMake(nameLab.left, nameLab.bottom+11, nameLab.width, 9)];
    addressLab.font = WTFontSys(10);
    addressLab.textColor = QL_DescColor_Gray;
    [bgView addSubview:addressLab];

    distanceLab = [[UILabel alloc] initWithFrame:CGRectMake(nameLab.left, nameLab.bottom+11, nameLab.width, 9)];
    distanceLab.font = WTFontSys(10);
    distanceLab.textColor = QL_DescColor_Gray;
    [bgView addSubview:distanceLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    nameLab.text = [WTUtil strRelay:self.item.shopNameText];
    moneyLab.text = [WTUtil strRelay:self.item.info[@"consume"]];
    //下面的布局
    tagLab.top = moneyLab.bottom+6;
    tagLab.text = [WTUtil strRelay:self.item.info[@"label"]];
    [tagLab sizeToFit];
    tagLab.width = tagLab.width + 8;
    tagLab.height = tagLab.height + 4;
    //
    addressLab.left = tagLab.right+5;
    addressLab.text = [WTUtil strRelay:self.item.info[@"businessAddress"]];
    [addressLab sizeToFit];
    addressLab.height = tagLab.height;
    addressLab.top = tagLab.top;
    //
    distanceLab.text = @"2.3km";
    [distanceLab sizeToFit];
    distanceLab.height = tagLab.height;
    distanceLab.top = tagLab.top;
    distanceLab.left = bgView.width-distanceLab.width-10;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
