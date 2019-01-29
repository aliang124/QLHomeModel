//
//  QLTieBaShopCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLPingJiaHuiFuCell.h"
#import "UIImageView+WebImage.h"
#import "QLStarView.h"

@implementation QLPingJiaHuiFuItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 50;
    }
    return self;
}

@end

@interface QLPingJiaHuiFuCell()
{
    UIImageView *userIcon;
    UILabel *userNameLab;
    UILabel *dateLab;
    UILabel *descLab;
    
    UIButton *zanBtn;
    UIImageView *zanIcon;
    UILabel *countLab;
    
    UIButton *replyBtn;
    UIImageView *lineImg;
}
@end

@implementation QLPingJiaHuiFuCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    [self createUserInfo];
    [self createDescLab];
    [self createBottomBtn];
    
    lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 0, WTScreenWidth-12-12, 0.5)];
    lineImg.backgroundColor = QL_TableView_LineColor;
    [self.contentView addSubview:lineImg];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [self setUserInfo];
    descLab.text = @"多谢评价，我下次去那边也试试。";
    [descLab sizeToFit];
    descLab.top = 45;
    replyBtn.top = descLab.bottom+7;
    zanBtn.top = replyBtn.top;
    [self setBottomInfo];
    self.item.cellHeight = replyBtn.bottom+12;
    lineImg.top = self.item.cellHeight-0.5;
}

- (void)setBottomInfo {
    countLab.text = @"1212";
    [countLab sizeToFit];
    float totalW = countLab.width+10+5;
    zanIcon.left = (zanBtn.width-totalW)/2;
    countLab.left = zanIcon.right+5;
}

- (void)createBottomBtn {
    replyBtn = [[UIButton alloc] initWithFrame:CGRectMake(WTScreenWidth-52-12, 0, 52, 22)];
    replyBtn.layer.cornerRadius = 2;
    replyBtn.layer.masksToBounds = YES;
    [replyBtn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateNormal];
    [replyBtn setTitle:@"回复" forState:UIControlStateNormal];
    [replyBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    replyBtn.titleLabel.font = WTFontSys(10);
    [self.contentView addSubview:replyBtn];

    zanBtn = [[UIButton alloc] initWithFrame:CGRectMake(WTScreenWidth-52-12-8-52, 0, 52, 22)];
    zanBtn.layer.borderWidth  = 0.5;
    zanBtn.layer.borderColor = QL_Border_LineColor.CGColor;
    zanBtn.layer.cornerRadius = 2;
    zanBtn.layer.masksToBounds = YES;
    [zanBtn setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [self.contentView addSubview:zanBtn];

    zanIcon = [[UIImageView alloc] initWithFrame:CGRectMake(7, 6, 10, 10)];
    [zanIcon setImage:[UIImage imageNamed:@"dianzan"]];
    [zanBtn addSubview:zanIcon];
    
    countLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 7, 100, 7)];
    countLab.font = WTFontSys(8);
    countLab.textColor = QL_DescColor_Gray;
    [zanBtn addSubview:countLab];
}

- (void)createDescLab {
    descLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 45, WTScreenWidth-13-12, 11)];
    descLab.font = WTFontSys(12);
    descLab.textColor = QL_DescColor_Gray;
    descLab.numberOfLines = 0;
    [self.contentView addSubview:descLab];
}

- (void)createUserInfo {
    userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 20, 20)];
    userIcon.layer.cornerRadius = 10;
    userIcon.layer.masksToBounds = YES;
    [self.contentView addSubview:userIcon];
    
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(40, 16, WTScreenWidth-40-88, 11)];
    userNameLab.font = WTFontSys(12);
    userNameLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:userNameLab];
    
    dateLab = [[UILabel alloc] initWithFrame:CGRectMake(WTScreenWidth-12-76, 18, 76, 9)];
    dateLab.font = WTFontSys(10);
    dateLab.textAlignment = NSTextAlignmentRight;
    dateLab.textColor = QL_DateTextColor_Gray;
    [self.contentView addSubview:dateLab];
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

@end
