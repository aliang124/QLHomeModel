//
//  QLSettingButtonCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLSettingButtonItem : WTBaseItem
@property (nonatomic,copy) NSString *titleText;
@end

@interface QLSettingButtonCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLSettingButtonItem *item;
@end
