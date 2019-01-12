//
//  QLMineHeadCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMineHeadCell.h"
#import "WTBaseCore.h"

@implementation QLMineHeadItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 120;
        self.bgColor = [UIColor blueColor];
        self.hasBottomLine = NO;
        self.canHighlighted = NO;
    }
    return self;
}

@end

@interface QLMineHeadCell()
{
    UIImageView *iconImg;
    UILabel *userNameLab;
    UILabel *userTipLab;
    UIImageView *arrowImg;
}
@end

@implementation QLMineHeadCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    //头像
    iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    iconImg.backgroundColor = [UIColor redColor];
    iconImg.layer.cornerRadius = 30;
    iconImg.layer.masksToBounds = YES;
    [self.contentView addSubview:iconImg];
    //用户名
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right+10, iconImg.top, WTScreenWidth-iconImg.right-10-30, 30)];
    userNameLab.font = WTFontBoldSys(16);
    userNameLab.textColor = [UIColor whiteColor];
    userNameLab.text = @"我的用户名";
    [self.contentView addSubview:userNameLab];
    //编辑提示
    userTipLab = [[UILabel alloc] initWithFrame:CGRectMake(userNameLab.left, userNameLab.bottom+10, userNameLab.width, 20)];
    userTipLab.font = WTFontSys(14);
    userTipLab.textColor = [UIColor whiteColor];
    userTipLab.text = @"查看或编辑个人主页";
    [self.contentView addSubview:userTipLab];
    //右箭头
    arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(userNameLab.right+9, 34, 12, 12)];
    [arrowImg setImage:[UIImage imageNamed:@"WTBaseCore/Arrow_Right"]];
    [self.contentView addSubview:arrowImg];
    
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
