//
//  QLSettingViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/10.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLSettingViewController.h"
#import "QLSettingTitleCell.h"
#import "QLSettingGroupCell.h"
#import "QLSettingGroupCell1.h"
#import "QLModifyPasswordViewController.h"
@interface QLSettingViewController ()

@end

@implementation QLSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBar.title = @"设置";
    self.formManager[@"QLSettingTitleItem"] = @"QLSettingTitleCell";
    self.formManager[@"QLSettingGroupItem"] = @"QLSettingGroupCell";
    self.formManager[@"QLSettingGroupItem1"] = @"QLSettingGroupCell1";
    self.formManager[@"QLSettingButtonItem"] = @"QLSettingButtonCell";
    
    [self initForm];
}

- (void)initForm {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    QLSettingTitleItem *itTitle1 = [[QLSettingTitleItem alloc] init];
    itTitle1.titleText = @"账号安全";
    [section0 addItem:itTitle1];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"手机号" forKey:@"leftTitle"];
    [dic setObject:@"13478968900" forKey:@"rightTitle"];
    [dic setObject:@"1" forKey:@"ButtonType"];

    NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
    [dic1 setObject:@"修改密码" forKey:@"leftTitle"];
    [dic1 setObject:@"修改" forKey:@"rightTitle"];
    [dic1 setObject:@"2" forKey:@"ButtonType"];

    QLSettingGroupItem *itGroup1 = [[QLSettingGroupItem alloc] init];
    itGroup1.dataArray = [NSArray arrayWithObjects:dic,dic1, nil];
    itGroup1.btnPress = ^(int i) {
        if (i==1) {
            QLModifyPasswordViewController *pass = [[QLModifyPasswordViewController alloc] init];
            [bself.navigationController pushViewController:pass animated:YES];
        }
    };
    [section0 addItem:itGroup1];
    
    //第三方绑定
    QLSettingTitleItem *itTitle2 = [[QLSettingTitleItem alloc] init];
    itTitle2.titleText = @"第三方绑定";
    [section0 addItem:itTitle2];

    NSMutableDictionary *dic3 = [NSMutableDictionary dictionary];
    [dic3 setObject:@"微信" forKey:@"leftTitle"];
    [dic3 setObject:@"未绑定" forKey:@"rightTitle"];
    [dic3 setObject:@"weixin" forKey:@"IconImage"];
    [dic3 setObject:@"3" forKey:@"ButtonType"];
    
    NSMutableDictionary *dic4 = [NSMutableDictionary dictionary];
    [dic4 setObject:@"QQ" forKey:@"leftTitle"];
    [dic4 setObject:@"已绑定" forKey:@"rightTitle"];
    [dic4 setObject:@"QQ" forKey:@"IconImage"];
    [dic4 setObject:@"3" forKey:@"ButtonType"];

    NSMutableDictionary *dic5 = [NSMutableDictionary dictionary];
    [dic5 setObject:@"微博" forKey:@"leftTitle"];
    [dic5 setObject:@"未绑定" forKey:@"rightTitle"];
    [dic5 setObject:@"weibo" forKey:@"IconImage"];
    [dic5 setObject:@"4" forKey:@"ButtonType"];

    QLSettingGroupItem *itGroup2 = [[QLSettingGroupItem alloc] init];
    itGroup2.dataArray = [NSArray arrayWithObjects:dic3,dic4,dic5, nil];
    [section0 addItem:itGroup2];

    //消息
    QLSettingTitleItem *itTitle3 = [[QLSettingTitleItem alloc] init];
    itTitle3.titleText = @"消息";
    [section0 addItem:itTitle3];

    NSMutableDictionary *dic6 = [NSMutableDictionary dictionary];
    [dic6 setObject:@"系统消息" forKey:@"leftTitle"];
    [dic6 setObject:@"平台活动 / 系统通知" forKey:@"rightTitle"];
    [dic6 setObject:@"1" forKey:@"hasChecked"];
    
    NSMutableDictionary *dic7 = [NSMutableDictionary dictionary];
    [dic7 setObject:@"用户消息" forKey:@"leftTitle"];
    [dic7 setObject:@"用户回帖 / 评价回复 / 私信" forKey:@"rightTitle"];
    [dic7 setObject:@"0" forKey:@"hasChecked"];

    QLSettingGroupItem1 *itGroup3 = [[QLSettingGroupItem1 alloc] init];
    itGroup3.dataArray = [NSArray arrayWithObjects:dic6,dic7, nil];
    [section0 addItem:itGroup3];

    [section0 addItem:[WTEmptyItem initWithHeight:16]];
    
    QLSettingButtonItem *itBtn = [[QLSettingButtonItem alloc] init];
    itBtn.titleText = @"退出登录";
    [section0 addItem:itBtn];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
}
@end
