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
    UIButton *phoneImg;
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
    
    phoneImg = [[UIButton alloc] initWithFrame:CGRectMake(addressLab.right+39, 0, 24, 24)];
    [phoneImg setImage:[UIImage imageNamed:@"phoneImg"] forState:UIControlStateNormal];
    [phoneImg addTarget:self action:@selector(callPhone) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:phoneImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    addressLab.text = [WTUtil strRelay:self.item.info[@"address"]];
}

- (void)callPhone {
    NSString *phone = [WTUtil strRelay:self.item.info[@"telephone"]];
    if (phone.length==0) {
        phone = [WTUtil strRelay:self.item.info[@"phone"]];
    }
    if (phone.length>0) {
        [WTUtil call:phone];
    }
}
@end
