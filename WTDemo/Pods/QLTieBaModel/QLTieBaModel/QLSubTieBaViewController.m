//
//  QLSubTieBaViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/6.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLSubTieBaViewController.h"
#import "QLTieBaCell.h"
#import "QLTieBaDetailViewController.h"

@implementation QLSubTieBaViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.hidden = YES;
    self.formManager[@"QLTieBaItem"] = @"QLTieBaCell";
    self.formTable.top = 0;
    self.formTable.height = WTScreenHeight-WT_NavBar_Height-32-WT_TabBar_Height;
    [self initForm];
}

- (void)initForm {
    WT(weakSelf);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    for (int i = 0; i < 10; i++) {
        WTEmptyItem *itE = [[WTEmptyItem alloc] init];
        itE.cellHeight = 8;
        itE.bgColor = WT_Color_ViewBackGround;
        [section0 addItem:itE];
        
        QLTieBaItem *it = [[QLTieBaItem alloc] init];
        it.selectionHandler = ^(id item) {
            QLTieBaDetailViewController *detail = [[QLTieBaDetailViewController alloc] init];
            [weakSelf.navigationController pushViewController:detail animated:YES];
        };
        [section0 addItem:it];
    }
    WTEmptyItem *itE = [[WTEmptyItem alloc] init];
    itE.cellHeight = 8;
    itE.bgColor = WT_Color_ViewBackGround;
    [section0 addItem:itE];

    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}

@end
