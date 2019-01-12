//
//  QLWanShanViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/11/12.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLWanShanViewController.h"
#import "QLWanShanNextViewController.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "QLWanShanTitleCell.h"
#import "QLNickNameCell.h"
#import "QLSelectCheckCell.h"
#import "QLChildInfoCell.h"
#import "QLAddBabyCell.h"

@interface QLWanShanViewController ()
@end

@implementation QLWanShanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBar.bgColor = [UIColor whiteColor];
    self.formTable.frame = CGRectMake(0, 84+WT_Height_StatusBar-20, WTScreenWidth, WTScreenHeight-(84+WT_Height_StatusBar-20)-55);

    WTCustomBarItem *itRight = [[WTCustomBarItem alloc] init];
    itRight.itemStyle = 0;
    itRight.itemTitle = @"跳过";
    itRight.itemTextColor = QL_NavBar_TitleColor_Black;
    itRight.itemTextFont = [UIFont systemFontOfSize:16];
    itRight.onClick = ^{
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.navBar.rightItemList = [NSArray arrayWithObject:itRight];

    self.formManager[@"QLWanShanTitleItem"] = @"QLWanShanTitleCell";
    self.formManager[@"QLNickNameItem"] = @"QLNickNameCell";
    self.formManager[@"QLSelectCheckItem"] = @"QLSelectCheckCell";
    self.formManager[@"QLChildInfoItem"] = @"QLChildInfoCell";
    self.formManager[@"QLAddBabyItem"] = @"QLAddBabyCell";
    [self initForm];
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(8, WTScreenHeight-8-38, WTScreenWidth-8-8, 38)];
    if (iPhoneX) {
        nextBtn.top = WTScreenHeight-8-38-34;
    }
    [nextBtn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateNormal];
    nextBtn.titleLabel.font = WTFontSys(18);
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:WTColorHex(0xFF232A34) forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
}

- (void)initForm {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];

    QLWanShanTitleItem *itHead = [[QLWanShanTitleItem alloc] init];
    itHead.delegateController = self;
    [section0 addItem:itHead];
    
    [section0 addItem:[WTEmptyItem initWithHeight:28]];
    
    QLNickNameItem *itNickName = [[QLNickNameItem alloc] init];
    [section0 addItem:itNickName];
    
    [section0 addItem:[WTEmptyItem initWithHeight:12]];

    QLSelectCheckItem *itArea = [[QLSelectCheckItem alloc] init];
    itArea.leftText = @"所在地";
    itArea.rightText = @"请选择";
    [section0 addItem:itArea];
    
    [section0 addItem:[WTEmptyItem initWithHeight:12]];

    QLSelectCheckItem *itShenFen = [[QLSelectCheckItem alloc] init];
    itShenFen.leftText = @"当前身份";
    itShenFen.rightText = @"宝爸";
    [section0 addItem:itShenFen];

    QLChildInfoItem *info = [[QLChildInfoItem alloc] init];
    [section0 addItem:info];
    
    [section0 addItem:[WTEmptyItem initWithHeight:12]];

    QLAddBabyItem *itBaby = [[QLAddBabyItem alloc] init];
    [section0 addItem:itBaby];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}

- (void)nextBtnPress {
    QLWanShanNextViewController *next = [[QLWanShanNextViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}
@end
