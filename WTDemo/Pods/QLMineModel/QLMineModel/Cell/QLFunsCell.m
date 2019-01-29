//
//  QLFunsCel.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLFunsCell.h"
#import "WTBaseCore.h"
#import "UIImageView+WebImage.h"
#import "QLMineNetWork.h"

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
    UIButton *guanZhuBtn;
    UIButton *mutualBtn;
}
@end

@implementation QLFunsCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    
    iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(16, 21, 48, 48)];
    iconImg.layer.cornerRadius = 24;
    iconImg.layer.masksToBounds = YES;
    [self.contentView addSubview:iconImg];
    
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right+13, 28, WTScreenWidth-iconImg.right-13-16, 13)];
    userNameLab.font = WTFontSys(14);
    userNameLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:userNameLab];

    cityLab = [[UILabel alloc] initWithFrame:CGRectMake(userNameLab.left, userNameLab.bottom+18, 20, 9)];
    cityLab.font = WTFontSys(10);
    cityLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:cityLab];

    ageSexLab = [[UILabel alloc] initWithFrame:CGRectMake(cityLab.right+16, cityLab.top, 20, 9)];
    ageSexLab.font = WTFontSys(10);
    ageSexLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:ageSexLab];

    [self createGuanZhu];
    [self createMutual];
    
    UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 92, WTScreenWidth, 1)];
    lineImg.backgroundColor = WTColorHex(0xEEEEE5);
    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [iconImg setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
    userNameLab.text = [WTUtil strRelay:self.item.info[@"nickName"]];
    cityLab.text = @"合肥";//[WTUtil strRelay:self.item.info[@"city"]];
    [cityLab sizeToFit];
    
    ageSexLab.left = cityLab.right+16;
    if ([[WTUtil strRelay:self.item.info[@"identity"]] intValue]==1) {
        ageSexLab.text = @"奶爸";
    } else {
        ageSexLab.text = @"奶妈";
    }
    [ageSexLab sizeToFit];
    
    guanZhuBtn.hidden = NO;
    mutualBtn.hidden = YES;
    if ([[WTUtil strRelay:self.item.info[@"isMutual"]] boolValue]) {
        guanZhuBtn.hidden = YES;
        mutualBtn.hidden = NO;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)createGuanZhu {
    guanZhuBtn = [[UIButton alloc] initWithFrame:CGRectMake(WTScreenWidth-60-16, 31.5, 60, 28)];
    guanZhuBtn.layer.borderColor = QL_Border_LineColor.CGColor;
    guanZhuBtn.layer.borderWidth = 0.5;
    [guanZhuBtn setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [guanZhuBtn addTarget:self action:@selector(guanZhuBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:guanZhuBtn];
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(9, 8, 12, 12)];
    [imgV setImage:[UIImage imageNamed:@"add"]];
    [guanZhuBtn addSubview:imgV];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(imgV.right+5, 8, 40, 12)];
    titleLab.font = WTFontSys(12);
    titleLab.textColor = QL_UserName_TitleColor_Black;
    titleLab.text = @"关注";
    [guanZhuBtn addSubview:titleLab];
}

- (void)createMutual {
    mutualBtn = [[UIButton alloc] initWithFrame:CGRectMake(WTScreenWidth-84-16, 31.5, 84, 28)];
    mutualBtn.layer.borderColor = QL_Border_LineColor.CGColor;
    mutualBtn.layer.borderWidth = 0.5;
    [mutualBtn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateNormal];
    [mutualBtn addTarget:self action:@selector(guanZhuBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:mutualBtn];
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 8, 12, 12)];
    [imgV setImage:[UIImage imageNamed:@"huxiang"]];
    [mutualBtn addSubview:imgV];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(imgV.right+3, 8, 60, 12)];
    titleLab.font = WTFontSys(12);
    titleLab.textColor = QL_UserName_TitleColor_Black;
    titleLab.text = @"互相关注";
    [mutualBtn addSubview:titleLab];
}

- (void)guanZhuBtnPress {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:@"2" forKey:@"type"];
    [param setObject:[WTUtil strRelay:self.item.info[@"fansId"]] forKey:@"objectId"];
    [QLMineNetWork guanZhuUser:param successHandler:^(id json) {
        [WTToast makeText:@"关注成功"];
        if (self.item.guanZhuSuccess) {
            self.item.guanZhuSuccess();
        }
    } failHandler:^(NSString *message) {
        [WTToast makeText:@"关注失败"];
    }];
}
@end
