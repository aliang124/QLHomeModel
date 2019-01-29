//
//  QLTieBaShopCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLPingJiaHuiFuItem : RETableViewItem
@property (nonatomic,copy) id info;
@end

@interface QLPingJiaHuiFuCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLPingJiaHuiFuItem *item;
@end
