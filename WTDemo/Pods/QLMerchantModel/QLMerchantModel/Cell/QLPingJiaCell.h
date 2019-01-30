//
//  QLMerchantTitleCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLPingJiaItem : RETableViewItem
@property (nonatomic,copy) id info;
@property (nonatomic,copy) NSArray *pictureArray;//图片
@end

@interface QLPingJiaCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLPingJiaItem *item;
@end
