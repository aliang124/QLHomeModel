//
//  QLTieBaImageViewCell.h
//  WQLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLTieBaImageViewItem : WTBaseItem
@property (nonatomic,copy) NSString *titleText;//标题
@end

@interface QLTieBaImageViewCell : WTBaseCell
@property (strong, readwrite, nonatomic) QLTieBaImageViewItem *item;
@end
