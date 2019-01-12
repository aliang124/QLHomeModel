//
//  QLNickNameCell.h
//  WQLLoginModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLNickNameItem : WTBaseItem
@end

@interface QLNickNameCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLNickNameItem *item;
@end
