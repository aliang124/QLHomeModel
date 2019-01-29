//
//  QLTieBaShopCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLZhuYeHeadItem : RETableViewItem
@property (nonatomic,copy) id info;
@end

@interface QLZhuYeHeadCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLZhuYeHeadCell *item;
@end
