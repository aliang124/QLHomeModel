//
//  WTFormViewController.h
//  WTBaseCore
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#import "WTFormViewController.h"
#import "UIView+Category.h"
#import "WTUtil.h"
#import "NSString+Category.h"

@interface WTFormViewController ()<RETableViewManagerDelegate>

@end

@implementation WTFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self initView];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.formTable setEditing:NO];
}

- (void)initView
{
     _formTable = [[UITableView alloc] initWithFrame:CGRectMake(0, WT_Default_NavBar_Height, WTScreenWidth, WTScreenHeight-WT_Default_NavBar_Height) style:UITableViewStylePlain];
     _formTable.estimatedRowHeight = 0;
     _formTable.estimatedSectionHeaderHeight = 0;
     _formTable.estimatedSectionFooterHeight = 0;
     _formTable.separatorStyle = UITableViewCellSeparatorStyleNone;
     _formTable.backgroundColor = [UIColor clearColor];
     _formTable.bounces = YES;
     _formTable.showsHorizontalScrollIndicator = NO;
     _formTable.showsVerticalScrollIndicator = NO;
     _formTable.tableFooterView = [UIView new];
#ifdef __IPHONE_11_0
    if ([_formTable respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        _formTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
#endif
     [self.view addSubview:_formTable];
     
     _formManager = [[RETableViewManager alloc] initWithTableView:_formTable];
     _formManager.delegate = self;
     _formManager[@"WTEmptyItem"] = @"WTEmptyCell";
    _formManager[@"WTBaseItem"] = @"WTBaseCell";
}

#pragma mark - RETableViewManagerDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex {
     return 0;
}

@end
