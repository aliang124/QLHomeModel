//
//  QLMerchantTitleCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLPingJiaDetailUserItem : RETableViewItem
@property (nonatomic,copy) id info;
@end

@interface QLPingJiaDetailUserCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLPingJiaDetailUserItem *item;
@end
