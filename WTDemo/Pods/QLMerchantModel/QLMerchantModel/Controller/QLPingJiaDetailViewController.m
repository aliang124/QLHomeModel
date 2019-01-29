//
//  QLPingJiaViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLPingJiaDetailViewController.h"
#import "QLMerchantNetWorkingUtil.h"
#import "QLPingJiaHeadView.h"
#import "QLPingJiaHeadBannerCell.h"
#import "QLPingJiaDetailUserCell.h"
#import "QLPingJiaMerchantCell.h"
#import "QLPingJiaScoreCell.h"
#import "QLPingJiaDescCell.h"
#import "QLPingJiaDianZanCell.h"
#import "QLPingJiaHuiFuCell.h"
@interface QLPingJiaDetailViewController ()
@property (nonatomic,copy) NSDictionary *commentsData;
@end

@implementation QLPingJiaDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"评价详情";
    self.formManager[@"QLPingJiaHeadBannerItem"] = @"QLPingJiaHeadBannerCell";
    self.formManager[@"QLPingJiaDetailUserItem"] = @"QLPingJiaDetailUserCell";
    self.formManager[@"QLPingJiaMerchantItem"] = @"QLPingJiaMerchantCell";
    self.formManager[@"QLPingJiaScoreItem"] = @"QLPingJiaScoreCell";
    self.formManager[@"QLPingJiaDescItem"] = @"QLPingJiaDescCell";
    self.formManager[@"QLPingJiaDianZanItem"] = @"QLPingJiaDianZanCell";
    self.formManager[@"QLPingJiaHuiFuItem"] = @"QLPingJiaHuiFuCell";
    [self getData];
}

- (void)getData {
    [WTLoadingView1 showLoadingInView:self.view top:WT_NavBar_Height];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:[WTUtil strRelay:self.businessId] forKey:@"businessId"];
    [param setObject:[WTUtil strRelay:self.commentId] forKey:@"commentsId"];
    [QLMerchantNetWorkingUtil getPingJiaDetail:param successHandler:^(id json) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        self.commentsData = json[@"commentsData"];
        [self initForm];
    } failHandler:^(NSString *message) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [WTLoadFailView showFailInView:self.view retryPress:^{
            [self getData];
        }];
    }];
}

- (void)initForm {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];

    QLPingJiaHeadBannerItem *itBanner = [[QLPingJiaHeadBannerItem alloc] init];
    itBanner.datas = [NSArray arrayWithObjects:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453465&di=8d62405b2626eb79a8b3ca40ae5bbfe6&imgtype=0&src=http%3A%2F%2Fs16.sinaimg.cn%2Fmw690%2F006bYgeozy7pHERVUC3df%26690",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453464&di=0b41a9f182baf71c4993b63874cbe179&imgtype=0&src=http%3A%2F%2Fs9.sinaimg.cn%2Fmw690%2F006bYgeozy7pHERNHmg18%26690",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453462&di=b3aeda0529188a8aacddc751c6cd06b6&imgtype=0&src=http%3A%2F%2Fs11.sinaimg.cn%2Fmw690%2F006bYgeozy7pHES81p87a%26690", nil];
    [section0 addItem:itBanner];

    QLPingJiaDetailUserItem *itUser = [[QLPingJiaDetailUserItem alloc] init];
    itUser.info = self.commentsData;
    [section0 addItem:itUser];

    QLPingJiaMerchantItem *itMerchant = [[QLPingJiaMerchantItem alloc] init];
    itMerchant.info = self.commentsData;
    [section0 addItem:itMerchant];

    QLPingJiaScoreItem *itScore = [[QLPingJiaScoreItem alloc] init];
    itScore.scoreText = self.commentsData[@"score"];
    [section0 addItem:itScore];

//    QLPingJiaDescItem *itDesc = [[QLPingJiaDescItem alloc] init];
//    itDesc.descText = self.commentsData[@"comments"];
//    [section0 addItem:itDesc];
//
//    WTEmptyItem *itEmp = [WTEmptyItem initWithHeight:11];
//    itEmp.bgColor = [UIColor whiteColor];
//    [section0 addItem:itEmp];
//
//    [section0 addItem:[WTEmptyItem initWithHeight:8]];
//
//    QLPingJiaDianZanItem *itZan = [[QLPingJiaDianZanItem alloc] init];
//    itZan.count = self.commentsData[@"praiseNumber"];
//    [section0 addItem:itZan];
//
//    [section0 addItem:[WTEmptyItem initWithHeight:8]];
//
//    QLPingJiaDianZanItem *itHuiFuTitle = [[QLPingJiaDianZanItem alloc] init];
//    itHuiFuTitle.isHuiFuTitle = YES;
//    itHuiFuTitle.count = self.commentsData[@"replyNumber"];
//    itHuiFuTitle.cellHeight = 42;
//    [section0 addItem:itHuiFuTitle];
//
//    for (int i = 0; i < 5; i++) {
//        QLPingJiaHuiFuItem *itHuiFu = [[QLPingJiaHuiFuItem alloc] init];
//        [section0 addItem:itHuiFu];
//    }
    
//    [section0 addItem:[WTEmptyItem initWithHeight:8]];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
