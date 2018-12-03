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

@interface WTFormViewController : WTViewController
@property (nonatomic, strong) UITableView *formTable;
@property (nonatomic, strong) RETableViewManager *formManager;
@end
