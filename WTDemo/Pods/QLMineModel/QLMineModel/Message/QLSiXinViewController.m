//
//  QLSiXinViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/26.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLSiXinViewController.h"
#import "QLSiXinCell.h"
#import "QLMineNetWork.h"
#import "WTLoadFailEmpty.h"
#import <MJRefresh.h>

@interface QLSiXinViewController ()
@property (nonatomic,assign) BOOL isFromRefresh;

@end

@implementation QLSiXinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.hidden = YES;
    self.formTable.top = 0;
    self.formTable.height = WTScreenHeight-WT_NavBar_Height-44;

    _isFromRefresh = YES;
    _listArray = [[NSMutableArray alloc] init];
    self.formManager[@"QLSiXinItem"] = @"QLSiXinCell";
    
    self.formTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.pageIndex = 1;
        self.isFromRefresh = YES;
        [self getFunsData];
    }];
    [WTLoadingView1 showLoadingInView:self.view top:WT_NavBar_Height];
    [self getFunsData];
}

- (void)getFunsData {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[NSNumber numberWithInt:self.pageIndex] forKey:@"page"];
    [dic setObject:@"10" forKey:@"count"];
    [QLMineNetWork getFlowerFuns:dic successHandler:^(id json) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [self.formTable.mj_header endRefreshing];
        
        self.totalPage = [[WTUtil strRelay:json[@"huxiang"]] intValue];
        if (self.isFromRefresh) {
            [self.listArray removeAllObjects];
        }
        NSArray *ar = json[@"list"];
        if (ar && [ar isKindOfClass:[NSArray class]]) {
            [self.listArray addObjectsFromArray:ar];
        }
        [self initForm];
        self.isFromRefresh = NO;
    } failHandler:^(NSString *message) {
        [self.formTable.mj_header endRefreshing];
        if (self.isFromRefresh) {
            [WTLoadFailView showFailInView:self.view top:WT_NavBar_Height retryPress:^{
                [WTLoadingView1 showLoadingInView:self.view top:WT_NavBar_Height];
                [self getFunsData];
            }];
        }
        self.isFromRefresh = NO;
    }];
}

- (void)initForm {
    if (self.listArray.count==0) {
        [WTEmptyView showEmptyInView:self.view top:WT_NavBar_Height image:[UIImage imageNamed:@"emptyImage"]];
    }
    
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    for (int i = 0; i < self.listArray.count; i++) {
        QLSiXinItem *itFuns = [[QLSiXinItem alloc] init];
        itFuns.info = self.listArray[i];
        [section0 addItem:itFuns];
    }
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}

@end
