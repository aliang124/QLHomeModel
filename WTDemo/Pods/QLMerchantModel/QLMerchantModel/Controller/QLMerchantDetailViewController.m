//
//  QLMerchantDetailViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLMerchantDetailViewController.h"
#import "QLZhuYeViewController.h"
#import "QLPingJiaListViewController.h"
#import <MJRefresh.h>

@interface QLMerchantDetailViewController ()
@property (nonatomic,copy) NSDictionary *businessInfo;//商家信息
@property (nonatomic,copy) NSArray *businessCommentsData;//评论
@property (nonatomic,copy) NSArray *businessGoodsData;//商品
@property (nonatomic,copy) NSArray *peripheryBusiness;//周边亲子
@end

@implementation QLMerchantDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"商家详情";
    self.formManager[@"QLMerchantPictureItem"] = @"QLMerchantPictureCell";
    self.formManager[@"QLMerchantInfoItem"] = @"QLMerchantInfoCell";
    self.formManager[@"QLMerchantTagStarItem"] = @"QLMerchantTagStarCell";
    self.formManager[@"QLMerchantTagTimeItem"] = @"QLMerchantTagTimeCell";
    self.formManager[@"QLMerchantTagItem"] = @"QLMerchantTagCell";
    self.formManager[@"QLMerchantAddressPhoneItem"] = @"QLMerchantAddressPhoneCell";
    self.formManager[@"QLMerchantTitleItem"] = @"QLMerchantTitleCell";
    self.formManager[@"QLMerchantProductsItem"] = @"QLMerchantProductsCell";
    self.formManager[@"QLPingJiaItem"] = @"QLPingJiaCell";
    self.formManager[@"QLMoreButtonItem"] = @"QLMoreButtonCell";
    self.formManager[@"QLMerchantQinZiItem"] = @"QLMerchantQinZiCell";
    self.formTable.height = WTScreenHeight-WT_NavBar_Height-54-WT_SafeArea_BOTTOM;

    self.bottomView.hidden = YES;
    [WTLoadingView1 showLoadingInView:self.view top:WT_NavBar_Height];
    [self getData];
    self.formTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getData];
    }];
    [self createBottomView];
}

- (void)createBottomView {
    _bottomView = [[QLBottomView alloc] initWithFrame:CGRectMake(0, WTScreenHeight-54-WT_SafeArea_BOTTOM, WTScreenWidth, 54+WT_SafeArea_BOTTOM)];
    _bottomView.businessId = self.businessId;
    _bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_bottomView];
}

- (void)getData {
    [QLMerchantNetWorkingUtil getBusinessDetail:self.businessId successHandler:^(id json) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [self.formTable.mj_header endRefreshing];
        self.businessInfo = json[@"businessInfo"];
        self.businessCommentsData = json[@"businessCommentsData"];
        self.businessGoodsData = json[@"businessGoodsData"];
        self.peripheryBusiness = json[@"peripheryBusiness"];
        self.bottomView.hidden = NO;
        self.bottomView.info = json[@"businessInfo"];
        self.bottomView.businessId = self.businessId;
        [self initForm];
    } failHandler:^(NSString *message) {
        self.bottomView.hidden = YES;
        [self.formTable.mj_header endRefreshing];
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [WTLoadFailView showFailInView:self.view top:WT_NavBar_Height retryPress:^{
            [self getData];
        }];
    }];
}

- (void)initForm {
    self.navBar.title = [WTUtil strRelay:self.businessInfo[@"name"]];
    [self.navBar setNeedsLayout];
    
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];

    QLMerchantPictureItem *itPic = [[QLMerchantPictureItem alloc] init];
    itPic.info = self.businessInfo;
    itPic.selectionHandler = ^(id item) {
        QLPicturesViewController *picVC = [[QLPicturesViewController alloc] init];
        [bself.navigationController pushViewController:picVC animated:YES];
    };
    [section0 addItem:itPic];

    QLMerchantInfoItem *itInfo = [[QLMerchantInfoItem alloc] init];
    itInfo.info = self.businessInfo;
    [section0 addItem:itInfo];
    
    QLMerchantTagStarItem *itStar = [[QLMerchantTagStarItem alloc] init];
    itStar.info = self.businessInfo;
    [section0 addItem:itStar];
    
    [section0 addItem:[WTEmptyItem initWithHeight:11 bgColor:[UIColor whiteColor]]];
    
    QLMerchantTagTimeItem *itTagTime = [[QLMerchantTagTimeItem alloc] init];
    itTagTime.info = self.businessInfo;
    [section0 addItem:itTagTime];
    
    QLMerchantTagItem *itTag = [[QLMerchantTagItem alloc] init];
    itTag.info = self.businessInfo;
    [section0 addItem:itTag];
    
    QLMerchantAddressPhoneItem *itAddressPhone = [[QLMerchantAddressPhoneItem alloc] init];
    itAddressPhone.info = self.businessInfo;
    [section0 addItem:itAddressPhone];
    
    [section0 addItem:[WTEmptyItem initWithHeight:17 bgColor:[UIColor whiteColor]]];
    
    QLMerchantTitleItem *itTitleT = [[QLMerchantTitleItem alloc] init];
    [section0 addItem:itTitleT];
    
    //商品
    if (self.businessGoodsData && self.businessGoodsData.count>0) {
        [section0 addItem:[WTEmptyItem initWithHeight:8]];
        QLMerchantProductsItem *itProduct = [[QLMerchantProductsItem alloc] init];
        itProduct.productArray = self.businessGoodsData;
        [section0 addItem:itProduct];
    }
    
    //评价
    if (self.businessCommentsData && self.businessCommentsData.count>0) {
        [section0 addItem:[WTEmptyItem initWithHeight:8]];
        for (int i = 0; i < self.businessCommentsData.count; i++) {
            NSDictionary *dic = self.businessCommentsData[i];
            QLPingJiaItem *itPingJia = [[QLPingJiaItem alloc] init];
            itPingJia.pictureArray = [NSArray arrayWithObjects:@"",@"",@"", nil];
            itPingJia.info = dic;
            [section0 addItem:itPingJia];
        }
        QLMoreButtonItem *itMore = [[QLMoreButtonItem alloc] init];
        itMore.titleText = @"查看更多评价";
        itMore.selectionHandler = ^(id item) {
            QLPingJiaListViewController *list = [[QLPingJiaListViewController alloc] init];
            list.businessId = bself.businessId;
            WTRootNavPush(list);
        };
        [section0 addItem:itMore];
    }
    
    //周边亲子
    if (self.peripheryBusiness && self.peripheryBusiness.count>0) {
        [section0 addItem:[WTEmptyItem initWithHeight:8]];
        QLMerchantQinZiItem *itQinZi = [[QLMerchantQinZiItem alloc] init];
        itQinZi.qinZiArray = self.peripheryBusiness;
        [section0 addItem:itQinZi];
    }
    [section0 addItem:[WTEmptyItem initWithHeight:8]];

    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
