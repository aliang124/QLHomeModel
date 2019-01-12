//
//  QLFeedBackViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/10.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLFeedBackViewController.h"

@interface QLFeedBackViewController ()

@end

@implementation QLFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"意见反馈";
    self.navBar.statusBarHeight = WT_Height_StatusBar;
    self.navBar.navBarTitleHeight = WT_NavBar_Title_Height;
    [self.navBar setNeedsLayout];
}
@end
