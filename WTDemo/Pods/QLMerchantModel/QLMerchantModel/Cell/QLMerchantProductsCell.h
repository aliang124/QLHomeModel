//
//  QLMerchantTitleCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLMerchantProductsItem : RETableViewItem
@property (nonatomic,copy) NSArray *productArray;
@end

@interface QLMerchantProductsCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLMerchantProductsItem *item;
@end
