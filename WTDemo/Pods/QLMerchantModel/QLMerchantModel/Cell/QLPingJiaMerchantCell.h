//
//  QLTieBaShopCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLPingJiaMerchantItem : WTBaseItem
@end

@interface QLPingJiaMerchantCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLPingJiaMerchantItem *item;
@end
