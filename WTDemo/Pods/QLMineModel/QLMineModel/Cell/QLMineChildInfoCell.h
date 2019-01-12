//
//  QLMineChildInfoCell.h
//  WQLLoginModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLMineChildInfoItem : WTBaseItem
@end

@interface QLMineChildInfoCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLMineChildInfoItem *item;
@end
