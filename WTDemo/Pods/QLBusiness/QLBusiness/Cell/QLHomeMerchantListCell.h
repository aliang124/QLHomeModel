//
//  QLMerchantListCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLHomeMerchantListItem : WTBaseItem
@end

@interface QLHomeMerchantListCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLHomeMerchantListItem *item;
@end
