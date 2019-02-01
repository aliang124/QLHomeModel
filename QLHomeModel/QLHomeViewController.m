//
//  QLHomeViewController.m
//  Project
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLHomeViewController.h"

@interface QLHomeViewController ()
@end

@implementation QLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.formManager[@"QLHomeBannerItem"] = @"QLHomeBannerCell";
    self.formManager[@"QLHomeCategoryItem"] = @"QLHomeCategoryCell";
    self.formManager[@"QLHomeHotTagItem"] = @"QLHomeHotTagCell";
    self.formManager[@"QLHomeMerchantListItem"] = @"QLHomeMerchantListCell";
    self.formManager[@"QLHomeTieZiItem"] = @"QLHomeTieZiCell";
    self.subjectArray = [[NSMutableArray alloc] init];
    self.bannerArray = [[NSMutableArray alloc] init];
    self.formTable.height = WTScreenHeight-WT_NavBar_Height-WT_TabBar_Height;
    self.navBar.leftItemList = [NSArray array];
    
    WT(weakSelf);
    WTCustomBarItem *itSearchBar = [[WTCustomBarItem alloc] init];
    itSearchBar.itemStyle = 1;
    itSearchBar.imgSize = CGSizeMake(32, 32);
    itSearchBar.onClick = ^{
        [weakSelf goSearchViewController];
    };
    itSearchBar.itemImage = [UIImage imageNamed:@"searchBar"];

    WTCustomBarItem *itMsgBar = [[WTCustomBarItem alloc] init];
    itMsgBar.itemStyle = 1;
    itMsgBar.imgSize = CGSizeMake(32, 32);
    itMsgBar.itemImage = [UIImage imageNamed:@"messageBar"];
    itMsgBar.onClick = ^{
        UIViewController *vc = [[CTMediator sharedInstance] performTarget:@"QLMineModel" action:@"messageVC" params:nil shouldCacheTarget:NO];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    self.navBar.rightItemList = [NSArray arrayWithObjects:itMsgBar,itSearchBar, nil];
    
    [WTLoadingView1 showLoadingInView:self.view top:WT_NavBar_Height];
    [self getHomeData];
    self.formTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getHomeData];
    }];
}

- (void)createAgeView {
    if (_ageView==nil) {
        _ageView = [[UIButton alloc] initWithFrame:CGRectMake(12,((WT_NavBar_Title_Height-36)/2)+WT_Height_StatusBar, 100, 36)];
        _ageView.layer.cornerRadius = 18;
        _ageView.layer.masksToBounds = YES;
        _ageView.backgroundColor = WTColorHex(0x947d00);
        [_ageView addTarget:self action:@selector(ageBtnPress) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_ageView];
        
        UIImageView *arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(73, 11, 16, 16)];
        [arrowImg setImage:[UIImage imageNamed:@"home_downArrow"]];
        [self.ageView addSubview:arrowImg];
        
        _ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 73, 16)];
        _ageLabel.font = WTFontSys(18);
        _ageLabel.textColor = WTColorHex(0x171714);
        _ageLabel.text = @"3~6岁";
        _ageLabel.textAlignment = NSTextAlignmentCenter;
        [self.ageView addSubview:_ageLabel];
    }
}

- (void)aaaa {
    WTCustomBarItem *itRight = [[WTCustomBarItem alloc] init];
    itRight.itemStyle = 0;
    itRight.itemTitle = @"登录";
    itRight.itemTextColor = QL_NavBar_TitleColor_Black;
    itRight.itemTextFont = [UIFont systemFontOfSize:16];
    itRight.onClick = ^{
        UIViewController *vc = [[CTMediator sharedInstance] performTarget:@"QLLoginModel" action:@"loginVC" params:nil shouldCacheTarget:NO];
        [self.navigationController presentViewController:[[UINavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
    };

}

- (void)getHomeData {
    [QLHomeNetWorkingUtil getHomeIndex:nil successHandler:^(id json) {
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [self.formTable.mj_header endRefreshing];
        self.ageArray = json[@"ageData"];
        self.categoryArray = json[@"categoryData"];
        self.businessArray = json[@"businessData"];
        //帖子数组
        [self.subjectArray removeAllObjects];
        id subjectData = json[@"subjectData"];
        if ([subjectData isKindOfClass:[NSDictionary class]]) {
            [self.subjectArray addObject:subjectData];
        } else if ([subjectData isKindOfClass:[NSArray class]]) {
            [self.subjectArray addObjectsFromArray:subjectData];
        }
        //顶部banner
        [self.bannerArray removeAllObjects];
        NSArray *bArray = json[@"bannerData"];
        if (bArray && bArray.count>0) {
            [self.bannerArray addObjectsFromArray:bArray];
        }
        [self initForm];
        [self createAgeView];
    } failHandler:^(NSString *message) {
        [self.formTable.mj_header endRefreshing];
        [WTLoadingView1 hideAllLoadingForView:self.view];
        [WTLoadFailView showFailInView:self.view top:WT_NavBar_Height retryPress:^{
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
    
    for (int i = 0; i < self.subjectArray.count; i++) {
        NSDictionary *dic = self.subjectArray[i];
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

- (void)goSearchViewController {
    QLSearchViewController *vc = [[QLSearchViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)ageBtnPress {
    NSMutableArray *ar = [NSMutableArray array];
    for (int i = 0; i < self.ageArray.count; i++) {
        [ar addObject:[WTUtil strRelay:self.ageArray[i][@"name"]]];
    }
    [YBPopupMenu showAtPoint:CGPointMake(self.ageView.centerX, self.ageView.bottom) titles:ar icons:nil menuWidth:110 otherSettings:^(YBPopupMenu *popupMenu) {
        popupMenu.delegate = self;
    }];
}

- (void)ybPopupMenu:(YBPopupMenu *)ybPopupMenu didSelectedAtIndex:(NSInteger)index {
    NSDictionary *dic = self.ageArray[index];
    self.ageLabel.text = [WTUtil strRelay:dic[@"name"]];
}
@end
