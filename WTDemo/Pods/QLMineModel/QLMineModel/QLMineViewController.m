//
//  QLMineViewController.m
//  Project
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLMineViewController.h"
#import "QLMineHeadCell.h"
#import "WTIconTextCell.h"
#import "QLBusiness.h"
#import "QLABoutViewController.h"
#import "QLFeedBackViewController.h"
#import "QLSettingViewController.h"
#import "QLBabyRecordViewController.h"
#import "QLUserInfoViewController.h"
#import "QLMessageViewController.h"
#import "QLGuanZhuViewController.h"
#import "QLFunsViewController.h"
#import "QLMineNetWork.h"
#import "UIImageView+WebImage.h"

@interface QLMineViewController ()
{
    UILabel *userNameLab;
    UILabel *tipTextLab;
    UIImageView *iconImg;
}
@property (nonatomic,copy) NSDictionary *accountCenterInfo;
@end

@implementation QLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.formManager[@"QLMineHeadItem"] = @"QLMineHeadCell";
    self.formManager[@"WTIconTextItem"] = @"WTIconTextCell";
    self.navBar.hidden = YES;
    
    float iXStatus = 0;
    if (iPhoneX) {
        iXStatus = 24;
    }
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WTScreenWidth, 148+24+iXStatus)];
    [bgView setImage:[UIImage imageNamed:@"mineBg"]];
    [self.view addSubview:bgView];
    //用户名
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(21, 24+35+iXStatus, WTScreenWidth-21-82, 19)];
    userNameLab.font = WTFontSys(20);
    userNameLab.text = [QLLoginInfo sharedInstance].username;
    userNameLab.textColor = QL_NavBar_TitleColor_Black;
    [self.view addSubview:userNameLab];
    ///头像
    iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(WTScreenWidth-82, 30+24+iXStatus, 60, 60)];
    iconImg.layer.borderColor = [UIColor whiteColor].CGColor;
    iconImg.layer.borderWidth = 2;
    iconImg.layer.masksToBounds = YES;
    [self.view addSubview:iconImg];
    //说明
    tipTextLab = [[UILabel alloc] initWithFrame:CGRectMake(21, userNameLab.bottom+18, 10, 9)];
    tipTextLab.font = WTFontSys(10);
    tipTextLab.text = @"查看或编辑个人主页";
    tipTextLab.textColor = QL_NavBar_TitleColor_Black;
    [self.view addSubview:tipTextLab];
    [tipTextLab sizeToFit];
    
    UIImageView *arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(tipTextLab.right+11, tipTextLab.top, 6, 9)];
    [arrowImg setImage:[UIImage imageNamed:@"mineArrow"]];
    [self.view addSubview:arrowImg];
    
    UIButton *userInfoBtn = [[UIButton alloc] initWithFrame:CGRectMake(userNameLab.left, userNameLab.top, arrowImg.right-userNameLab.left, 50)];
    [userInfoBtn addTarget:self action:@selector(editUserInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:userInfoBtn];
    
    //工具栏
    UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(16, 24+108+iXStatus, WTScreenWidth-16-16, 80)];
    barView.layer.cornerRadius = 3;
    barView.layer.masksToBounds = YES;
    barView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:barView];
    for (int i = 0; i < 3; i++) {
        [self createItem:i barView:barView];
    }
    //下面tableview
    self.formTable.top = 228+iXStatus;
    self.formTable.height = WTScreenHeight-WT_TabBar_Height-228-iXStatus;
    self.formTable.scrollEnabled = NO;
    [self initForm];
    [self getAccountInfo];
    WTAddNotification(@"UpdateUserInfoSuccess", @selector(getAccountInfo));
    WTAddNotification(QL_LoginSuccess_CompletionHandler, @selector(getAccountInfo));
    
}

- (void)getAccountInfo {
    [QLMineNetWork getAccountCenterInfo:^(id json) {
        self.accountCenterInfo = json;
        [self updateInfo];
    } failHandler:^(NSString *message) {
        [WTToast makeText:message];
    }];
}

