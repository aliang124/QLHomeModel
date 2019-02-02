//
//  QLHomeCategoryCell.h
//  WQLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLSearchHotItem : RETableViewItem
@end

@interface QLSearchHotCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLSearchHotItem *item;
@end
