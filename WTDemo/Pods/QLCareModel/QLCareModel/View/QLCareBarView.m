//
//  QLCareBarView.m
//  WTDemo
//
//  Created by 计恩良 on 2018/12/7.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLCareBarView.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@interface QLCareBarView () {
    UIImageView *iconImg;
    UILabel *titleLab;
    UILabel *countLab;
}
@end

@implementation QLCareBarView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[WTUtil createImageFromColor:WT_Color_ViewBackGround] forState:UIControlStateHighlighted];

        iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(20, 15, 20, 14)];
        iconImg.backgroundColor = [UIColor redColor];
        [self addSubview:iconImg];
        
        titleLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right+8, 15, 48, 14)];
        titleLab.text = @"我的关注";
        titleLab.font = WTFontSys(12);
        titleLab.textColor = QL_UserName_TitleColor_Black;
        [self addSubview:titleLab];
        [titleLab sizeToFit];

        countLab = [[UILabel alloc] initWithFrame:CGRectMake(titleLab.right+9, 15, 48, 14)];
        countLab.font = WTFontSys(12);
        countLab.textColor = QL_DescColor_Gray;
        [self addSubview:countLab];
        
        UIImageView *arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(WTScreenWidth-5-20, (44-9)/2, 5, 9)];
        [arrowImg setImage:[UIImage imageNamed:@"arrowImg"]];
        [self addSubview:arrowImg];
        
        UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 44-WT_Line_Height, WTScreenWidth, WT_Line_Height)];
        lineImg.backgroundColor = WT_Color_Line;
        [self addSubview:lineImg];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    countLab.text = @"234";
    [countLab sizeToFit];
}
@end
