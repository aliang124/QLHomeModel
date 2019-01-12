//
//  QLBusinessUtil.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/22.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLBusinessUtil.h"
#import "WTBaseCore.h"
#import "QLDefine.h"

@implementation QLBusinessUtil
+ (UITextField *)createTextFieldView:(CGRect)frame superView:(UIView *)superView placeHolder:(NSString *)place {
    UIView *phoneOrNameView = [[UIView alloc] initWithFrame:frame];
    [QLBusinessUtil setPhoneTextViewBackGround:phoneOrNameView];
    [superView addSubview:phoneOrNameView];
    
    UITextField *phoneNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(frame.origin.x+15, frame.origin.y, phoneOrNameView.width-30, phoneOrNameView.height)];
    phoneNameTextField.textColor = QL_UserName_TitleColor_Black;
    phoneNameTextField.font = WTFontSys(16);
    phoneNameTextField.placeholder = place;
    [superView addSubview:phoneNameTextField];
    
    return phoneNameTextField;
}
+ (void)setPhoneTextViewBackGround:(UIView *)phoneOrNameView {
    phoneOrNameView.backgroundColor = WTColorHex(0xFAFAF7);
    phoneOrNameView.layer.cornerRadius = 2;
    phoneOrNameView.layer.masksToBounds = YES;
    phoneOrNameView.layer.borderColor = WTColorHex(0xECECE6).CGColor;
    phoneOrNameView.layer.borderWidth = 1;
}

+ (void)setRoundBtn:(UIButton *)loginBtn titleText:(NSString *)titleText {
    [loginBtn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 2;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.titleLabel.font = WTFontSys(17);
    [loginBtn setTitle:titleText forState:UIControlStateNormal];
    [loginBtn setTitleColor:QL_NavBar_TitleColor_Black forState:UIControlStateNormal];
}

@end
