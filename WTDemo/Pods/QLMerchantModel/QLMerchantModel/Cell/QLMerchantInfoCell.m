//
//  QLMerchantInfoCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMerchantInfoCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLMerchantInfoItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 57;
    }
    return self;
}

@end

@interface QLMerchantInfoCell()
{
    UILabel *titleLab;
    UILabel *addressLab;
    UILabel *ageLab;
}
@end

@implementation QLMerchantInfoCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 12, WTScreenWidth-16-16, 15)];
    titleLab.font = WTFontBoldSys(16);
    titleLab.textColor = QL_UserName_TitleColor_Black;
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLab];

    addressLab = [[UILabel alloc] initWithFrame:CGRectMake(16, titleLab.bottom+9, WTScreenWidth-16-16, 9)];
    addressLab.font = WTFontSys(10);
    addressLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:addressLab];

    ageLab = [[UILabel alloc] initWithFrame:CGRectMake(16, titleLab.bottom+9, WTScreenWidth-16-16, 9)];
    ageLab.font = WTFontSys(10);
    ageLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:ageLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    titleLab.text = [WTUtil strRelay:self.item.info[@"name"]];
    
    addressLab.text = [WTUtil strRelay:self.item.info[@"address"]];
    [addressLab sizeToFit];    
    ageLab.text = [WTUtil strRelay:self.item.info[@"ageGroup"]];
    [ageLab sizeToFit];
    
    float totalW = addressLab.width+ageLab.width+16;
    addressLab.left = (WTScreenWidth-totalW)/2;
    ageLab.left = addressLab.right+16;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
