//
//  QLSelectCheckCell.h
//  QLLoginModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLSelectCheckCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLSelectCheckItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 44;
        self.bgColor = [UIColor whiteColor];
        self.hasBottomLine = NO;
        self.canHighlighted = NO;
    }
    return self;
}

@end

@interface QLSelectCheckCell()
{
    UIButton *bgBtn;
    UILabel *leftTextLabel;
    UILabel *rightTextLabel;
    UIImageView *arrowImg;
}
@end

@implementation QLSelectCheckCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    bgBtn = [[UIButton alloc] initWithFrame:CGRectMake(24, 0, WTScreenWidth-24-23, 44)];
    [bgBtn setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    bgBtn.backgroundColor = [UIColor whiteColor];
    bgBtn.layer.cornerRadius = 2;
    bgBtn.layer.masksToBounds = YES;
    bgBtn.layer.borderColor = WTColorHex(0xECECE6).CGColor;
    bgBtn.layer.borderWidth = 1;
    [self.contentView addSubview:bgBtn];
    
    arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.width-16-7, 17, 7, 10)];
    [arrowImg setImage:[UIImage imageNamed:@"arrowImg"]];
    [bgBtn addSubview:arrowImg];
    
    rightTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(arrowImg.left-19, 0, 0, 44)];
    rightTextLabel.font = WTFontSys(12);
    rightTextLabel.textColor = QL_DescColor_Gray;
    [bgBtn addSubview:rightTextLabel];
    
    leftTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 0, 44)];
    leftTextLabel.font = WTFontSys(12);
    leftTextLabel.textColor = QL_UserName_TitleColor_Black;
    [bgBtn addSubview:leftTextLabel];
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
    rightTextLabel.text = [WTUtil strRelay:self.item.rightText];
    [rightTextLabel sizeToFit];
    float rightWidth = rightTextLabel.width;
    rightTextLabel.left = arrowImg.left-rightWidth-16;
    rightTextLabel.top = (self.height-rightTextLabel.height)/2;
    leftTextLabel.width = rightTextLabel.left-16;
    leftTextLabel.text = [WTUtil strRelay:self.item.leftText];
}

@end
