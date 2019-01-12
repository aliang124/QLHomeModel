//
//  QLWanShanTitleCell.h
//  WQLLoginModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLWanShanTitleItem : WTBaseItem
@property (nonatomic,weak) UIViewController *delegateController;
@property (nonatomic,copy) UIImage *selectImage;
@end

@interface QLWanShanTitleCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLWanShanTitleItem *item;
@end
