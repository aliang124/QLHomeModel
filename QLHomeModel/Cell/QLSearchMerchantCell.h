//
//  QLMerchantListCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLSearchMerchantItem : WTBaseItem
@end

@interface QLSearchMerchantCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLSearchMerchantItem *item;
@end
