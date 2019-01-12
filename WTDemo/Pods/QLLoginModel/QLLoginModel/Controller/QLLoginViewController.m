//
//  QLLoginViewController.m
//  Project
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLLoginViewController.h"
#import "QLRegisterViewController.h"
#import "QLThirdLoginViewController.h"
#import "QLLoginNetWork.h"

@interface QLLoginViewController ()
@property (nonatomic,strong) UITextField *phoneNameTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@end

@implementation QLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBar.bgColor = [UIColor whiteColor];
    
    WTCustomBarItem *itLeft = [[WTCustomBarItem alloc] init];
    itLeft.itemStyle = 1;
    itLeft.imgSize = CGSizeMake(22, 22);
    itLeft.itemImage = [UIImage imageNamed:@"closeBtn"];
    itLeft.onClick = ^{
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    };
    self.navBar.leftItemList = [NSArray arrayWithObject:itLeft];
    
    WTCustomBarItem *itRight = [[WTCustomBarItem alloc] init];
    itRight.itemStyle = 0;
    itRight.itemTitle = @"注册";
    itRight.itemTextColor = QL_NavBar_TitleColor_Black;
    itRight.itemTextFont = [UIFont systemFontOfSize:16];
    itRight.onClick = ^{
        [self.navigationController pushViewController:[QLRegisterViewController new] animated:YES];
    };
    self.navBar.rightItemList = [NSArray arrayWithObject:itRight];

    [self createSubView];
}

- (void)createSubView {
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(25, 98+WT_Height_StatusBar-20, WTScreenWidth-25-25, 23)];
    titleLab.font = WTFontSys(24);
    titleLab.textColor = QL_NavBar_TitleColor_Black;
    titleLab.text = @"密码登录";
    [self.view addSubview:titleLab];
    //用户名或手机号
    _phoneNameTextField = [QLBusinessUtil createTextFieldView:CGRectMake(24, titleLab.bottom+32, WTScreenWidth-24-24, 44) superView:self.view placeHolder:@"请输入用户名或手机号"];
    _phoneNameTextField.text = @"15105609556";
    //密码
    _passwordTextField = [QLBusinessUtil createTextFieldView:CGRectMake(24, _phoneNameTextField.bottom+12, WTScreenWidth-24-24, 44) superView:self.view placeHolder:@"请输入密码"];
    _passwordTextField.text = @"123456";
    //登录按钮
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(24, _passwordTextField.bottom+16, WTScreenWidth-24-24, 44)];
    [QLBusinessUtil setRoundBtn:loginBtn titleText:@"登录"];
    [loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    //底部第三方登录区域背景
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, WTScreenHeight-196, WTScreenWidth, 196)];
    [self.view addSubview:bgView];

    UIImageView *bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WTScreenWidth, 196)];
    [bgImg setImage:[UIImage imageNamed:@"loginBack"]];
    [bgView addSubview:bgImg];
    
    UILabel *tipLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 56, WTScreenWidth, 12)];
    tipLab.text = @"第三方登录";
    tipLab.font = WTFontSys(12);
    tipLab.textAlignment = NSTextAlignmentCenter;
    tipLab.textColor = WTColorHex(0xBBA31A);
    [bgView addSubview:tipLab];
    
    float offsetX = (WTScreenWidth-48*3-36*2)/2;
    
    UIButton *btnWeiXin = [[UIButton alloc] initWithFrame:CGRectMake(offsetX, 90, 48, 48)];
    [btnWeiXin setBackgroundImage:[UIImage imageNamed:@"weixinLogin"] forState:UIControlStateNormal];
    [btnWeiXin addTarget:self action:@selector(weixinLogin) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:btnWeiXin];

    UIButton *btnSina = [[UIButton alloc] initWithFrame:CGRectMake(btnWeiXin.right+36, 90, 48, 48)];
    [btnSina setBackgroundImage:[UIImage imageNamed:@"sinaLogin"] forState:UIControlStateNormal];
    [btnSina addTarget:self action:@selector(weiboLogin) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:btnSina];

    UIButton *btnQQ = [[UIButton alloc] initWithFrame:CGRectMake(btnSina.right+36, 90, 48, 48)];
    [btnQQ setBackgroundImage:[UIImage imageNamed:@"qqLogin"] forState:UIControlStateNormal];
    [btnQQ addTarget:self action:@selector(QQLogin) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:btnQQ];
}

- (void)weiboLogin {
    [self goThirdLogin];
}

- (void)QQLogin {
    [self goThirdLogin];
}

- (void)weixinLogin {
    [self goThirdLogin];
}

- (void)goThirdLogin {
    QLThirdLoginViewController *third = [[QLThirdLoginViewController alloc] init];
    [self.navigationController pushViewController:third animated:YES];
}

- (void)loginAction {
    WT(weakSelf);
    [QLMBProgressHUDUtil showActivityMessageInWindow:@"正在加载"];
    [QLLoginNetWork loginWithPhone:_phoneNameTextField.text password:_passwordTextField.text successHandler:^(id json) {
        [QLMBProgressHUDUtil hideHUD];
        [WTToast makeText:@"登录成功"];
        //读取登录对象并写入登录数据
        [[QLLoginInfo sharedInstance] setLoginInfoWithDict:json];
        [[QLLoginInfo sharedInstance] writeUserInfo:json];
        WTPostNotification(QL_LoginSuccess_CompletionHandler,nil);
        //进入首页
        if (weakSelf.loginCompletionHandler) {
            weakSelf.loginCompletionHandler();
        }
        [weakSelf dismissViewControllerAnimated:YES completion:^{
        }];
    } failHandler:^(NSString *message) {
        [QLMBProgressHUDUtil hideHUD];
        [WTToast makeText:message];
    }];;
}
@end
