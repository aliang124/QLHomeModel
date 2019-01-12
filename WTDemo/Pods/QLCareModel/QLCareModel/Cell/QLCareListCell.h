//
//  QLCareListCell.h
//  QLCareModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLCareListItem : WTBaseItem
@property (nonatomic,assign) float descHeight;
@end

@interface QLCareListCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLCareListItem *item;
@end
