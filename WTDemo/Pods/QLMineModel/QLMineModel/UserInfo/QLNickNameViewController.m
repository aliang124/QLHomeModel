//
//  QLNickNameViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLNickNameViewController.h"
#import "QLModifyNickCell.h"
#import "QLMineNetWork.h"
@interface QLNickNameViewController ()
@property (nonatomic,strong) QLModifyNickItem *itName;
@end

@implementation QLNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"修改昵称";
    self.formManager[@"QLModifyNickItem"] = @"QLModifyNickCell";
    
    WTCustomBarItem *itRight = [[WTCustomBarItem alloc] init];
    itRight.itemStyle = 0;
    itRight.itemTitle = @"保存";
    itRight.itemTextColor = QL_NavBar_TitleColor_Black;
    itRight.itemTextFont = [UIFont systemFontOfSize:16];
    itRight.onClick = ^{
        [self saveNick];
    };
    self.navBar.rightItemList = [NSArray arrayWithObject:itRight];
    
    [self initForm];
}

- (void)initForm {
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    _itName = [[QLModifyNickItem alloc] init];
    _itName.nickName = self.nickName;
    [section0 addItem:_itName];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}

- (void)saveNick {
    [self.view endEditing:YES];
    if ([WTUtil strNilOrEmpty:self.itName.nickName]) {
        [WTToast makeText:@"请输入昵称"];
        return;
    }
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:self.itName.nickName forKey:@"nickName"];
    [self updateUserInfo:param];
}

- (void)updateUserInfo:(NSDictionary *)info {
    WT(weakSelf);
    [QLMBProgressHUDUtil showActivityMessageInWindow:@"正在加载"];
    [QLMineNetWork updateUserInfo:info successHandler:^(id json) {
        [QLMBProgressHUDUtil hideHUD];
        [WTToast makeText:@"更新成功"];
        WTPostNotification(@"UpdateUserInfoSuccess", nil);
        [weakSelf.navigationController popViewControllerAnimated:YES];
    } failHandler:^(NSString *message) {
        [QLMBProgressHUDUtil hideHUD];
        [WTToast makeText:message];
    }];
}
@end
