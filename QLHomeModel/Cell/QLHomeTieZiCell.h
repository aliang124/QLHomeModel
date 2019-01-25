//
//  QLHomeTieZiCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLHomeTieZiItem : RETableViewItem
@property (nonatomic,copy) NSString *titleText;//标题
@property (nonatomic,copy) NSString *descText;//标题说明
//缓存标题高度
@property (nonatomic,assign) float titleTextHeight;
//缓存说明高度
@property (nonatomic,assign) float descTextHeight;
@property (nonatomic,copy) id userInfo;
@end

@interface QLHomeTieZiCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLHomeTieZiItem *item;
@end
