//
//  QLWanShanNextViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/11/12.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLWanShanNextViewController.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@interface QLWanShanNextViewController ()

@end

@implementation QLWanShanNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBar.bgColor = [UIColor whiteColor];
    
    WTCustomBarItem *itRight = [[WTCustomBarItem alloc] init];
    itRight.itemStyle = 0;
    itRight.itemTitle = @"跳过";
    itRight.itemTextColor = QL_NavBar_TitleColor_Black;
    itRight.itemTextFont = [UIFont systemFontOfSize:16];
    itRight.onClick = ^{
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.navBar.rightItemList = [NSArray arrayWithObject:itRight];

    [self createSubView];

    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(8, WTScreenHeight-8-38, WTScreenWidth-8-8, 38)];
    if (iPhoneX) {
        nextBtn.top = WTScreenHeight-8-38-34;
    }
    [nextBtn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateNormal];
    nextBtn.titleLabel.font = WTFontSys(18);
    [nextBtn setTitle:@"确定" forState:UIControlStateNormal];
    [nextBtn setTitleColor:WTColorHex(0xFF232A34) forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(confirmBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
}

- (void)createSubView {
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(25, 98+WT_Height_StatusBar-20, WTScreenWidth-25-25, 23)];
    titleLab.font = WTFontSys(24);
    titleLab.textColor = QL_NavBar_TitleColor_Black;
    titleLab.text = @"完善资料";
    [self.view addSubview:titleLab];
    
    UILabel *subTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(25, titleLab.bottom+14, titleLab.width, 11)];
    subTitleLab.font = WTFontSys(12);
    subTitleLab.textColor = QL_DescColor_Gray;
    subTitleLab.text = @"选择你关注的话题";
    [self.view addSubview:subTitleLab];

    float iconWH = 68;//图片文字宽高
    float iconTextOffset = 8;//图片文字间距
    float leftRightOffset = 30;
    float textHeight = 11;//文字高度
    float picOffset = (WTScreenWidth-68*3-leftRightOffset*2)/2;//两张图片之前空隙距离
    float totalH = iconWH+iconTextOffset+textHeight;
    float juli = 40;//上面label和下面icon之间距离
    
    float defalutH = subTitleLab.bottom+20;//初始位置
    float yOffset = defalutH;
    for (int i = 0; i < 7; i++) {
        int aaa = i%3;
        float xOffset = leftRightOffset;
        if (aaa==1) {
            xOffset = xOffset+iconWH+picOffset;
        } else if (aaa==2) {
            xOffset = xOffset+iconWH+picOffset+iconWH+picOffset;
        }
        int bbb = i/3;
        yOffset = defalutH + (bbb * totalH) + (juli*bbb);

        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(xOffset, yOffset, iconWH, iconWH)];
        btn.layer.cornerRadius = btn.width/2;
        btn.layer.masksToBounds = YES;
        [btn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        UILabel *textLab = [[UILabel alloc] initWithFrame:CGRectMake(btn.left, btn.bottom+iconTextOffset, btn.width, textHeight)];
        textLab.font = WTFontSys(12);
        textLab.textAlignment = NSTextAlignmentCenter;
        textLab.textColor = QL_DescColor_Gray;
        textLab.text = @"学区房";
        [self.view addSubview:textLab];
    }
}

- (void)confirmBtnPress {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
