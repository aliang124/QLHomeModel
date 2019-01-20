//
//  QLMerchantTagStarCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLMerchantTagStarItem : RETableViewItem
@property (nonatomic,copy) id info;
@end

@interface QLMerchantTagStarCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLMerchantTagStarItem *item;
@end
