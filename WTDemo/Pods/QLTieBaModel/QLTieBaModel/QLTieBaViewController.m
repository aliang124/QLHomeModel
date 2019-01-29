//
//  QLTieBaViewController.m
//  Project
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLTieBaViewController.h"
#import "QLSubTieBaViewController.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "QLTieBaNetWork.h"

@interface QLTieBaViewController ()<WTTabPagerControllerDataSource,WTTabPagerControllerDelegate>
@property (nonatomic, strong) NSMutableArray *catogeryList;
@end

@implementation QLTieBaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.leftItemList = [NSArray array];
    _catogeryList = [[NSMutableArray alloc] init];
    [self setControllerTitle];
    WT(bself);
    
    WTCustomBarItem *searchIt = [[WTCustomBarItem alloc] init];
    searchIt.itemStyle = 1;
    searchIt.itemImage = [UIImage imageNamed:@"sousu"];
    searchIt.imgSize = CGSizeMake(23, 23);
    searchIt.onClick = ^(void) {
    };
    
    WTCustomBarItem *msgIt = [[WTCustomBarItem alloc] init];
    msgIt.itemStyle = 1;
    msgIt.itemImage = [UIImage imageNamed:@"xiaoxi"];
    msgIt.imgSize = CGSizeMake(23, 23);
    msgIt.onClick = ^(void) {
    };
    self.navBar.rightItemList = [NSArray arrayWithObjects:msgIt,searchIt, nil];
    [self.navBar setNeedsLayout];
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@"1000" forKey:@"pageSize"];
    [param setObject:@"1" forKey:@"page"];
    [QLTieBaNetWork getTieBaCatogery:nil successHandler:^(id json) {
        NSArray *ar = json[@"plateData"];
        if (ar && ar.count>0) {
            [bself.catogeryList addObjectsFromArray:ar];
        }
        [bself setTabBarView];
        [bself reloadData];
    } failHandler:^(NSString *message) {
        NSLog(@"bbbb");
    }];
}

- (void)setControllerTitle {
    self.navBar.title = @"浪吧";
}

- (void)setTabBarView {
    self.tabBar.backgroundColor = QL_NavBar_BgColor_Yellow;
    self.tabBar.progressView.backgroundColor = QL_NavBar_CursorColor_Black;
    self.tabBarHeight = 32;
    self.tabBar.layout.normalTextFont = [UIFont systemFontOfSize:14];
    self.tabBar.layout.selectedTextFont = [UIFont boldSystemFontOfSize:16];
    self.tabBar.layout.selectedTextColor = QL_NavBar_TitleColor_Black;
    self.tabBarOrignY = self.navBar.statusBarHeight + self.navBar.navBarTitleHeight;
    self.tabBar.layout.barStyle = WTPagerBarStyleProgressView;
    self.tabBar.layout.cellSpacing = 0;
    self.tabBar.layout.cellEdging = 0;
    self.tabBar.layout.adjustContentCellsCenter = YES;
    self.dataSource = self;
    self.delegate = self;
    self.pagerController.view.frame = CGRectMake(0, 0, WTScreenWidth, WTScreenHeight - self.tabBarOrignY - self.tabBarHeight - WT_TabBar_Height);
}

#pragma mark - WTTabPagerControllerDataSource
- (NSInteger)numberOfControllersInTabPagerController {
    return self.catogeryList.count;
}

- (UIViewController *)tabPagerController:(WTTabPagerController *)tabPagerController controllerForIndex:(NSInteger)index prefetching:(BOOL)prefetching {
    QLSubTieBaViewController *vc = [[QLSubTieBaViewController alloc]init];
    vc.catogeryInfo = self.catogeryList[index];
    return vc;
}

- (NSString *)tabPagerController:(WTTabPagerController *)tabPagerController titleForIndex:(NSInteger)index {
    NSString *title = [WTUtil strRelay:self.catogeryList[index][@"name"]];
    return title;
}

@end
