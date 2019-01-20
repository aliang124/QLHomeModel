//
//  QLMerchantTagTimeCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLMerchantTagItem : RETableViewItem
@property (nonatomic,copy) id info;
@end

@interface QLMerchantTagCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLMerchantTagItem *item;
@end
