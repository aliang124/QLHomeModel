//
//  QLRegisterViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/11/12.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLRegisterViewController.h"
#import "QLWanShanViewController.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "QLLoginNetWork.h"

@interface QLRegisterViewController ()
@property (nonatomic,strong) UITextField *phoneNameTextField;
@property (nonatomic,strong) UITextField *verifyTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@property (nonatomic,strong) QLCountDownButton *verifyBtn;
@end

@implementation QLRegisterViewController

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
    itRight.itemTitle = @"登录";
    itRight.itemTextColor = QL_NavBar_TitleColor_Black;
    itRight.itemTextFont = [UIFont systemFontOfSize:16];
    itRight.onClick = ^{
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.navBar.rightItemList = [NSArray arrayWithObject:itRight];
    
    [self createSubView];
}

- (void)createSubView {
    WT(weakSelf);
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(25, 98+WT_Height_StatusBar-20, WTScreenWidth-25-25, 23)];
    titleLab.font = WTFontSys(24);
    titleLab.textColor = QL_NavBar_TitleColor_Black;
    titleLab.text = @"注册";
    [self.view addSubview:titleLab];
    
    //用户名或手机号
    _phoneNameTextField = [QLBusinessUtil createTextFieldView:CGRectMake(24, titleLab.bottom+32, WTScreenWidth-24-24, 44) superView:self.view placeHolder:@"请输入用户名或手机号"];
    _phoneNameTextField.text = @"15105609557";
    
    UIButton *clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(_phoneNameTextField.right+15-14-22, _phoneNameTextField.top+11, 22, 22)];
    [clearBtn setImage:[UIImage imageNamed:@"clearBtn"] forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearBtn];

    //验证码
    float verifyViewWidth = _phoneNameTextField.width+30-12-100;
    _verifyTextField = [QLBusinessUtil createTextFieldView:CGRectMake(24, _phoneNameTextField.bottom+12, verifyViewWidth, 44) superView:self.view placeHolder:@"请输入验证码"];
    _verifyTextField.text = @"123456";
    
    _verifyBtn = [[QLCountDownButton alloc] initWithDuration:60 buttonClicked:^{
        [weakSelf sendSMSMessageAction];
    } countDownStart:^{
    }  countDownUnderway:^(NSInteger restCountDownNum) {
        NSString *title = [NSString stringWithFormat:@"%lds", (long)restCountDownNum];
        [weakSelf.verifyBtn setTitle:title forState:UIControlStateNormal];
    } countDownCompletion:^{
        weakSelf.verifyBtn.enabled = YES;
        [weakSelf.verifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    }];
    _verifyBtn.frame = CGRectMake(_verifyTextField.right+15+12, _verifyTextField.top, 100, 44);
    [QLBusinessUtil setRoundBtn:_verifyBtn titleText:@"获取验证码"];
    _verifyBtn.titleLabel.font = WTFontSys(14);
    [_verifyBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    [_verifyBtn addTarget:self action:@selector(sendSMSMessageAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_verifyBtn];

    //设置登录密码
    _passwordTextField = [QLBusinessUtil createTextFieldView:CGRectMake(24, _verifyTextField.bottom+12, WTScreenWidth-24-24, 44) superView:self.view placeHolder:@"设置登录密码"];
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.text = @"123456";
    
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(24, _passwordTextField.bottom+16, WTScreenWidth-24-24, 44)];
    [QLBusinessUtil setRoundBtn:loginBtn titleText:@"确定"];
    [loginBtn addTarget:self action:@selector(registerBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

- (void)registerBtnPress {
    //进入完善资料页面
    QLWanShanViewController *wan = [QLWanShanViewController new];
    [self.navigationController pushViewController:wan animated:YES];
    return;
    [QLMBProgressHUDUtil showActivityMessageInWindow:@"正在加载"];
    [QLLoginNetWork registerWithPhone:self.phoneNameTextField.text password:self.passwordTextField.text code:self.verifyTextField.text successHandler:^(id json) {
        [QLMBProgressHUDUtil hideHUD];
        [WTToast makeText:@"注册成功"];
        //进入完善资料页面
        QLWanShanViewController *wan = [QLWanShanViewController new];
        [self.navigationController pushViewController:wan animated:YES];
    } failHandler:^(NSString *message) {
        [QLMBProgressHUDUtil hideHUD];
        [WTToast makeText:message];
    }];;
}

- (void)clearBtnPress {
    _phoneNameTextField.text = @"";
}

- (void)sendSMSMessageAction {
    self.verifyBtn.enabled = NO;
    [QLMBProgressHUDUtil showActivityMessageInWindow:@"正在加载"];
    [QLLoginNetWork SentSMSMessage:self.phoneNameTextField.text type:@"1" successHandler:^(id json) {
        [QLMBProgressHUDUtil hideHUD];
        [WTToast makeText:@"获取验证码成功"];
        [self.verifyBtn startCountDown];
    } failHandler:^(NSString *message) {
        [QLMBProgressHUDUtil hideHUD];
        [WTToast makeText:message];
        self.verifyBtn.enabled = YES;
    }];
}
@end
