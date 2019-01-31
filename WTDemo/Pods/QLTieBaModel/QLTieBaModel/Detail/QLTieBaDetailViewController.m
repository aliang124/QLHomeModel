//
//  QLTieBaDetailViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLTieBaDetailViewController.h"
#import "QLTieBaTitleCell.h"
#import "QLTieBaUserInfoCell.h"
#import "QLTieBaShopCell.h"
#import "QLTieBaImageViewCell.h"
#import "QLPingJiaDianZanCell.h"
#import "QLTieBaNetWork.h"
#import <MJRefresh.h>
#import "WTLoadFailEmpty.h"

@interface QLTieBaDetailViewController ()
@property (nonatomic,copy) NSDictionary *subjectInfo;
@end

@implementation QLTieBaDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.formManager[@"QLTieBaTitleItem"] = @"QLTieBaTitleCell";
    self.formManager[@"QLTieBaUserInfoItem"] = @"QLTieBaUserInfoCell";
    self.formManager[@"QLTieBaShopItem"] = @"QLTieBaShopCell";
    self.formManager[@"QLTieBaImageViewItem"] = @"QLTieBaImageViewCell";
    self.formManager[@"QLPingJiaDianZanItem"] = @"QLPingJiaDianZanCell";

    self.formTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getData];
    }];
    [WTLoadingView1 showLoadingInView:self.view top:WT_NavBar_Height];
    [self getData];
}

- (void)getData {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:[WTUtil strRelay:self.subjectId] forKey:@"subjectId"];
    [QLTieBaNetWork getTieBaDetail:param successHandler:^(id json) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [self.formTable.mj_header endRefreshing];
        self.subjectInfo = json[@"subjectInfo"];
        [self initForm];
    } failHandler:^(NSString *message) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [self.formTable.mj_header endRefreshing];
    }];
}

- (void)initForm {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    [section0 addItem:[WTEmptyItem initWithHeight:18 bgColor:[UIColor whiteColor]]];
    //标题
    QLTieBaTitleItem *itTitle = [[QLTieBaTitleItem alloc] init];
    itTitle.titleText = [WTUtil strRelay:self.subjectInfo[@"name"]];
    [section0 addItem:itTitle];
    //用户信息区域
    QLTieBaUserInfoItem *itUserInfo = [[QLTieBaUserInfoItem alloc] init];
    itUserInfo.info = self.subjectInfo;
    [section0 addItem:itUserInfo];
    //店铺信息
    QLTieBaShopItem *itShop = [[QLTieBaShopItem alloc] init];
    itShop.shopNameText = [WTUtil strRelay:self.subjectInfo[@"businessName"]];
    itShop.info = self.subjectInfo;
    [section0 addItem:itShop];
    [section0 addItem:[WTEmptyItem initWithHeight:15 bgColor:[UIColor whiteColor]]];
    //描述信息
    QLTieBaTitleItem *itContent = [[QLTieBaTitleItem alloc] init];
    itContent.titleText = [WTUtil strRelay:self.subjectInfo[@"description"]];
    itContent.titleFont = WTFontSys(14);
    itContent.titleColor = QL_DescColor_Gray;
    itContent.rightOffset = 22;
    [section0 addItem:itContent];

    [section0 addItem:[WTEmptyItem initWithHeight:12 bgColor:[UIColor whiteColor]]];
    QLTieBaImageViewItem *itemImg = [[QLTieBaImageViewItem alloc] init];
    [section0 addItem:itemImg];

//    [section0 addItem:[WTEmptyItem initWithHeight:12 bgColor:[UIColor whiteColor]]];

//    QLTieBaTitleItem *itContent1 = [[QLTieBaTitleItem alloc] init];
//    itContent1.titleText = @"她家有亲子针织类，颜色都是很温柔的蓝粉白，特别公主风的设计，小裙子和针织套装很软糯，有几款宫廷风的小围兜很可爱，普普通通的连体衣搭一个围兜立马就欧洲宫廷风了。这个店还有小鞋子但不推荐买，只是好看而已，不太实用。看着简简单单的印花，穿上都很可爱，很高级。";
//    itContent1.titleFont = WTFontSys(14);
//    itContent1.titleColor = QL_DescColor_Gray;
//    itContent1.rightOffset = 22;
//    [section0 addItem:itContent1];
//
//    [section0 addItem:[WTEmptyItem initWithHeight:8]];
//    
//    QLPingJiaDianZanItem *itZan = [[QLPingJiaDianZanItem alloc] init];
//    itZan.count = @"1234";
//    [section0 addItem:itZan];
//
//    [section0 addItem:[WTEmptyItem initWithHeight:8]];
//
//    QLPingJiaDianZanItem *itHuiFu = [[QLPingJiaDianZanItem alloc] init];
//    itHuiFu.count = @"1234";
//    itHuiFu.isHuiFuTitle = YES;
//    [section0 addItem:itHuiFu];

    
    
//    [section0 addItem:[WTEmptyItem initWithHeight:17 bgColor:[UIColor whiteColor]]];

    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
