//
//  QLFunsCel.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLSiXinCell.h"
#import "WTBaseCore.h"
#import "UIImageView+WebImage.h"
#import "QLMineNetWork.h"

@implementation QLSiXinItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 88;
    }
    return self;
}

@end

@interface QLSiXinCell()
{
    UIImageView *iconImg;
    UILabel *userNameLab;
    UILabel *cityLab;
    UILabel *dateLab;
}
@end

@implementation QLSiXinCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    
    iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(16, 22, 44, 44)];
    iconImg.layer.cornerRadius = 24;
    iconImg.layer.masksToBounds = YES;
    [self.contentView addSubview:iconImg];
    
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right+12, 23, WTScreenWidth-iconImg.right-13-16, 13)];
    userNameLab.font = WTFontSys(14);
    userNameLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:userNameLab];

    cityLab = [[UILabel alloc] initWithFrame:CGRectMake(userNameLab.left, userNameLab.bottom+16, WTScreenWidth-userNameLab.left-21, 11)];
    cityLab.font = WTFontSys(12);
    cityLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:cityLab];

    dateLab = [[UILabel alloc] initWithFrame:CGRectMake(WTScreenWidth-12-100, 16, 100, 12)];
    dateLab.font = WTFontSys(12);
    dateLab.text = @"5分钟前";
    dateLab.textAlignment = NSTextAlignmentCenter;
    dateLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:dateLab];

    UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 87, WTScreenWidth, 1)];
    lineImg.backgroundColor = WTColorHex(0xEEEEE5);
    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [iconImg setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
    userNameLab.text = [WTUtil strRelay:self.item.info[@"nickName"]];
    cityLab.text = @"私信内容私信内容私信内容私信内容私信内容私...";//[WTUtil strRelay:self.item.info[@"city"]];
}

@end
