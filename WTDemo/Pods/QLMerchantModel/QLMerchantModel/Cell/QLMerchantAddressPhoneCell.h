//
//  QLMerchantAddressPhoneCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLMerchantAddressPhoneItem : RETableViewItem
@property (nonatomic,copy) id info;
@end

@interface QLMerchantAddressPhoneCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLMerchantAddressPhoneItem *item;
@end
