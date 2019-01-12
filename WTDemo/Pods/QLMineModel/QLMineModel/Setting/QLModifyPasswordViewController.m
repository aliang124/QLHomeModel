//
//  QLModifyPasswordViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/10.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLModifyPasswordViewController.h"

@interface QLModifyPasswordViewController ()
@property (nonatomic,strong) UITextField *verifyTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@property (nonatomic,strong) UITextField *passwordTextField1;
@end

@implementation QLModifyPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBar.title = @"修改密码";
    [self createSubView];
}

- (void)createSubView {
    //手机号
    UIView *phoneView = [[UIView alloc] initWithFrame:CGRectMake(16, 16+WT_NavBar_Height, WTScreenWidth-16-16, 44)];
    phoneView.layer.cornerRadius = 2;
    phoneView.layer.masksToBounds = YES;
    phoneView.layer.borderColor = WTColorHex(0xECECE6).CGColor;
    phoneView.layer.borderWidth = 1;
    [self.view addSubview:phoneView];
    
    UILabel *phoneLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, phoneView.width-32, 44)];
    phoneLab.textColor = QL_UserName_TitleColor_Black;
    phoneLab.text = @"手机号";
    phoneLab.font = WTFontSys(14);
    [phoneView addSubview:phoneLab];

    UILabel *phoneTextLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, phoneView.width-32, 44)];
    phoneTextLab.textColor = QL_DescColor_Gray;
    phoneTextLab.text = @"151****4455";
    phoneTextLab.textAlignment = NSTextAlignmentRight;
    phoneTextLab.font = WTFontSys(12);
    [phoneView addSubview:phoneTextLab];

    //验证码
    float verifyViewWidth = WTScreenWidth-16-16-12-100;
    _verifyTextField = [QLBusinessUtil createTextFieldView:CGRectMake(16, 72+WT_NavBar_Height, verifyViewWidth, 44) superView:self.view placeHolder:@"请输入验证码"];
    
    UIButton *verifyBtn = [[UIButton alloc] initWithFrame:CGRectMake(_verifyTextField.right+15+12, _verifyTextField.top, 100, 44)];
    [QLBusinessUtil setRoundBtn:verifyBtn titleText:@"获取验证码"];
    verifyBtn.titleLabel.font = WTFontSys(14);
    [verifyBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    [self.view addSubview:verifyBtn];
    
    //设置登录密码
    _passwordTextField = [QLBusinessUtil createTextFieldView:CGRectMake(16, _verifyTextField.bottom+12, WTScreenWidth-16-14, 44) superView:self.view placeHolder:@"设置新密码"];
    
    _passwordTextField1 = [QLBusinessUtil createTextFieldView:CGRectMake(16, _passwordTextField.bottom+12, WTScreenWidth-16-14, 44) superView:self.view placeHolder:@"再次输入新密码"];
    
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(16, _passwordTextField1.bottom+16, WTScreenWidth-16-16, 44)];
    [QLBusinessUtil setRoundBtn:loginBtn titleText:@"确定"];
    [loginBtn addTarget:self action:@selector(loginBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

- (void)loginBtnPress {
}

@end
