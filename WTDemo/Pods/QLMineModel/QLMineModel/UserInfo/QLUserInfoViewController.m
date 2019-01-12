//
//  QLUserInfoViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLUserInfoViewController.h"
#import "QLNickNameViewController.h"
#import "QLUserInfoCell.h"
#import "QLUserIconCel.h"
#import "QLMineNetWork.h"
#import "CZHAddressPickerView.h"
#import "AddressPickerHeader.h"

@interface QLUserInfoViewController ()
@property (nonatomic,copy) NSDictionary *accountInfo;
@end

@implementation QLUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBar.title = @"个人资料";
    self.formManager[@"QLUserInfoItem"] = @"QLUserInfoCell";
    self.formManager[@"QLUserIconItem"] = @"QLUserIconCel";
    
    WTCustomBarItem *itRight = [[WTCustomBarItem alloc] init];
    itRight.itemStyle = 0;
    itRight.itemTitle = @"个人主页";
    itRight.itemTextColor = QL_NavBar_TitleColor_Black;
    itRight.itemTextFont = [UIFont systemFontOfSize:14];
    itRight.onClick = ^{
    };
    self.navBar.rightItemList = [NSArray arrayWithObject:itRight];
    
    WTAddNotification(@"UpdateUserInfoSuccess", @selector(UpdateUserInfoSuccess));
    [self getData];
}

- (void)getData {
    [QLMineNetWork getAccountMemberInfo:^(id json) {
        self.accountInfo = json;
        [self initForm];
    } failHandler:^(NSString *message) {
        [WTToast makeText:message];
    }];
}

- (void)UpdateUserInfoSuccess {
    [self getData];
}

- (void)initForm {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    [section0 addItem:[WTEmptyItem initWithHeight:16]];

    QLUserIconItem *itIcon = [[QLUserIconItem alloc] init];
    itIcon.leftText = @"账号头像";
    itIcon.iconUrl = [WTUtil strRelay:self.accountInfo[@"image"]];
    itIcon.weakController = self;
    [section0 addItem:itIcon];
    
    [section0 addItem:[WTEmptyItem initWithHeight:12]];

    QLUserInfoItem *itNick = [[QLUserInfoItem alloc] init];
    itNick.leftText = @"你的昵称";
    itNick.rightText = [WTUtil strRelay:self.accountInfo[@"nickName"]];
    itNick.btnPressHandler = ^(QLUserInfoItem *item) {
        QLNickNameViewController *vc = [[QLNickNameViewController alloc] init];
        vc.nickName = item.rightText;
        [bself.navigationController pushViewController:vc animated:YES];
    };
    [section0 addItem:itNick];
    
    [section0 addItem:[WTEmptyItem initWithHeight:12]];

    QLUserInfoItem *itAddress = [[QLUserInfoItem alloc] init];
    itAddress.leftText = @"所在地";
    if (![WTUtil strNilOrEmpty:self.accountInfo[@"province"]] &&
        ![WTUtil strNilOrEmpty:self.accountInfo[@"city"]]) {
        itAddress.rightText = [NSString stringWithFormat:@"%@-%@",[WTUtil strRelay:self.accountInfo[@"province"]],[WTUtil strRelay:self.accountInfo[@"city"]]];
    }
    itAddress.btnPressHandler = ^(QLUserInfoItem *item) {
        [bself checkAddress:item];
    };
    [section0 addItem:itAddress];

    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}

- (void)checkAddress:(QLUserInfoItem *)item {
    NSString *address = item.rightText;
    NSString *defaultProvince = @"";
    NSString *defaultCity = @"";
    if (![WTUtil strNilOrEmpty:address] && [address containsString:@"-"]) {
        NSArray *ar = [address componentsSeparatedByString:@"-"];
        if (ar.count==2) {
            defaultProvince = ar[0];
            defaultCity = ar[1];
        }
    }
    [CZHAddressPickerView cityPickerViewWithProvince:defaultProvince city:defaultCity cityBlock:^(NSString *province, NSString *city) {
        item.rightText = [NSString stringWithFormat:@"%@-%@",province,city];
        [item reloadRowWithAnimation:UITableViewRowAnimationNone];
        
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        [param setObject:province forKey:@"province"];
        [param setObject:city forKey:@"city"];
        [self updateUserInfo:param];
    }];
}

- (void)updateUserInfo:(NSDictionary *)info {
    [QLMBProgressHUDUtil showActivityMessageInWindow:@"正在加载"];
    [QLMineNetWork updateUserInfo:info successHandler:^(id json) {
        [QLMBProgressHUDUtil hideHUD];
        [WTToast makeText:@"更新成功"];
        WTPostNotification(@"UpdateUserInfoSuccess", nil);
    } failHandler:^(NSString *message) {
        [QLMBProgressHUDUtil hideHUD];
        [WTToast makeText:message];
    }];
}
@end
