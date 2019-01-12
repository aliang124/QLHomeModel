//
//  QLAddBabyCell.h
//  QLLoginModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLAddBabyCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLAddBabyItem
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

@interface QLAddBabyCell()
{
    UIButton *bgBtn;
}
@end

@implementation QLAddBabyCell

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
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bgBtn.width, bgBtn.height)];
    titleLab.font = WTFontSys(14);
    titleLab.textColor = WTColorHex(0xFF36342A);
    titleLab.text = @"添加宝宝";
    [bgBtn addSubview:titleLab];
    [titleLab sizeToFit];
    
    CGFloat offsetX = (bgBtn.width-(20+6+titleLab.width))/2;
    titleLab.left = offsetX+20+6;
    titleLab.top = (bgBtn.height-titleLab.height)/2;
    
    UIImageView *iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, (bgBtn.height-20)/2, 20, 20)];
    [iconImg setImage:[UIImage imageNamed:@"addBabyIcon"]];
    [bgBtn addSubview:iconImg];
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

@end
