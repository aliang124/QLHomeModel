//
//  QLABoutViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/10.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLABoutViewController.h"

@interface QLABoutViewController ()

@end

@implementation QLABoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"关于我们";
    self.navBar.statusBarHeight = WT_Height_StatusBar;
    self.navBar.navBarTitleHeight = WT_NavBar_Title_Height;
    [self.navBar setNeedsLayout];
}
@end
