//
//  QQLMerchantDetailViewController.h
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "WTLoadFailEmpty.h"
#import "QLMerchantNetWorkingUtil.h"
#import "QLMerchantPictureCell.h"
#import "QLMerchantInfoCell.h"
#import "QLPicturesViewController.h"
#import "QLMerchantTagStarCell.h"
#import "QLMerchantTagTimeCell.h"
#import "QLMerchantTagCell.h"
#import "QLMerchantAddressPhoneCell.h"
#import "QLMerchantTitleCell.h"
#import "QLMerchantProductsCell.h"
#import "QLPingJiaCell.h"
#import "QLMoreButtonCell.h"
#import "QLMerchantQinZiCell.h"
#import "QLBottomView.h"

@interface QLMerchantDetailViewController : QLFormViewController
@property (nonatomic,copy) NSString *businessId;
@property (nonatomic,strong) QLBottomView *bottomView;
@end
