//
//  QLMerchantTitleCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLPingJiaListItem : RETableViewItem
@property (nonatomic,copy) id info;
@property (nonatomic,copy) NSString *scoreText;//分数
@property (nonatomic,copy) NSString *descText;//评价
@property (nonatomic,copy) NSString *viewCount;//评论数
@property (nonatomic,copy) NSString *dianZanCount;//点赞数
@property (nonatomic,copy) NSArray *pictureArray;//图片
@end

@interface QLPingJiaListCell : RETableViewCell
@property (strong, readwrite, nonatomic) QLPingJiaListItem *item;
@end
