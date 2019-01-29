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
#import "QLHomeHotTagCell.h"
#import "QLHomeMerchantListCell.h"
#import "QLHomeTieZiCell.h"
#import "WTLoadFailEmpty.h"

@interface QLHomeViewController ()
@property (nonatomic,copy) NSArray *categoryArray;
@property (nonatomic,copy) NSArray *ageArray;
@property (nonatomic,copy) NSArray *businessArray;
@property (nonatomic,strong) NSMutableArray *articleArray;
@property (nonatomic,strong) NSMutableArray *bannerArray;
@end

@implementation QLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.formManager[@"QLHomeBannerItem"] = @"QLHomeBannerCell";
    self.formManager[@"QLHomeCategoryItem"] = @"QLHomeCategoryCell";
    self.formManager[@"QLHomeHotTagItem"] = @"QLHomeHotTagCell";
    self.formManager[@"QLHomeMerchantListItem"] = @"QLHomeMerchantListCell";
    self.formManager[@"QLHomeTieZiItem"] = @"QLHomeTieZiCell";
    self.articleArray = [[NSMutableArray alloc] init];
    self.bannerArray = [[NSMutableArray alloc] init];
    self.formTable.height = WTScreenHeight-WT_NavBar_Height-WT_TabBar_Height;
    self.navBar.leftItemList = [NSArray array];
    self.navBar.title = @"首页";

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
    [WTLoadingView1 showLoadingInView:self.view top:WT_NavBar_Height];
    [QLHomeNetWorkingUtil getHomeIndex:nil successHandler:^(id json) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        self.ageArray = json[@"ageData"];
        self.categoryArray = json[@"categoryData"];
        self.businessArray = json[@"businessData"];
        id articleData = json[@"articleData"];
        if ([articleData isKindOfClass:[NSDictionary class]]) {
            [self.articleArray addObject:articleData];
        } else if ([articleData isKindOfClass:[NSArray class]]) {
            [self.articleArray addObjectsFromArray:articleData];
        }
        
        [self.bannerArray removeAllObjects];
        NSArray *bArray = json[@"bannerData"];
        if (bArray && bArray.count>0) {
            [self.bannerArray addObjectsFromArray:bArray];
        }
        [self initForm];
    } failHandler:^(NSString *message) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [WTLoadFailView showFailInView:self.view retryPress:^{
            [self getHomeData];
        }];
    }];
}

- (void)initForm {
    WT(weakSelf);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    QLHomeBannerItem *it = [[QLHomeBannerItem alloc] init];
    it.datas = self.bannerArray;
    [section0 addItem:it];
    QLHomeCategoryItem *itCategory = [[QLHomeCategoryItem alloc] init];
    itCategory.datas = self.categoryArray;
    itCategory.iconPressHandler = ^(id info) {
        UIViewController *vc = [[CTMediator sharedInstance] performTarget:@"QLMerchantModel" action:@"merchantListVC" params:nil shouldCacheTarget:NO];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    [section0 addItem:itCategory];
        
    [section0 addItem:[WTEmptyItem initWithHeight:12]];
    
    [section0 addItem:[[QLHomeHotTagItem alloc] init]];
    
    for (int i = 0; i < self.businessArray.count; i++) {
        NSDictionary *dict = self.businessArray[i];
        QLHomeMerchantListItem *itMerchant = [[QLHomeMerchantListItem alloc] init];
        itMerchant.info = dict;
        itMerchant.selectionHandler = ^(QLHomeMerchantListItem *item) {
            UIViewController *vc = [[CTMediator sharedInstance] performTarget:@"QLMerchantModel" action:@"merchantDetailVC" params:item.info shouldCacheTarget:NO];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        [section0 addItem:itMerchant];
    }
    
    for (int i = 0; i < self.articleArray.count; i++) {
        NSDictionary *dic = self.articleArray[i];
        QLHomeTieZiItem *itTie = [[QLHomeTieZiItem alloc] init];
        itTie.userInfo = dic;
        itTie.selectionHandler = ^(QLHomeTieZiItem *item) {
            UIViewController *vc = [[CTMediator sharedInstance] performTarget:@"QLTieBaModel" action:@"tieBaDetailVC" params:item.userInfo shouldCacheTarget:NO];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        [section0 addItem:itTie];
    }
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}
@end
