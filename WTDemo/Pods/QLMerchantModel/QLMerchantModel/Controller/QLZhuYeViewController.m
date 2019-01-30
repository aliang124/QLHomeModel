//
//  QLZhuYeViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLZhuYeViewController.h"
#import "QLMerchantNetWorkingUtil.h"
#import "QLZhuYeHeadCell.h"
#import "QLZhuYeBarCell.h"
#import "QLZhuYeBar1Cell.h"
#import "QLZhuYeGoodCell.h"
#import <CTMediator.h>
#import <MJRefresh.h>

@interface QLZhuYeViewController ()
@property (nonatomic,copy) NSDictionary *memberInfo;
@property (nonatomic,copy) NSString *isFollow;
@property (nonatomic,copy) NSString *followNum;
@property (nonatomic,copy) NSString *fansNum;
@end

@implementation QLZhuYeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"个人主页";
    self.formManager[@"QLZhuYeHeadItem"] = @"QLZhuYeHeadCell";
    self.formManager[@"QLZhuYeBarItem"] = @"QLZhuYeBarCell";
    self.formManager[@"QLZhuYeBar1Item"] = @"QLZhuYeBar1Cell";
    self.formManager[@"QLZhuYeGoodItem"] = @"QLZhuYeGoodCell";

    [WTLoadingView1 showLoadingInView:self.view top:WT_NavBar_Height];
    [self getData];
    self.formTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getData];
    }];
}

- (void)getData {
    NSDictionary *param = [NSDictionary dictionaryWithObject:[WTUtil strRelay:self.memberId] forKey:@"memberId"];
    param = [NSDictionary dictionaryWithObject:@"1154642408137421115" forKey:@"memberId"];
    [QLMerchantNetWorkingUtil getZhuYeInfo:param successHandler:^(id json) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [self.formTable.mj_header endRefreshing];
        self.memberInfo = json[@"memberInfo"];
        self.isFollow = json[@"isFollow"];
        self.followNum = json[@"followNum"];
        self.fansNum = json[@"fansNum"];
        [self initForm];
    } failHandler:^(NSString *message) {
        [self.formTable.mj_header endRefreshing];
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [WTLoadFailView showFailInView:self.view top:WT_NavBar_Height retryPress:^{
            [self getData];
        }];
    }];
}

- (void)initForm {
    self.navBar.title = [WTUtil strRelay:self.memberInfo[@"name"]];
    [self.navBar setNeedsLayout];
    
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    [section0 addItem:[WTEmptyItem initWithHeight:12 bgColor:[UIColor whiteColor]]];

    QLZhuYeHeadItem *itZhuYe = [[QLZhuYeHeadItem alloc] init];
    itZhuYe.info = self.memberInfo;
    itZhuYe.isFollow = self.isFollow;
    itZhuYe.fansNum = self.fansNum;
    itZhuYe.followNum = self.followNum;
    [section0 addItem:itZhuYe];
    
    QLZhuYeBarItem *itBar = [[QLZhuYeBarItem alloc] init];
    itBar.info = self.memberInfo;
    itBar.isFollow = self.isFollow;
    itBar.fansNum = self.fansNum;
    itBar.followNum = self.followNum;
    [section0 addItem:itBar];

    QLZhuYeBar1Item *itBar1 = [[QLZhuYeBar1Item alloc] init];
    itBar1.type = 0;
    [section0 addItem:itBar1];

    [section0 addItem:[WTEmptyItem initWithHeight:8]];
    
    for (int i = 0; i < 4; i++) {
        QLZhuYeGoodItem *itGood = [[QLZhuYeGoodItem alloc] init];
        itGood.selectionHandler = ^(QLZhuYeGoodItem *item) {
            UIViewController *vc = [[CTMediator sharedInstance] performTarget:@"QLTieBaModel" action:@"tieBaDetailVC" params:nil shouldCacheTarget:NO];
            [bself.navigationController pushViewController:vc animated:YES];
        };
        [section0 addItem:itGood];

        [section0 addItem:[WTEmptyItem initWithHeight:8]];
    }
        
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
