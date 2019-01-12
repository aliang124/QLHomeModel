//
//  QLModifyNickCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"

@interface QLModifyNickItem : RETableViewItem
@property (nonatomic,copy) NSString *nickName;
@end

@interface QLModifyNickCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLModifyNickItem *item;
@end
