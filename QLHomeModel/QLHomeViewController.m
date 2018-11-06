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
    self.navBar.leftItemList = [NSArray array];
}

- (void)setControllerTitle {
    self.navBar.title = @"首页";
}
@end
