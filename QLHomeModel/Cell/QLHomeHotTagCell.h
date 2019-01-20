//
//  QLHomeCategoryCell.h
//  WQLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLHomeHotTagItem : RETableViewItem
@end

@interface QLHomeHotTagCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLHomeHotTagItem *item;
@end
