//
//  WTIconTextCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLZhuYeGoodItem : WTBaseItem
@property (nonatomic,copy) NSString *titleText;//标题
@property (nonatomic,copy) NSString *descText;//标题说明
//缓存标题高度
@property (nonatomic,assign) float titleTextHeight;
//缓存说明高度
@property (nonatomic,assign) float descTextHeight;
@end

@interface QLZhuYeGoodCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLZhuYeGoodItem *item;
@end
