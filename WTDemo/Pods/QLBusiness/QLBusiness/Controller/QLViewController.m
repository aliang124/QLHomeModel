//
//  WTViewController.h
//  WTBaseCore
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#import "QLViewController.h"
#import "QLDefine.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "WTCustomBarItem.h"
#import "WTDefine.h"

@interface QLViewController ()

@end

@implementation QLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.statusBarHeight = WT_Height_StatusBar;
    self.navBar.navBarTitleHeight = WT_NavBar_Title_Height;
    [self.navBar setNeedsLayout];
}
@end
