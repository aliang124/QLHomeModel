//
//  WTBaseCell.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "RETableViewManager.h"
#import "RETableViewItem.h"
#import "RETableViewSection.h"
#import "RETableViewCell.h"

@interface WTBaseItem : RETableViewItem
@property (nonatomic,copy) id info;
@property (nonatomic,assign) BOOL hasBottomLine;
@property (nonatomic,assign) BOOL hasTopLine;
@property (nonatomic,copy) UIColor *bgColor;
@property (nonatomic,assign) BOOL hasArrow;//是否有向右箭头
@end

@interface WTBaseCell : RETableViewCell
@property (nonatomic,readwrite,strong) WTBaseItem *item;
@end
