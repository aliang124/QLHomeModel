//
//  QLSettingGroupCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLSettingGroupItem1 : WTBaseItem
@property (nonatomic,copy) NSArray *dataArray;
@end

@interface QLSettingGroupCell1 : WTBaseCell
@property (strong, readwrite, nonatomic) QLSettingGroupItem1 *item;
@end
