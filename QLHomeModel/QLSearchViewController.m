//
//  QLSearchViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/31.
//  Copyright © 2019年 计恩良. All rights reserved.
//
#define QLColorHexA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#import "QLSearchViewController.h"
#import "QLSearchView.h"
#import "QLSearchMerchantViewController.h"
#import "QLSearchTieZiViewController.h"
#import "QLSearchUserViewController.h"
@interface QLSearchViewController ()<WTTabPagerControllerDataSource,WTTabPagerControllerDelegate,UITextFieldDelegate>
@property (nonatomic, strong) NSArray *datas;
@property (nonatomic,strong) UITextField *searchTextField;
@property (nonatomic,strong) QLSearchView *searchView;
@end

@implementation QLSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WT(weakSelf);
    
    UIView *barBg = [[UIView alloc] initWithFrame:CGRectMake(50, ((WT_NavBar_Title_Height-32)/2)+WT_Height_StatusBar, WTScreenWidth-50-8, 32)];
    barBg.layer.cornerRadius = 2;
    barBg.layer.masksToBounds = YES;
    barBg.backgroundColor = QLColorHexA(0x947d00,0.2);
    [self.view addSubview:barBg];
    
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(11, 0, barBg.width-11-11, barBg.height)];
    _searchTextField.placeholder = @"输入搜素内容";
    _searchTextField.font = WTFontSys(14);
    _searchTextField.textColor = QL_UserName_TitleColor_Black;
    _searchTextField.text = @"餐厅";
    _searchTextField.delegate = self;
    [barBg addSubview:self.searchTextField];
    
    _searchView = [[QLSearchView alloc] initWithFrame:CGRectMake(0, WT_NavBar_Height, WTScreenWidth, WTScreenHeight-WT_NavBar_Height)];
    _searchView.hidden = YES;
    _searchView.backgroundColor = WT_Color_ViewBackGround;
    _searchView.selectionHandler = ^(NSString *keyText) {
        weakSelf.searchView.hidden = YES;
    };
    [self.view addSubview:_searchView];

    self.datas = [NSArray arrayWithObjects:@"商家",@"帖子",@"用户", nil];
    [self setTabBarView];
    [self reloadData];
    
    [_searchTextField becomeFirstResponder];
}

- (void)setTabBarView {
    self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.progressView.backgroundColor = QL_NavBar_BgColor_Yellow;
    self.tabBarHeight = 44;
    self.tabBar.layout.cellWidth = CGRectGetWidth(self.view.frame)/3;
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
        return [[QLSearchMerchantViewController alloc] init];
    }
    if (index==1) {
        return [[QLSearchTieZiViewController alloc] init];
    }
    if (index==2) {
        return [[QLSearchUserViewController alloc] init];
    }
    UIViewController *VC = [[UIViewController alloc]init];
    return VC;
}

- (NSString *)tabPagerController:(WTTabPagerController *)tabPagerController titleForIndex:(NSInteger)index {
    NSString *title = _datas[index];
    return title;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    _searchView.hidden = NO;
}


@end
