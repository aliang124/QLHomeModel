//
//  QLTieBaShopCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLZhuYeBarItem : RETableViewItem
@property (nonatomic,copy) id info;
@property (nonatomic,copy) NSString *isFollow;
@property (nonatomic,copy) NSString *followNum;
@property (nonatomic,copy) NSString *fansNum;
@end

@interface QLZhuYeBarCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLZhuYeBarItem *item;
@end
