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
@interface QLMerchantDetailViewController ()
@property (nonatomic,copy) NSDictionary *businessInfo;
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
    [self getData];
    [self createBottomView];
}

- (void)createBottomView {
    _bottomView = [[QLBottomView alloc] initWithFrame:CGRectMake(0, WTScreenHeight-54-WT_SafeArea_BOTTOM, WTScreenWidth, 54+WT_SafeArea_BOTTOM)];
    _bottomView.businessId = self.businessId;
    _bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_bottomView];
}

- (void)getData {
    self.bottomView.hidden = YES;
    [WTLoadingView1 showLoadingInView:self.view top:WT_NavBar_Height];
    [QLMerchantNetWorkingUtil getBusinessDetail:self.businessId successHandler:^(id json) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        self.businessInfo = json[@"businessInfo"];
        self.bottomView.hidden = NO;
        self.bottomView.info = json[@"businessInfo"];
        [self initForm];
    } failHandler:^(NSString *message) {
        self.bottomView.hidden = YES;
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [WTLoadFailView showFailInView:self.view retryPress:^{
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
    [section0 addItem:itStar];
    
    WTEmptyItem *itEmp = [[WTEmptyItem alloc] init];
    itEmp.bgColor = [UIColor whiteColor];
    itEmp.cellHeight = 11;
    [section0 addItem:itEmp];
    
    QLMerchantTagTimeItem *itTagTime = [[QLMerchantTagTimeItem alloc] init];
    [section0 addItem:itTagTime];
    
    QLMerchantTagItem *itTag = [[QLMerchantTagItem alloc] init];
    [section0 addItem:itTag];
    
    QLMerchantAddressPhoneItem *itAddressPhone = [[QLMerchantAddressPhoneItem alloc] init];
    [section0 addItem:itAddressPhone];
    
    WTEmptyItem *itEmp1 = [[WTEmptyItem alloc] init];
    itEmp1.bgColor = [UIColor whiteColor];
    itEmp1.cellHeight = 17;
    [section0 addItem:itEmp1];

    QLMerchantTitleItem *itTitleT = [[QLMerchantTitleItem alloc] init];
    [section0 addItem:itTitleT];
    
    //商品
    NSArray *goodsArray = [NSArray arrayWithObjects:@"",@"",@"",@"", nil];
    if (goodsArray.count>0) {
        [section0 addItem:[WTEmptyItem initWithHeight:8]];
        QLMerchantProductsItem *itProduct = [[QLMerchantProductsItem alloc] init];
        itProduct.productArray = goodsArray;
        [section0 addItem:itProduct];
    }
    
    //评价
    NSArray *pingJiaArray = [NSArray arrayWithObjects:@"",@"",@"", nil];
    if (pingJiaArray.count>0) {
        [section0 addItem:[WTEmptyItem initWithHeight:8]];
        for (int i = 0; i < pingJiaArray.count; i++) {
            QLPingJiaItem *itPingJia = [[QLPingJiaItem alloc] init];
            itPingJia.scoreText = [NSString stringWithFormat:@"%d",i+3];
            if (i==0) {
                itPingJia.pictureArray = pingJiaArray;
            }
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
    NSArray *qinZiArrays = [NSArray arrayWithObjects:@"",@"",@"",@"", nil];
    if (qinZiArrays.count>0) {
        [section0 addItem:[WTEmptyItem initWithHeight:8]];
        QLMerchantQinZiItem *itQinZi = [[QLMerchantQinZiItem alloc] init];
        itQinZi.qinZiArray = qinZiArrays;
        [section0 addItem:itQinZi];
    }
    [section0 addItem:[WTEmptyItem initWithHeight:8]];

    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
