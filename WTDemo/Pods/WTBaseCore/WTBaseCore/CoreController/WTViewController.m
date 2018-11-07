//
//  WTViewController.h
//  WTBaseCore
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#import "WTViewController.h"
#import "WTDefine.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "NSBundle+WTBaseCore.h"

@interface WTViewController ()

@end

@implementation WTViewController
@synthesize navBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.fd_prefersNavigationBarHidden = YES;
    
     self.view.backgroundColor = WT_Color_ViewBackGround;
     if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]){
          self.automaticallyAdjustsScrollViewInsets = NO;
     }
    
    WT(bself);
    //创建导航栏
    navBar = [[WTNavBar alloc] init];
    [self.view addSubview:navBar];
    //返回按钮
    WTBarItem *item = [[WTBarItem alloc] init];
    item.itemStyle = 1;
    item.itemImage = [NSBundle getImageFromBoundle:@"back"];
    item.imgSize = CGSizeMake(30, 30);
    item.onClick = ^(void) {
        [bself backBtnPress];
    };
    navBar.leftItemList = [NSArray arrayWithObject:item];
    [navBar setNeedsLayout];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.fd_prefersNavigationBarHidden = YES;
}

- (void)backBtnPress {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
     WTRemoveAllNotification();
}

@end
