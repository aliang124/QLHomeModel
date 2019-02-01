//
//  QLMerchantListCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLGuanZhuMerchantItem : WTBaseItem
@end

@interface QLGuanZhuMerchantCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLGuanZhuMerchantItem *item;
@end
