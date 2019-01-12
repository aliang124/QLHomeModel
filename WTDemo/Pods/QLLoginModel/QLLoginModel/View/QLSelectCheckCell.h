//
//  QLSelectCheckCell.h
//  WQLLoginModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLSelectCheckItem : WTBaseItem
@property (nonatomic,copy) NSString *leftText;
@property (nonatomic,copy) NSString *rightText;

@end

@interface QLSelectCheckCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLSelectCheckItem *item;
@end
