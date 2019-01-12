//
//  QLSettingTitleCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@interface QLSettingTitleItem : WTBaseItem
@property (nonatomic,copy) NSString *titleText;
@end

@interface QLSettingTitleCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLSettingTitleItem *item;
@end
