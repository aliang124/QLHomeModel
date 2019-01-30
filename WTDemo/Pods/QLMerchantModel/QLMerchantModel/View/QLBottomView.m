//
//  QLBottomView.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/26.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLBottomView.h"
#import "QLZhuYeViewController.h"
#import "QLPingJiaViewController.h"
@implementation QLBottomView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        float width = (WTScreenWidth-8-8-8)/2;

        UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(8, 8, width, 38)];
        [self setRounct:leftBtn titleText:@"我要评价" imgIcon:@"woyaoPingJia"];
        [leftBtn addTarget:self action:@selector(goToPingJia) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:leftBtn];
        
        UIButton *rightBtn = [[WTCustomButton alloc] initWithFrame:CGRectMake(leftBtn.right+8, 8, width, 38)];
        [rightBtn addTarget:self action:@selector(goToZhuYe) forControlEvents:UIControlEventTouchUpInside];
        [self setRounct:rightBtn titleText:@"商家主页" imgIcon:@"seeZhuYe"];
        [self addSubview:rightBtn];
    }
    return self;
}

- (void)setRounct:(UIButton *)btn titleText:(NSString *)titleText imgIcon:(NSString *)imgText {
    btn.layer.cornerRadius = 4;
    btn.layer.borderColor = QL_Border_LineColor.CGColor;
    btn.layer.borderWidth = 0.5;
    [btn setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [btn setBackgroundImage:[WTUtil createImageFromColor:WTColorHex(0xFAFAF7)] forState:UIControlStateHighlighted];
    
    UIImageView *iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 9, 20, 20)];
    [iconImage setImage:[UIImage imageNamed:imgText]];
    [btn addSubview:iconImage];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    titleLab.font = WTFontSys(14);
    titleLab.text = titleText;
    titleLab.textColor = QL_UserName_TitleColor_Black;
    [btn addSubview:titleLab];
    [titleLab sizeToFit];
    
    float offset = (btn.width - (20+7+titleLab.width))/2;
    iconImage.left = offset;
    titleLab.left = iconImage.right+7;
    titleLab.top = (btn.height-titleLab.height)/2;
}

- (void)goToZhuYe {
    QLZhuYeViewController *zhu = [[QLZhuYeViewController alloc] init];
    zhu.memberId = self.businessId;//self.info[@"id"];
    WTRootNavPush(zhu);
}

- (void)goToPingJia {
    QLPingJiaViewController *zhu = [[QLPingJiaViewController alloc] init];
    WTRootNavPush(zhu);
}
@end
