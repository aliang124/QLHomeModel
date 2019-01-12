//
//  QLMineHeadCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@interface QLMineHeadItem : WTBaseItem
@end

@interface QLMineHeadCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLMineHeadItem *item;
@end
