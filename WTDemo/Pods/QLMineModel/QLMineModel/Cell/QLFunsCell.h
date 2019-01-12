//
//  QLFunsCel.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@interface QLFunsItem : RETableViewItem
@end

@interface QLFunsCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLFunsItem *item;
@end
