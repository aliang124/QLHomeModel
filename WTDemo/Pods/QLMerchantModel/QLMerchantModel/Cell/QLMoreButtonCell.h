//
//  QLMerchantTagTimeCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLMoreButtonItem : RETableViewItem
@property (nonatomic,copy) id info;
@property (nonatomic,copy) NSString *titleText;
@end

@interface QLMoreButtonCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLMoreButtonItem *item;
@end
