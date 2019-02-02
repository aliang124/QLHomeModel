//
//  QLSearchView.m
//  WTDemo
//
//  Created by 计恩良 on 2019/2/2.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLSearchView.h"
#import "QLSearchHotCell.h"
#import "QLSearchBarCell.h"
@implementation QLSearchView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        [self initForm];
    }
    return self;
}

- (void)initView
{
    _formTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
    _formTable.estimatedRowHeight = 0;
    _formTable.estimatedSectionHeaderHeight = 0;
    _formTable.estimatedSectionFooterHeight = 0;
    _formTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _formTable.backgroundColor = [UIColor clearColor];
    _formTable.bounces = YES;
    _formTable.showsHorizontalScrollIndicator = NO;
    _formTable.showsVerticalScrollIndicator = NO;
    _formTable.tableFooterView = [UIView new];
    [self addSubview:_formTable];
    
    _formManager = [[RETableViewManager alloc] initWithTableView:_formTable];
    _formManager.delegate = self;
    _formManager[@"WTEmptyItem"] = @"WTEmptyCell";
    _formManager[@"WTBaseItem"] = @"WTBaseCell";
    _formManager[@"QLSearchHotItem"] = @"QLSearchHotCell";
    _formManager[@"QLSearchBarItem"] = @"QLSearchBarCell";
}

#pragma mark - RETableViewManagerDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex {
    return 0;
}

- (void)initForm {
    WT(weakSelf);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];

    QLSearchHotItem *itHot = [[QLSearchHotItem alloc] init];
    [section0 addItem:itHot];
    
    [section0 addItem:[WTEmptyItem initWithHeight:8]];
    
    QLSearchBarItem *itBar = [[QLSearchBarItem alloc] init];
    [section0 addItem:itBar];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
