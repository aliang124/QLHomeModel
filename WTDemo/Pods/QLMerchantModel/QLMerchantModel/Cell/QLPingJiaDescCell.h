//
//  QLTieBaShopCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLPingJiaDescItem : RETableViewItem
@property (nonatomic,copy) NSString *descText;
@end

@interface QLPingJiaDescCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLPingJiaDescItem *item;
@end
