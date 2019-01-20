//
//  QLMerchantAddressPhoneCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMerchantAddressPhoneCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLMerchantAddressPhoneItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 24;
    }
    return self;
}

@end

@interface QLMerchantAddressPhoneCell()
{
    UILabel *addressLab;
    UIImageView *phoneImg;
}
@end

@implementation QLMerchantAddressPhoneCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    addressLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, WTScreenWidth-16-23-24-39, 24)];
    addressLab.font = WTFontSys(10);
    addressLab.numberOfLines = 0;
    addressLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:addressLab];
    
    phoneImg = [[UIImageView alloc] initWithFrame:CGRectMake(addressLab.right+39, 0, 24, 24)];
    [phoneImg setImage:[UIImage imageNamed:@"phoneImg"]];
    [self.contentView addSubview:phoneImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    addressLab.text = @"通州区九棵树西路92号北泡集团有限公司院内2幢02（东郎影视基地胡桃里对面)";
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
