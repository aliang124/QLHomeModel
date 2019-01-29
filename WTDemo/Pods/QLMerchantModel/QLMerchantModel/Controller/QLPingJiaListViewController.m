//
//  QLPingJiaListViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLPingJiaListViewController.h"
#import "QLMerchantNetWorkingUtil.h"
#import "QLPingJiaHeadView.h"
#import "QLMerchantNetWorkingUtil.h"
#import "WTLoadFailEmpty.h"
#import <MJRefresh.h>
#import "QLPingJiaListCell.h"
#import "QLPingJiaDetailViewController.h"

@interface QLPingJiaListViewController ()
@property (nonatomic,strong) QLPingJiaHeadView *headView;
@property (nonatomic,assign) BOOL isFromRefresh;
@property (nonatomic,copy) NSDictionary *businessInfo;
@end

@implementation QLPingJiaListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"全部评价";
    self.type = 1;
    self.formManager[@"QLPingJiaListItem"] = @"QLPingJiaListCell";
    
    WT(bself);
    _headView = [[QLPingJiaHeadView alloc] initWithFrame:CGRectMake(0, WT_NavBar_Height, WTScreenWidth, 46)];
    _headView.typeBtnPress = ^(int t) {
        bself.type = t;
        [bself.formTable.mj_header beginRefreshing];
    };
    [self.view addSubview:_headView];
    
    self.formTable.top = WT_NavBar_Height+46;
    self.formTable.height = WTScreenHeight-self.formTable.top;
    
    _isFromRefresh = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    _listArray = [[NSMutableArray alloc] init];
    
    self.formTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.pageIndex = 1;
        self.isFromRefresh = YES;
        [self getPingLunData];
    }];
    [WTLoadingView1 showLoadingInView:self.view top:self.formTable.top];
    [self getPingLunData];
}

- (void)getPingLunData {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[NSNumber numberWithInt:self.pageIndex] forKey:@"page"];
    [dic setObject:[NSNumber numberWithInt:self.type] forKey:@"type"];
    [dic setObject:@"10" forKey:@"pageSize"];
    [dic setObject:[WTUtil strRelay:self.businessId] forKey:@"businessId"];
    [QLMerchantNetWorkingUtil getAllPingJia:dic successHandler:^(id json) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [self.formTable.mj_header endRefreshing];
        
        self.totalPage = [[WTUtil strRelay:json[@"count"]] intValue];
        if (self.isFromRefresh) {
            [self.listArray removeAllObjects];
        }
        NSArray *ar = json[@"commentsData"];
        if (ar && [ar isKindOfClass:[NSArray class]]) {
            [self.listArray addObjectsFromArray:ar];
        }
        [self initForm];
        self.isFromRefresh = NO;
    } failHandler:^(NSString *message) {
        [self.formTable.mj_header endRefreshing];
        if (self.isFromRefresh) {
            [WTLoadFailView showFailInView:self.view top:self.formTable.top retryPress:^{
                [WTLoadingView1 showLoadingInView:self.view top:self.formTable.top];
                [self getPingLunData];
            }];
        }
        self.isFromRefresh = NO;
    }];
}

- (void)initForm {
    if (self.listArray.count==0) {
        [WTEmptyView showEmptyInView:self.view top:self.formTable.top image:[UIImage imageNamed:@"emptyImage"]];
    }
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    for (int i = 0; i < self.listArray.count; i++) {
        NSDictionary *dic = self.listArray[i];
        
        QLPingJiaListItem *it = [[QLPingJiaListItem alloc] init];
        it.info = dic;
        it.scoreText = dic[@"score"];
        it.descText = dic[@"comments"];
        it.viewCount = dic[@"commentsNumber"];
        it.dianZanCount = dic[@"praiseNumber"];
        if (i==0) {
            it.pictureArray = [NSArray arrayWithObjects:@"",@"",@"", nil];
        }
        it.selectionHandler = ^(QLPingJiaListItem *item) {
            QLPingJiaDetailViewController *vc = [[QLPingJiaDetailViewController alloc] init];
            vc.businessId = bself.businessId;
            vc.commentId = item.info[@"commentsId"];
            [bself.navigationController pushViewController:vc animated:YES];
        };
        [section0 addItem:it];
    }
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}
@end
