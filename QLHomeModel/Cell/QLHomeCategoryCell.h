//
//  QLHomeCategoryCell.h
//  WQLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLHomeCategoryItem : RETableViewItem
@property (nonatomic, copy) NSArray *datas;
@property (copy, readwrite, nonatomic) void (^iconPressHandler)(id info);
@end

@interface QLHomeCategoryCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLHomeCategoryItem *item;
@end
