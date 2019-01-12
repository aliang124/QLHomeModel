//
//  QLFunsCel.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLFunsCell.h"
#import "WTBaseCore.h"

@implementation QLFunsItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 91;
    }
    return self;
}

@end

@interface QLFunsCell()
{
    UIImageView *iconImg;
    UILabel *userNameLab;
    UILabel *cityLab;
    UILabel *ageSexLab;
}
@end

@implementation QLFunsCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    
    iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(16, 21, 48, 48)];
    iconImg.layer.cornerRadius = 24;
    iconImg.layer.masksToBounds = YES;
    iconImg.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iconImg];
    
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right+13, 28, WTScreenWidth-iconImg.right-13-16, 13)];
    userNameLab.font = WTFontSys(14);
    userNameLab.textColor = QL_UserName_TitleColor_Black;
    userNameLab.text = @"用户A";
    [self.contentView addSubview:userNameLab];

    cityLab = [[UILabel alloc] initWithFrame:CGRectMake(userNameLab.left, userNameLab.bottom+18, 20, 9)];
    cityLab.font = WTFontSys(10);
    cityLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:cityLab];

    ageSexLab = [[UILabel alloc] initWithFrame:CGRectMake(cityLab.right+16, cityLab.top, 20, 9)];
    ageSexLab.font = WTFontSys(10);
    ageSexLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:ageSexLab];

    UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 92, WTScreenWidth, 1)];
    lineImg.backgroundColor = WTColorHex(0xEEEEE5);
    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    cityLab.text = @"合肥";
    [cityLab sizeToFit];
    
    ageSexLab.left = cityLab.right+16;
    ageSexLab.text = @"3岁宝妈";
    [ageSexLab sizeToFit];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
