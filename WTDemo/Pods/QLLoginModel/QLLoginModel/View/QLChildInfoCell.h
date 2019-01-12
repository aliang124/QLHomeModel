//
//  QLChildInfoCell.h
//  WQLLoginModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLChildInfoItem : WTBaseItem
@end

@interface QLChildInfoCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLChildInfoItem *item;
@end
