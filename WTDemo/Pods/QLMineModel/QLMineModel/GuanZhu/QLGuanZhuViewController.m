//
//  QLGuanZhuViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLGuanZhuViewController.h"

@interface QLGuanZhuViewController ()<WTTabPagerControllerDataSource,WTTabPagerControllerDelegate>
@property (nonatomic, strong) NSArray *datas;
@end

@implementation QLGuanZhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = [NSArray arrayWithObjects:@"商家",@"帖子",@"用户", nil];
    [self setControllerTitle];
    [self setTabBarView];
    [self reloadData];
}

- (void)setControllerTitle {
    self.navBar.title = @"我的关注";
}

- (void)setTabBarView {
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.progressView.backgroundColor = QL_NavBar_BgColor_Yellow;
    self.tabBarHeight = 44;
    self.tabBar.layout.cellWidth = CGRectGetWidth(self.view.frame)/4;
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
    self.pagerController.view.frame = CGRectMake(0, 0, WTScreenWidth, WTScreenHeight - self.tabBarOrignY - self.tabBarHeight);
}

#pragma mark - WTTabPagerControllerDataSource
- (NSInteger)numberOfControllersInTabPagerController {
    return _datas.count;
}

- (UIViewController *)tabPagerController:(WTTabPagerController *)tabPagerController controllerForIndex:(NSInteger)index prefetching:(BOOL)prefetching {
    if (index==0) {
    }
    if (index==1) {
    }
    if (index==2) {
    }
    UIViewController *VC = [[UIViewController alloc]init];
    return VC;
}

- (NSString *)tabPagerController:(WTTabPagerController *)tabPagerController titleForIndex:(NSInteger)index {
    NSString *title = _datas[index];
    return title;
}

@end
