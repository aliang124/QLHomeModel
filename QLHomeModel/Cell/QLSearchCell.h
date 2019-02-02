//
//  QLHomeCategoryCell.h
//  WQLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLSearchItem : RETableViewItem
@property (nonatomic,copy) NSString *titleText;
@end

@interface QLSearchCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLSearchItem *item;
@end
