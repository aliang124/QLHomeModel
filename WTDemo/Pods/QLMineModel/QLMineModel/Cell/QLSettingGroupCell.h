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

typedef NS_ENUM(NSInteger, ButtonType) {
    ButtonType_LeftRightText = 1,
    ButtonType_LeftRightTextArrow = 2,
    ButtonType_IconLeftRightTextArrow = 3,
    ButtonType_IconLeftRightText = 4
};

@interface QLSettingGroupItem : WTBaseItem
@property (nonatomic,copy) NSArray *dataArray;
@property (nonatomic,copy) void (^btnPress)(int);

@end

@interface QLSettingGroupCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLSettingGroupItem *item;
@end
