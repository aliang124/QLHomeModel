//
//  QLTieBaUserInfoCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLTieBaUserInfoCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"

@implementation QLTieBaUserInfoItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 50;
        self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface QLTieBaUserInfoCell()
{
    UIImageView *iconImg;
    UILabel *userNameLab;
    
    UILabel *liuYanCountLab;
    UIImageView *liuYanIcon;
    UILabel *liulanCountLab;
    UIImageView *liulanIcon;
}
@end

@implementation QLTieBaUserInfoCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(16, 15, 20, 20)];
    iconImg.layer.cornerRadius = 10;
    iconImg.layer.masksToBounds = YES;
    [self.contentView addSubview:iconImg];
    
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right+10, 19, 0, 12)];
    userNameLab.font = WTFontSys(12);
    userNameLab.numberOfLines = 0;
    userNameLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:userNameLab];

    //留言数
    liuYanCountLab = [[UILabel alloc] initWithFrame:CGRectMake(WTScreenWidth-16, 21, 9, 7)];
    liuYanCountLab.font = WTFontSys(10);
    liuYanCountLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:liuYanCountLab];
    
    liuYanIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 10, 10)];
    [liuYanIcon setImage:[UIImage imageNamed:@"liuyan"]];
    [self.contentView addSubview:liuYanIcon];
    //浏览数
    liulanCountLab = [[UILabel alloc] initWithFrame:CGRectMake(WTScreenWidth-12, 21, 9, 7)];
    liulanCountLab.font = WTFontSys(10);
    liulanCountLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:liulanCountLab];
    
    liulanIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 10, 10)];
    [liulanIcon setImage:[UIImage imageNamed:@"liulan"]];
    [self.contentView addSubview:liulanIcon];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [iconImg setWebImageWithUrl:[WTUtil strRelay:self.item.info[@"memberImage"]] placeHolder:[WTUtil createImageFromColor:QL_DateTextColor_Gray]];
    userNameLab.text = [WTUtil strRelay:self.item.info[@"memberName"]];
    [userNameLab sizeToFit];
    userNameLab.top = (50-userNameLab.height)/2;
    //留言数
    liuYanCountLab.text = [WTUtil strRelay:self.item.info[@"commentsNumber"]];
    [liuYanCountLab sizeToFit];
    liuYanCountLab.top = (50-liuYanCountLab.height)/2;
    liuYanCountLab.left = WTScreenWidth-16-liuYanCountLab.width;
    liuYanIcon.left = liuYanCountLab.left-5-10;
    //浏览数
    liulanCountLab.text = [WTUtil strRelay:self.item.info[@"browseNumber"]];
    [liulanCountLab sizeToFit];
    liulanCountLab.top = (50-liulanCountLab.height)/2;
    liulanCountLab.left = liuYanIcon.left-16-liulanCountLab.width;
    liulanIcon.left = liulanCountLab.left-5-10;
}
@end
