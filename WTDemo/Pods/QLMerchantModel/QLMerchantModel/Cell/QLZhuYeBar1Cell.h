//
//  QLZhuYeBar1Cell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLZhuYeBar1Item : RETableViewItem
@property (nonatomic,copy) id info;
@property (nonatomic,assign) int type;
@end

@interface QLZhuYeBar1Cell : RETableViewCell
@property (strong, readwrite, nonatomic) QLZhuYeBar1Item *item;
@end
