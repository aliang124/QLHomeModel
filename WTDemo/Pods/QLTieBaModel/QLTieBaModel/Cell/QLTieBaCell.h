//
//  WTIconTextCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLTieBaItem : WTBaseItem
@property (nonatomic,copy) NSString *userIconUrl;//头像
//缓存标题高度
@property (nonatomic,assign) float titleTextHeight;
//缓存说明高度
@property (nonatomic,assign) float descTextHeight;
@end

@interface QLTieBaCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLTieBaItem *item;
@end
