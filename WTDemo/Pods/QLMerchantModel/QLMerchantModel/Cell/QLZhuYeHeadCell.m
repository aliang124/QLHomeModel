//
//  QLTieBaShopCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLZhuYeHeadCell.h"
#import "UIImageView+WebImage.h"

@implementation QLZhuYeHeadItem

- (id)init{
    if (self = [super init]) {
        self.cellHeight = 154;
    }
    return self;
}

@end

@interface QLZhuYeHeadCell()
{
    UIImageView *userIcon;
    UILabel *userNameLab;
    UILabel *cityLab;
    UILabel *ageLab;

    UILabel *guanZhuLab;
    UILabel *fansLab;
}
@end

@implementation QLZhuYeHeadCell
@dynamic item;

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 0, WTScreenWidth-12-12, 154)];
    [bgImg setImage:[UIImage imageNamed:@"zhuyeBg"]];
    [self.contentView addSubview:bgImg];
    
    userIcon = [[UIImageView alloc] initWithFrame:CGRectMake((WTScreenWidth-52)/2, 20, 52, 52)];
    userIcon.layer.cornerRadius = 26;
    userIcon.layer.masksToBounds = YES;
    [self.contentView addSubview:userIcon];
    
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, userIcon.bottom+6, WTScreenWidth, 13)];
    userNameLab.font = WTFontBoldSys(14);
    userNameLab.textAlignment = NSTextAlignmentCenter;
    userNameLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:userNameLab];
    
    cityLab = [[UILabel alloc] initWithFrame:CGRectMake(0, userNameLab.bottom+7, (WTScreenWidth/2)-10, 9)];
    cityLab.font = WTFontSys(10);
    cityLab.textColor = QL_UserName_TitleColor_Black;
    cityLab.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:cityLab];

    UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(WTScreenWidth/2, cityLab.top, 0.5, 10)];
    lineImg.backgroundColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:lineImg];
    
    ageLab = [[UILabel alloc] initWithFrame:CGRectMake((WTScreenWidth/2)+10, userNameLab.bottom+7, (WTScreenWidth/2)-10, 9)];
    ageLab.font = WTFontSys(10);
    ageLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:ageLab];
    
    guanZhuLab = [[UILabel alloc] initWithFrame:CGRectMake(0, ageLab.bottom+7, (WTScreenWidth/2)-5, 11)];
    guanZhuLab.font = WTFontSys(12);
    guanZhuLab.textAlignment = NSTextAlignmentRight;
    guanZhuLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:guanZhuLab];
    
    fansLab = [[UILabel alloc] initWithFrame:CGRectMake((WTScreenWidth/2)+5, ageLab.bottom+7, (WTScreenWidth/2)-5, 11)];
    fansLab.font = WTFontSys(12);
    fansLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:fansLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [userIcon setWebImageWithUrl:[WTUtil strRelay:self.item.info[@"image"]] placeHolder:[WTUtil createImageFromColor:QL_DateTextColor_Gray]];
    userNameLab.text = [WTUtil strRelay:self.item.info[@"nickName"]];
    cityLab.text = @"合肥";//[WTUtil strRelay:self.item.info[@"city"]];
    ageLab.text = @"3岁宝妈";
    guanZhuLab.text = [NSString stringWithFormat:@"关注 %@",[WTUtil strRelay:self.item.followNum]];
    fansLab.text = [NSString stringWithFormat:@"粉丝 %@",[WTUtil strRelay:self.item.fansNum]];
}

@end
