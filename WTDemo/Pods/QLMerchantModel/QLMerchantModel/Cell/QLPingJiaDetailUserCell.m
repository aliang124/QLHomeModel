//
//  QLMerchantTitleCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLPingJiaDetailUserCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"
#import "QLStarView.h"

@implementation QLPingJiaDetailUserItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 60;
    }
    return self;
}

@end

@interface QLPingJiaDetailUserCell()
{
    UIImageView *userIcon;
    UILabel *userNameLab;
    UILabel *dateLab;
}
@end

@implementation QLPingJiaDetailUserCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(12, 24, 28, 28)];
    userIcon.layer.cornerRadius = 14;
    userIcon.layer.masksToBounds = YES;
    [self.contentView addSubview:userIcon];
    
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(46, 32, WTScreenWidth-46-108, 11)];
    userNameLab.font = WTFontSys(12);
    userNameLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:userNameLab];
    
    dateLab = [[UILabel alloc] initWithFrame:CGRectMake(WTScreenWidth-32-76, 35, 76, 9)];
    dateLab.font = WTFontSys(10);
    dateLab.textAlignment = NSTextAlignmentRight;
    dateLab.textColor = QL_DateTextColor_Gray;
    [self.contentView addSubview:dateLab];
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [self setUserInfo];
}

- (void)setUserInfo {
    [userIcon setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542593731&di=392abf890c5d3d1e8ae849cb0091500c&imgtype=jpg&er=1&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F960a304e251f95cada6c0462c3177f3e6609524c.jpg" placeHolder:nil];
    userNameLab.text = [WTUtil strRelay:self.item.info[@"memberName"]];
    NSString *dateString = [WTUtil strRelay:self.item.info[@"createTime"]];
    NSDate *dd = [WTDateUtil string2Date:dateString format:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateDay = [WTDateUtil date2String:dd format:@"MM-dd HH:mm"];
    dateDay = [dateDay stringByReplacingOccurrencesOfString:@"-" withString:@"月"];
    dateDay = [NSString stringWithFormat:@"%@日",dateDay];
    dateLab.text = dateDay;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

@end
