//
//  QLBabyRecordViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/10.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLBabyRecordViewController.h"
#import "QLMineChildInfoCell.h"

@interface QLBabyRecordViewController ()

@end

@implementation QLBabyRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBar.title = @"宝贝档案";
    self.formManager[@"QLMineChildInfoItem"] = @"QLMineChildInfoCell";
    [self initForm];
}

- (void)initForm {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    [section0 addItem:[WTEmptyItem initWithHeight:16]];

    QLMineChildInfoItem *itOne = [[QLMineChildInfoItem alloc] init];
    [section0 addItem:itOne];
    
    [section0 addItem:[WTEmptyItem initWithHeight:12]];

    QLMineChildInfoItem *itTwo = [[QLMineChildInfoItem alloc] init];
    [section0 addItem:itTwo];

    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}

@end
