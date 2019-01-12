//
//  WTEmptyCell.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface WTEmptyItem : WTBaseItem
@property (nonatomic,copy) UIColor *bgColor;
+ (id)initWithHeight:(float)height;
+ (id)initWithHeight:(float)height bgColor:(UIColor *)bColor;
@end

@interface WTEmptyCell : WTBaseCell
@property (strong, readwrite, nonatomic) WTEmptyItem *item;
@end
