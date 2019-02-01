//
//  QLHomeViewController.h
//  Project
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//
#import "QLHomeBannerCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import <CTMediator.h>
#import "QLHomeNetWorkingUtil.h"
#import "QLHomeCategoryCell.h"
#import "QLHomeHotTagCell.h"
#import "QLHomeMerchantListCell.h"
#import "QLHomeTieZiCell.h"
#import "WTLoadFailEmpty.h"
#import "QLSearchViewController.h"
#import "YBPopupMenu.h"
#import <MJRefresh.h>

@interface QLHomeViewController : WTFormViewController<YBPopupMenuDelegate>
@property (nonatomic,copy) NSArray *categoryArray;
@property (nonatomic,copy) NSArray *ageArray;
@property (nonatomic,copy) NSArray *businessArray;
@property (nonatomic,strong) NSMutableArray *subjectArray;
@property (nonatomic,strong) NSMutableArray *bannerArray;
@property (nonatomic,strong) UIButton *ageView;
@property (nonatomic,strong) UILabel *ageLabel;

@end
