//
//  QLPingJiaViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLPingJiaViewController.h"
#import "QLMerchantNetWorkingUtil.h"
#import "QLPingJiaHeadView.h"

@interface QLPingJiaViewController ()
@property (nonatomic,copy) NSDictionary *businessInfo;
@end

@implementation QLPingJiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"评价";    
    [self initForm];
}

- (void)getData {
//    [WTLoadingView1 showLoadingInView:self.view];
//    [QLMerchantNetWorkingUtil getBusinessDetail:self.businessId successHandler:^(id json) {
//        [WTLoadingView1 hideAllLoadingForView:self.view];
//        self.businessInfo = json[@"businessInfo"][0];
//        [self initForm];
//    } failHandler:^(NSString *message) {
//        [WTLoadingView1 hideAllLoadingForView:self.view];
//        [WTLoadFailView showFailInView:self.view retryPress:^{
//            [self getData];
//        }];
//    }];
}

- (void)initForm {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];


    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
