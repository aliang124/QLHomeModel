//
//  QLMerchantTitleCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLMerchantTitleItem : RETableViewItem
@property (nonatomic,copy) id info;
@property (nonatomic,assign) int currentIndex;
@end

@interface QLMerchantTitleCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLMerchantTitleItem *item;
@end
