//
//  WTIconTextCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "RETableViewItem.h"
#import "RETableViewCell.h"

@interface WTIconTextItem : RETableViewItem
@property (nonatomic,copy) NSString *textString;
@property (nonatomic,copy) UIImage *iconImg;
@property (nonatomic,copy) UIImage *arrowImg;
@end

@interface WTIconTextCell : RETableViewCell
@property (strong, readwrite, nonatomic) WTIconTextItem *item;
@end
