//
//  QLSettingGroupCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLSettingGroupCell1.h"
#import "WTBaseCore.h"

@implementation QLSettingGroupItem1
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 48;
        self.bgColor = [UIColor whiteColor];
        self.hasBottomLine = NO;
        self.canHighlighted = NO;
    }
    return self;
}

@end

@interface QLSettingGroupCell1()
{
}
@end

@implementation QLSettingGroupCell1

- (void)cellDidLoad
{
    [super cellDidLoad];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = self.item.bgColor;
    [self onCreateSubView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)onCreateSubView {
    [self.contentView removeAllSubviews];
    self.item.cellHeight = self.item.dataArray.count * 60;
    self.height = self.item.cellHeight;
    
    UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(16, 0, WTScreenWidth-16-16, self.height)];
    bgV.userInteractionEnabled = NO;
    bgV.layer.cornerRadius = 4;
    bgV.layer.borderWidth = 1;
    bgV.layer.borderColor = WTColorHex(0xEEEEE5).CGColor;
    [self.contentView addSubview:bgV];
    
    for (int i = 0; i < self.item.dataArray.count; i++) {
        NSDictionary *dic = self.item.dataArray[i];
        
        UIView *btn = [[UIView alloc] initWithFrame:CGRectMake(16, i*60, WTScreenWidth-16-16, 60)];
        [self.contentView addSubview:btn];
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 15, btn.width-16-16, 13)];
        titleLab.font = WTFontSys(14);
        titleLab.textColor = QL_UserName_TitleColor_Black;
        titleLab.text = [WTUtil strRelay:dic[@"leftTitle"]];
        [btn addSubview:titleLab];

        UILabel *descLab = [[UILabel alloc] initWithFrame:CGRectMake(16, titleLab.bottom+7, btn.width-16-16, 9)];
        descLab.font = WTFontSys(10);
        descLab.textColor = QL_DescColor_Gray;
        descLab.text = [WTUtil strRelay:dic[@"rightTitle"]];
        [btn addSubview:descLab];

        UIButton *switchBtn = [[UIButton alloc] initWithFrame:CGRectMake(btn.width-16-24, (btn.height-24)/2, 24, 24)];
        if ([[WTUtil strRelay:dic[@"hasChecked"]] integerValue]==1) {
            [switchBtn setImage:[UIImage imageNamed:@"switch_open"] forState:UIControlStateNormal];
        } else {
            [switchBtn setImage:[UIImage imageNamed:@"switch_close"] forState:UIControlStateNormal];
        }
        switchBtn.tag = i;
        [switchBtn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        [btn addSubview:switchBtn];

        if (i!=self.item.dataArray.count-1) {
            UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 59, btn.width-12-12, 1)];
            lineImg.backgroundColor = WTColorHex(0xEEEEE5);
            [btn addSubview:lineImg];
        }
        
    }
}

- (void)btnPress:(UIButton *)bbb {
    NSLog(@"aaaaaaaaa");
}
@end