- (void)updateInfo {
    userNameLab.text = [WTUtil strRelay:self.accountCenterInfo[@"nickName"]];
    [iconImg setWebImageWithUrl:[WTUtil strRelay:self.accountCenterInfo[@"image"]] placeHolder:nil];
}

- (void)createItem:(int)idx barView:(UIView *)barView {
    UIButton *guanBtn = [[UIButton alloc] initWithFrame:CGRectMake((idx*barView.width)/3, 0, barView.width/3, 80)];
    guanBtn.tag = idx;
    [guanBtn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:guanBtn];
    
    UIImageView *icon1 = [[UIImageView alloc] initWithFrame:CGRectMake((guanBtn.width-24)/2, 20, 24, 24)];
    if (idx==0) {
        [icon1 setImage:[UIImage imageNamed:@"guanzhu"]];
    } else if (idx==1) {
        [icon1 setImage:[UIImage imageNamed:@"fensi"]];
    } else if (idx==2) {
        [icon1 setImage:[UIImage imageNamed:@"xiaoxi"]];
    }
    [guanBtn addSubview:icon1];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, icon1.bottom+5, guanBtn.width, 11)];
    titleLab.font = WTFontSys(12);
    titleLab.text = @"关注";
    if (idx==1) {
        titleLab.text = @"粉丝";
    } else if (idx==2) {
        titleLab.text = @"消息";
    }
    titleLab.textColor = QL_UserName_TitleColor_Black;
    titleLab.textAlignment = NSTextAlignmentCenter;
    [guanBtn addSubview:titleLab];
}

- (void)initForm {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];
    
    WTIconTextItem *it1 = [[WTIconTextItem alloc] init];
    it1.iconImg = [UIImage imageNamed:@"baby"];
    it1.textString = @"宝宝档案";
    it1.selectionHandler = ^(id item) {
        QLBabyRecordViewController *baby = [[QLBabyRecordViewController alloc] init];
        [bself.navigationController pushViewController:baby animated:YES];
    };
    [section0 addItem:it1];
    
    WTIconTextItem *it2 = [[WTIconTextItem alloc] init];
    it2.iconImg = [UIImage imageNamed:@"about"];
    it2.textString = @"关于我们";
    it2.selectionHandler = ^(id item) {
        QLABoutViewController *aa = [[QLABoutViewController alloc] initWithUrlString:@"http://www.163.com"];
        [bself.navigationController pushViewController:aa animated:YES];
    };
    [section0 addItem:it2];
    
    WTIconTextItem *it3 = [[WTIconTextItem alloc] init];
    it3.iconImg = [UIImage imageNamed:@"help"];
    it3.textString = @"帮助反馈";
    it3.selectionHandler = ^(id item) {
        QLFeedBackViewController *aa = [[QLFeedBackViewController alloc] initWithUrlString:@"http://www.baidu.com"];
        [bself.navigationController pushViewController:aa animated:YES];
    };
    [section0 addItem:it3];
    
    WTIconTextItem *it4 = [[WTIconTextItem alloc] init];
    it4.iconImg = [UIImage imageNamed:@"setting"];
    it4.textString = @"设置";
    it4.selectionHandler = ^(id item) {
        QLSettingViewController *settingVc = [[QLSettingViewController alloc] init];
        [bself.navigationController pushViewController:settingVc animated:YES];
    };
    [section0 addItem:it4];
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];

    [self.formTable reloadData];
}

- (void)btnPress:(UIButton *)btn {
    if (btn.tag == 0) {
        QLGuanZhuViewController *guan = [[QLGuanZhuViewController alloc] init];
        [self.navigationController pushViewController:guan animated:YES];
    } else if (btn.tag == 1) {
        QLFunsViewController *funs = [[QLFunsViewController alloc] init];
        [self.navigationController pushViewController:funs animated:YES];
    } else if (btn.tag == 2) {
        QLMessageViewController *message = [[QLMessageViewController alloc] init];
        [self.navigationController pushViewController:message animated:YES];
    }
}

- (void)editUserInfo {
    QLUserInfoViewController *info = [[QLUserInfoViewController alloc] init];
    [self.navigationController pushViewController:info animated:YES];
}
@end
