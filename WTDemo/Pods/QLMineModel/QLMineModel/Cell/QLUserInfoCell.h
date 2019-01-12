//
//  QLUserInfoCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@interface QLUserInfoItem : RETableViewItem
@property (nonatomic,copy) NSString *leftText;
@property (nonatomic,copy) NSString *rightText;
@property (copy, readwrite, nonatomic) void (^btnPressHandler)(id item);

@end

@interface QLUserInfoCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLUserInfoItem *item;
@end
