//
//  WTFormViewController.h
//  WTBaseCore
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#import "WTViewController.h"
#import "RETableViewManager.h"
#import "RETableViewSection.h"
#import "WTDefine.h"
#import "UIScrollView+EmptyDataSet.h"
@interface WTFormViewController : WTViewController<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (nonatomic, strong) UITableView *formTable;
@property (nonatomic, strong) RETableViewManager *formManager;

//空数据相关属性
@property (nonatomic,copy) NSString *emptyDataIcon;
@property (nonatomic,copy) NSString *emptyDataTitle;
@property (nonatomic,copy) NSString *emptyDataDesc;
@end
