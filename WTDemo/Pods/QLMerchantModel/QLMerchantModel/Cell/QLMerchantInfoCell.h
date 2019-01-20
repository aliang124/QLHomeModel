//
//  QLMerchantInfoCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLMerchantInfoItem : RETableViewItem
@property (nonatomic,copy) id info;
@end

@interface QLMerchantInfoCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLMerchantInfoItem *item;
@end
