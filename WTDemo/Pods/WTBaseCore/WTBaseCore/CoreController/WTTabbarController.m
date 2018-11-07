//
//  WTViewController.h
//  WTBaseCore
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#import "WTTabbarController.h"
#import "WTDefine.h"
#import "WTCustomButton.h"
#import "UIView+Category.h"

@interface WTTabBarItem()
@end

@implementation WTTabBarItem
- (id)init {
    self = [super init];
    if (self) {
        self.titleText = @"";
        self.normalImage = @"";
        self.selectImage = @"";
        self.textSelectColor = [UIColor blueColor];
        self.textNormaltColor = [UIColor blackColor];
    }
    return self;
}
@end

@interface WTTabbarController ()
{
    UIButton *_lastButton;
}
@end

@implementation WTTabbarController
- (id)init
{
    self = [super init];
    if (self) {
        [self.tabBar setHidden:YES];//将原来的UITabBarController中的UITabBar隐藏起来；
        self.currentIndex = 0;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.tabBarView==nil) {
        [self _initTabbarView];
    }
}

//创建自定义tabBar
- (void)_initTabbarView {
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, WTScreenHeight - WT_TabBar_Height, WTScreenWidth, WT_TabBar_Height)];
    _tabBarView.tag = 1111;
    _tabBarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tabBarView];
    
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    
    float width = WTScreenWidth/self.itemsArray.count;
    for (int i = 0; i < self.itemsArray.count; i++) {
        WTTabBarItem *item = self.itemsArray[i];
        [controllers addObject:item.vc];
        
        WTCustomButton *button = [WTCustomButton buttonWithType:UIButtonTypeCustom withSpace:4];
        button.frame = CGRectMake(i * width, 0, width, WT_TabBar_Height);
        button.tag = 100+i;
        button.buttonStyle = WTCustomButtonImageTop;
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitle:item.titleText forState:UIControlStateNormal];
        [button setTitleColor:item.textNormaltColor forState:UIControlStateNormal];
        [button setTitleColor:item.textSelectColor forState:UIControlStateHighlighted];
        [button setTitleColor:item.textSelectColor forState:UIControlStateSelected];
        [button setImage:[UIImage imageNamed:item.normalImage] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:item.selectImage] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:item.selectImage] forState:UIControlStateSelected];
        if (self.currentIndex==i) {
            button.selected = YES;
            self.selectedIndex = self.currentIndex;
            _lastButton = button;
        }
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarView addSubview:button];
    }
    self.viewControllers = controllers;
    
    UIImageView *linee = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WTScreenWidth, WT_Line_Height)];
    linee.backgroundColor = WT_Color_Line;
    [_tabBarView addSubview:linee];
}

//点击按钮后显示哪个控制器界面
- (void)selectedTab:(UIButton *)button {
    if (_lastButton!=nil&&![_lastButton isKindOfClass:[NSNull class]]) {
        _lastButton.selected = NO;
    }
    button.selected = YES;
    self.selectedIndex = button.tag-100;
    _lastButton = button;
}

- (void)setTabIndex:(int)idx {
    UIButton *btn = (UIButton *)[_tabBarView viewWithTag:100+idx];
    if (btn&&[btn isKindOfClass:[UIButton class]]) {
        [self selectedTab:btn];
    }
}

@end
