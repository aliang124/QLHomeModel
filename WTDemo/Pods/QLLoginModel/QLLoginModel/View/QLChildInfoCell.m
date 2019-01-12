//
//  QLChildInfoCell.h
//  QLLoginModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLChildInfoCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLChildInfoItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 220;
        self.bgColor = [UIColor whiteColor];
        self.hasBottomLine = NO;
        self.canHighlighted = NO;
    }
    return self;
}

@end

@interface QLChildInfoCell()
{
    UIButton *editNameBtn;
    UITextField *nameTextField;
    UIButton *huanYunBtn;
    UIButton *wangZiBtn;
    UIButton *gongZhuBtn;
    UILabel *dateTipLab;
    UILabel *dateLab;
}
@end

@implementation QLChildInfoCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    UILabel *haiInfo = [[UILabel alloc] initWithFrame:CGRectMake(24, 12, WTScreenWidth-24-23, 12)];
    haiInfo.font = WTFontSys(12);
    haiInfo.textColor = QL_DescColor_Gray;
    haiInfo.text = @"孩子信息";
    [self.contentView addSubview:haiInfo];

    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(24, haiInfo.bottom+12, WTScreenWidth-24-23, 184)];
    bgView.layer.cornerRadius = 2;
    bgView.layer.masksToBounds = YES;
    bgView.layer.borderColor = WTColorHex(0xECECE6).CGColor;
    bgView.layer.borderWidth = 1;
    [self.contentView addSubview:bgView];

    //宝宝姓名
    editNameBtn = [[UIButton alloc] initWithFrame:CGRectMake(bgView.width-16-64, 12, 64, 24)];
    [editNameBtn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateNormal];
    editNameBtn.titleLabel.font = WTFontSys(12);
    [editNameBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    [editNameBtn setTitle:@"编辑姓名" forState:UIControlStateNormal];
    [bgView addSubview:editNameBtn];
    
    nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(16, 0, bgView.width-16-64-16, 48)];
    nameTextField.textColor = QL_UserName_TitleColor_Black;
    nameTextField.font = WTFontSys(16);
    nameTextField.placeholder = @"宝宝姓名";
    [bgView addSubview:nameTextField];

    UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 48, bgView.width-12-12, 1)];
    line1.backgroundColor = WTColorHex(0xEEEEE5);
    [bgView addSubview:line1];
    
    //宝宝状态（怀孕中、小王子、小公主）
    UILabel *tipLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 48, bgView.width-16-16, 48)];
    tipLab.font = WTFontSys(14);
    tipLab.textColor = QL_UserName_TitleColor_Black;
    tipLab.text = @"状态";
    [bgView addSubview:tipLab];
    
    float offsetX = bgView.width-(52*3)-(2*8)-16;
    for (int i = 0; i < 3; i++) {
        UIButton *statusBtn = [[UIButton alloc] initWithFrame:CGRectMake(offsetX, 48+12, 52, 24)];
        statusBtn.titleLabel.font = WTFontSys(12);
        [statusBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
        [statusBtn setBackgroundImage:[WTUtil createImageFromColor:WTColorHex(0xF5F5F2)] forState:UIControlStateNormal];
        [statusBtn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateSelected];
        [statusBtn addTarget:self action:@selector(statusBtnPress:) forControlEvents:UIControlEventTouchUpInside];
        if (i==0) {
            huanYunBtn = statusBtn;
            [statusBtn setTitle:@"怀孕中" forState:UIControlStateNormal];
        } else if (i==1) {
            wangZiBtn = statusBtn;
            [statusBtn setTitle:@"小王子" forState:UIControlStateNormal];
        } else {
            gongZhuBtn = statusBtn;
            [statusBtn setTitle:@"小公主" forState:UIControlStateNormal];
        }
        [bgView addSubview:statusBtn];
        
        offsetX = statusBtn.right + 8;
    }
    //默认选中怀孕中
    [self statusBtnPress:huanYunBtn];

    UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 96, bgView.width-12-12, 1)];
    line2.backgroundColor = WTColorHex(0xEEEEE5);
    [bgView addSubview:line2];
    
    //选择日期（预产期、生日）
    UIButton *dateBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 97, bgView.width, 47)];
    [dateBtn setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [bgView addSubview:dateBtn];
    
    dateTipLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, dateBtn.width-16-16, 47)];
    dateTipLab.font = WTFontSys(14);
    dateTipLab.textColor = QL_UserName_TitleColor_Black;
    dateTipLab.text = @"预产期";
    [dateBtn addSubview:dateTipLab];

    UIImageView *arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(dateBtn.width-16-7, (47-10)/2, 7, 10)];
    [arrowImg setImage:[UIImage imageNamed:@"arrowImg"]];
    [dateBtn addSubview:arrowImg];

    dateLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, dateBtn.width-16-16-7-15, 47)];
    dateLab.font = WTFontSys(14);
    dateLab.textColor = WTColorHex(0xFF63625C);
    dateLab.textAlignment = NSTextAlignmentRight;
    [dateBtn addSubview:dateLab];

    UIImageView *line3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 144, bgView.width, 1)];
    line3.backgroundColor = WTColorHex(0xEEEEE5);
    [bgView addSubview:line3];
    //清除信息
    UIButton *clearInfo = [[UIButton alloc] initWithFrame:CGRectMake(0, 145, bgView.width, 39)];
    [clearInfo setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    clearInfo.titleLabel.font = WTFontSys(12);
    [clearInfo setTitleColor:WTColorHex(0xFF6A18) forState:UIControlStateNormal];
    [clearInfo addTarget:self action:@selector(clearBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [clearInfo setTitle:@"清除信息" forState:UIControlStateNormal];
    [bgView addSubview:clearInfo];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = self.item.bgColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)statusBtnPress:(UIButton *)btn {
    if (btn==huanYunBtn) {
        huanYunBtn.selected = YES;
        wangZiBtn.selected = NO;
        gongZhuBtn.selected = NO;
    } else if (btn==wangZiBtn) {
        huanYunBtn.selected = NO;
        wangZiBtn.selected = YES;
        gongZhuBtn.selected = NO;
    } else if (btn==gongZhuBtn) {
        huanYunBtn.selected = NO;
        wangZiBtn.selected = NO;
        gongZhuBtn.selected = YES;
    }
}

- (void)clearBtnPress {
    [self endEditing:YES];
    dateLab.text = @"";
    nameTextField.text = @"";
}
@end
