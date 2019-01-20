//
//  QLHomeViewController.m
//  Project
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLHomeViewController.h"
#import "QLHomeBannerCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import <CTMediator.h>
#import "QLHomeNetWorkingUtil.h"
#import "QLHomeCategoryCell.h"

@interface QLHomeViewController ()
@property (nonatomic,copy) NSArray *categoryArray;
@property (nonatomic,copy) NSArray *ageArray;
@property (nonatomic,copy) NSArray *businessArray;
@end

@implementation QLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.formManager[@"QLHomeBannerItem"] = @"QLHomeBannerCell";
    self.formManager[@"QLHomeCategoryItem"] = @"QLHomeCategoryCell";
    self.navBar.leftItemList = [NSArray array];
    [self setControllerTitle];
    
    WTCustomBarItem *itRight = [[WTCustomBarItem alloc] init];
    itRight.itemStyle = 0;
    itRight.itemTitle = @"登录";
    itRight.itemTextColor = QL_NavBar_TitleColor_Black;
    itRight.itemTextFont = [UIFont systemFontOfSize:16];
    itRight.onClick = ^{
        UIViewController *vc = [[CTMediator sharedInstance] performTarget:@"QLLoginModel" action:@"loginVC" params:nil shouldCacheTarget:NO];
        [self.navigationController presentViewController:[[UINavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
    };
    self.navBar.rightItemList = [NSArray arrayWithObject:itRight];
    
    [self getHomeData];
}

- (void)getHomeData {
    [QLHomeNetWorkingUtil getHomeIndex:nil successHandler:^(id json) {
        self.ageArray = json[@"ageData"];
        self.categoryArray = json[@"categoryData"];
        self.businessArray = json[@"businessData"];
        [self initForm];
    } failHandler:^(NSString *message) {
    }];
}

- (void)setControllerTitle {
    self.navBar.title = @"首页";
}

- (void)initForm {
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    QLHomeBannerItem *it = [[QLHomeBannerItem alloc] init];
    it.datas = [NSArray arrayWithObjects:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453465&di=8d62405b2626eb79a8b3ca40ae5bbfe6&imgtype=0&src=http%3A%2F%2Fs16.sinaimg.cn%2Fmw690%2F006bYgeozy7pHERVUC3df%26690",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453464&di=0b41a9f182baf71c4993b63874cbe179&imgtype=0&src=http%3A%2F%2Fs9.sinaimg.cn%2Fmw690%2F006bYgeozy7pHERNHmg18%26690",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453462&di=b3aeda0529188a8aacddc751c6cd06b6&imgtype=0&src=http%3A%2F%2Fs11.sinaimg.cn%2Fmw690%2F006bYgeozy7pHES81p87a%26690", nil];
    [section0 addItem:it];
    
    QLHomeCategoryItem *itCategory = [[QLHomeCategoryItem alloc] init];
    itCategory.selectionHandler = ^(id item) {
        UIViewController *vc = [[CTMediator sharedInstance] performTarget:@"QLMerchantModel" action:@"merchantListVC" params:nil shouldCacheTarget:NO];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [section0 addItem:itCategory];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}
@end
