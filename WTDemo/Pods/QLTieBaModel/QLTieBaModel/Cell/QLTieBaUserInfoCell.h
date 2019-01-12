//
//  QLTieBaTitleCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLTieBaUserInfoItem : WTBaseItem
@property (nonatomic,copy) NSString *titleText;
@end
@interface QLTieBaUserInfoCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLTieBaUserInfoItem *item;
@end
