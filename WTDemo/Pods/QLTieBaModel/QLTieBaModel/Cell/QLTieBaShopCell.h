//
//  QLTieBaShopCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLTieBaShopItem : WTBaseItem
@property (nonatomic,copy) NSString *shopNameText;//标题
@end

@interface QLTieBaShopCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLTieBaShopItem *item;
@end
