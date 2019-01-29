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

@interface QLSiXinItem : RETableViewItem
@property (nonatomic,copy) id info;
@property (nonatomic,copy) void (^guanZhuSuccess)(void);
@end

@interface QLSiXinCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLSiXinItem *item;
@end
