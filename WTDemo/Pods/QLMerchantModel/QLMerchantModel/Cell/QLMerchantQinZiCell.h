//
//  QLMerchantTagTimeCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLMerchantQinZiItem : RETableViewItem
@property (nonatomic,copy) NSArray *qinZiArray;
@end

@interface QLMerchantQinZiCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLMerchantQinZiItem *item;
@end
