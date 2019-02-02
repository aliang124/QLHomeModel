//
//  QLSearchViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/31.
//  Copyright © 2019年 计恩良. All rights reserved.
//
#define QLColorHexA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#import "QLSearchViewController.h"
#import "QLSearchView.h"
@interface QLSearchViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *searchTextField;
@property (nonatomic,strong) QLSearchView *searchView;
@end

@implementation QLSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *barBg = [[UIView alloc] initWithFrame:CGRectMake(50, ((WT_NavBar_Title_Height-32)/2)+WT_Height_StatusBar, WTScreenWidth-50-8, 32)];
    barBg.layer.cornerRadius = 2;
    barBg.layer.masksToBounds = YES;
    barBg.backgroundColor = QLColorHexA(0x947d00,0.2);
    [self.view addSubview:barBg];
    
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(11, 0, barBg.width-11-11, barBg.height)];
    _searchTextField.placeholder = @"输入搜素内容";
    _searchTextField.font = WTFontSys(14);
    _searchTextField.textColor = QL_UserName_TitleColor_Black;
    _searchTextField.text = @"餐厅";
    _searchTextField.delegate = self;
    [barBg addSubview:self.searchTextField];
    
    _searchView = [[QLSearchView alloc] initWithFrame:CGRectMake(0, WT_NavBar_Height, WTScreenWidth, WTScreenHeight-WT_NavBar_Height)];
    _searchView.hidden = YES;
    _searchView.backgroundColor = WT_Color_ViewBackGround;
    [self.view addSubview:_searchView];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    _searchView.hidden = NO;
}


@end
