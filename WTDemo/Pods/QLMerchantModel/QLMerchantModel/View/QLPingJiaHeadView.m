//
//  QLPingJiaHeadView.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/26.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLPingJiaHeadView.h"

@implementation QLPingJiaHeadView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.allBtn = [self createRoundBtn:CGRectMake(16, 12, 52, 24) titleText:@"全部"];
        self.allBtn.selected = YES;
        self.allBtn.tag = 1;
        [self addSubview:self.allBtn];
        
        self.xinBtn = [self createRoundBtn:CGRectMake(76, 12, 52, 24) titleText:@"最新"];
        self.xinBtn.tag = 2;
        [self addSubview:self.xinBtn];

        self.goodBtn = [self createRoundBtn:CGRectMake(136, 12, 52, 24) titleText:@"好评"];
        self.goodBtn.tag = 3;
        [self addSubview:self.goodBtn];

        self.hasPicBtn = [self createRoundBtn:CGRectMake(196, 12, 52, 24) titleText:@"带图"];
        self.hasPicBtn.tag = 4;
        [self addSubview:self.hasPicBtn];
    }
    return self;
}

- (UIButton *)createRoundBtn:(CGRect)frame titleText:(NSString *)titleText {
    UIButton *allBtn = [[UIButton alloc] initWithFrame:frame];
    [allBtn setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [allBtn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateSelected];
    allBtn.titleLabel.font = WTFontSys(12);
    [allBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    [allBtn setTitle:titleText forState:UIControlStateNormal];
    allBtn.layer.borderColor = QL_Border_LineColor.CGColor;
    allBtn.layer.borderWidth = 1;
    [allBtn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    return allBtn;
}

- (void)btnPress:(UIButton *)btn {
    self.allBtn.selected = NO;
    self.xinBtn.selected = NO;
    self.goodBtn.selected = NO;
    self.hasPicBtn.selected = NO;
    btn.selected = YES;
    if (self.typeBtnPress) {
        self.typeBtnPress((int)btn.tag);
    }
}
@end
