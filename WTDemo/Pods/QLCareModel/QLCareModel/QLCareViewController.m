//
//  QLCareViewController.m
//  Project
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLCareViewController.h"
#import "QLBusiness.h"
#import "QLCareListCell.h"
@interface QLCareViewController ()
@end

@implementation QLCareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.leftItemList = [NSArray array];
    [self setControllerTitle];
    
    _barView = [[QLCareBarView alloc] initWithFrame:CGRectMake(0, WT_NavBar_Height, WTScreenWidth, 44)];
    _barView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_barView];
    
    self.formTable.top = _barView.bottom;
    self.formTable.height = WTScreenHeight-_barView.bottom-WT_TabBar_Height;
    self.formManager[@"QLCareListItem"] = @"QLCareListCell";
    [self initForm];
}

- (void)setControllerTitle {
    self.navBar.title = @"关注";
}

- (void)initForm {
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    [section0 addItem:[WTEmptyItem initWithHeight:8]];

    for (int i = 0; i < 210; i++) {
        QLCareListItem *it = [[QLCareListItem alloc] init];
        [section0 addItem:it];
        
        [section0 addItem:[WTEmptyItem initWithHeight:8]];
    }
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];    
    [self.formTable reloadData];
}

@end
