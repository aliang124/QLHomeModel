//
//  QLUserInfoCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLUserInfoCell.h"
#import "WTBaseCore.h"

@implementation QLUserInfoItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 44;
    }
    return self;
}

@end

@interface QLUserInfoCell()
{
    UIButton *bgBtn;
    UILabel *leftLab;
    UILabel *rightLab;
}
@end

@implementation QLUserInfoCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor clearColor];

    bgBtn = [[UIButton alloc] initWithFrame:CGRectMake(16, 0, WTScreenWidth-16-16, 44)];
    bgBtn.layer.cornerRadius = 4;
    bgBtn.layer.borderColor = WTColorHex(0xECECE6).CGColor;
    bgBtn.layer.borderWidth = 1;
    [bgBtn setImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [bgBtn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:bgBtn];
    
    leftLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 0, 13)];
    leftLab.font = WTFontSys(14);
    leftLab.textColor = QL_UserName_TitleColor_Black;
    [bgBtn addSubview:leftLab];

    rightLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 13)];
    rightLab.font = WTFontSys(12);
    rightLab.textAlignment = NSTextAlignmentRight;
    rightLab.textColor = QL_DescColor_Gray;
    [bgBtn addSubview:rightLab];

    UIImageView *arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(bgBtn.width-16-7, (44-10)/2, 7, 10)];
    [arrowImg setImage:[UIImage imageNamed:@"arrowImg"]];
    [bgBtn addSubview:arrowImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    leftLab.text = [WTUtil strRelay:self.item.leftText];
    [leftLab sizeToFit];
    leftLab.top = (44-leftLab.height)/2;

    rightLab.left = leftLab.right+5;
    rightLab.text = [WTUtil strRelay:self.item.rightText];
    rightLab.top = (44-rightLab.height)/2;
    rightLab.width = bgBtn.width-rightLab.left-16-7-16;

}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)btnPress {
    if (self.item.btnPressHandler) {
        self.item.btnPressHandler(self.item);
    }
}
@end
