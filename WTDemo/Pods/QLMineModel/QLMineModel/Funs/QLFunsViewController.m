//
//  QLFunsViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLFunsViewController.h"
#import "QLFunsCell.h"
#import "QLMineNetWork.h"
#import "WTLoadFailEmpty.h"

@implementation QLFunsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBar.title = @"粉丝";
    self.formManager[@"QLFunsItem"] = @"QLFunsCell";
    
    [WTLoadingView1 showLoadingInView:self.view];
    [self getFunsData];
}

- (void)getFunsData {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"1" forKey:@"page"];
    [dic setObject:@"10" forKey:@"count"];
    [QLMineNetWork getFlowerFuns:nil successHandler:^(id json) {
        NSLog(@"aaaaaa");
        [WTEmptyView showEmptyInView:self.view image:[UIImage imageNamed:@"emptyImage"]];
        [self initForm];
    } failHandler:^(NSString *message) {
        [WTLoadFailView showFailInView:self.view retryPress:^{
            [WTLoadingView1 showLoadingInView:self.view];
            [self getFunsData];
        }];
    }];
}

- (void)initForm {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    for (int i = 0; i < 10; i++) {
        QLFunsItem *itFuns = [[QLFunsItem alloc] init];
        [section0 addItem:itFuns];
    }
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}

@end
