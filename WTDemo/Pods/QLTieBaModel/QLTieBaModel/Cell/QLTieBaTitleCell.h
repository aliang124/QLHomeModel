//
//  QLTieBaTitleCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLTieBaTitleItem : WTBaseItem
@property (nonatomic,copy) NSString *titleText;//标题
@property (nonatomic,copy) UIFont *titleFont;
@property (nonatomic,copy) UIColor *titleColor;
//缓存标题高度
@property (nonatomic,assign) float titleTextHeight;
@property (nonatomic,assign) float rightOffset;
@end

@interface QLTieBaTitleCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLTieBaTitleItem *item;
@end
