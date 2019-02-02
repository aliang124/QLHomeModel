//
//  QLHomeCategoryCell.h
//  WQLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLSearchBarItem : RETableViewItem
@end

@interface QLSearchBarCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLSearchBarItem *item;
@end
