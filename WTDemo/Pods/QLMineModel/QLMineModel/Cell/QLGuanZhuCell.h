//
//  QLGuanZhuCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@interface QLGuanZhuItem : RETableViewItem
@end

@interface QLGuanZhuCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLGuanZhuItem *item;
@end
