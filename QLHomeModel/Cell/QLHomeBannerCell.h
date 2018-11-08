//
//  QLHomeBannerCell.h
//  WQLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"

@interface QLHomeBannerItem : WTBaseItem
@property (nonatomic, copy) NSArray *datas;
@end

@interface QLHomeBannerCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLHomeBannerItem *item;
@end
