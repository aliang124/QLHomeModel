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

    WTEmptyItem *itE1 = [[WTEmptyItem alloc] init];
    itE1.cellHeight = 8;
    itE1.bgColor = WT_Color_ViewBackGround;
    [section0 addItem:itE1];

    for (int i = 0; i < 210; i++) {
        QLCareListItem *it = [[QLCareListItem alloc] init];
        [section0 addItem:it];
        
        WTEmptyItem *itE = [[WTEmptyItem alloc] init];
        itE.cellHeight = 8;
        itE.bgColor = WT_Color_ViewBackGround;
        [section0 addItem:itE];
    }
    
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}

@end
