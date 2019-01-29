//
//  QLMerchantTitleCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLPingJiaListCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"
#import "QLStarView.h"

@implementation QLPingJiaListItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 100;
    }
    return self;
}

@end

@interface QLPingJiaListCell()
{
    //用户信息
    UIView *userInfoView;
    UIImageView *userIcon;
    UILabel *userNameLab;
    UILabel *dateLab;
    //
    UIView *headPingJiaView;
    QLStarView *starView;
    UILabel *scoreLab;
    UILabel *descLab;
    
    //底部
    UIView *bottomView;
    UILabel *liuYanCountLab;
    UIImageView *liuYanIcon;
    UILabel *liulanCountLab;
    UIImageView *liulanIcon;
    
    UIImageView *lineImg;
}
@end

@implementation QLPingJiaListCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    //用户头像区域
    [self createUserInfoView];
    [self createSocreArea];
    [self createDescLab];
    [self createBottomView];
    
    lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 0, WTScreenWidth-12-12, 0.5)];
    lineImg.backgroundColor = QL_Border_LineColor;
    [self.contentView addSubview:lineImg];
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [self setUserInfo];
    [self setScoreAreaValue];

    descLab.text = [WTUtil strRelay:self.item.descText];
    [descLab sizeToFit];

    [self createPictures];
    float pictureHeight = 0;
    if (self.item.pictureArray.count>0) {
        pictureHeight = (88*QL_MULPITLE)+8;
    }
    self.item.cellHeight = descLab.bottom+pictureHeight+28;
    bottomView.top = self.item.cellHeight-28;
    [self setBottomView];
    lineImg.top = self.item.cellHeight-0.5;
}

- (void)createUserInfoView {
    userInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WTScreenWidth, 36)];
    userInfoView.userInteractionEnabled = NO;
    [self.contentView addSubview:userInfoView];
    
    userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(16, 8, 28, 28)];
    userIcon.layer.cornerRadius = 14;
    userIcon.layer.masksToBounds = YES;
    [userInfoView addSubview:userIcon];
    
    userNameLab = [[UILabel alloc] initWithFrame:CGRectMake(50, 15, WTScreenWidth-50-108, 11)];
    userNameLab.font = WTFontSys(12);
    userNameLab.textColor = QL_UserName_TitleColor_Black;
    [userInfoView addSubview:userNameLab];

    dateLab = [[UILabel alloc] initWithFrame:CGRectMake(WTScreenWidth-32-76, 19, 76, 9)];
    dateLab.font = WTFontSys(10);
    dateLab.textAlignment = NSTextAlignmentRight;
    dateLab.textColor = QL_DateTextColor_Gray;
    [userInfoView addSubview:dateLab];
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

- (void)setBottomView {
    //点赞数
    liuYanCountLab.text = [WTUtil strRelay:self.item.dianZanCount];
    [liuYanCountLab sizeToFit];
    liuYanCountLab.top = (bottomView.height-liuYanCountLab.height)/2;
    liuYanCountLab.left = WTScreenWidth-16-liuYanCountLab.width;
    
    liuYanIcon.top = 9;
    liuYanIcon.left = liuYanCountLab.left-15;
    //评论数
    liulanCountLab.text = [WTUtil strRelay:self.item.viewCount];
    liulanCountLab.top = 9;
    [liulanCountLab sizeToFit];
    liulanCountLab.left = liuYanIcon.left-16-liulanCountLab.width;
    
    liulanIcon.top = 9;
    liulanIcon.left = liulanCountLab.left-15;
}

- (void)createBottomView {
    bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WTScreenWidth, 28)];
    bottomView.userInteractionEnabled = NO;
    [self.contentView addSubview:bottomView];
    //留言数
    liuYanCountLab = [[UILabel alloc] initWithFrame:CGRectMake(WTScreenWidth-12, 9, 9, 7)];
    liuYanCountLab.font = WTFontSys(10);
    liuYanCountLab.textColor = QL_DescColor_Gray;
    [bottomView addSubview:liuYanCountLab];
    
    liuYanIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [liuYanIcon setImage:[UIImage imageNamed:@"liuyan"]];
    
    //浏览数
    liulanCountLab = [[UILabel alloc] initWithFrame:CGRectMake(WTScreenWidth-12, 9, 9, 7)];
    liulanCountLab.font = WTFontSys(10);
    liulanCountLab.textColor = QL_DescColor_Gray;
    [bottomView addSubview:liulanCountLab];
    
    liulanIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [liulanIcon setImage:[UIImage imageNamed:@"liulan"]];
    [bottomView addSubview:liulanIcon];
    
    [bottomView addSubview:liuYanIcon];
}

- (void)createPictures {
    [[self.contentView viewWithTag:12345] removeFromSuperview];
    if (self.item.pictureArray.count>0) {
        UIView *pictureView = [[UIView alloc] initWithFrame:CGRectMake(0, descLab.bottom+8, WTScreenWidth, 88*QL_MULPITLE)];
        pictureView.userInteractionEnabled = NO;
        pictureView.tag = 12345;
        [self.contentView addSubview:pictureView];
        
        float offsetX = 16;
        for (int i = 0; i < self.item.pictureArray.count; i++) {
            offsetX = 16+(i*100*QL_MULPITLE)+(i*14);
            
            UIButton *picBtn = [[UIButton alloc] initWithFrame:CGRectMake(offsetX, 0, 100*QL_MULPITLE, 88*QL_MULPITLE)];
            picBtn.backgroundColor = [UIColor redColor];
            [pictureView addSubview:picBtn];
        }
    }
}

- (void)createDescLab {
    descLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 62, WTScreenWidth-16-21, 12)];
    descLab.font = WTFontSys(12);
    descLab.textColor = QL_DescColor_Gray;
    descLab.numberOfLines = 0;
    [self.contentView addSubview:descLab];
}

- (void)createSocreArea {
    headPingJiaView = [[UIView alloc] initWithFrame:CGRectMake(0, userInfoView.bottom, WTScreenWidth, 26)];
    headPingJiaView.userInteractionEnabled = NO;
    [self.contentView addSubview:headPingJiaView];
    
    UILabel *pingFenLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 7, 100, 9)];
    pingFenLab.font = WTFontSys(10);
    pingFenLab.text = @"评分:";
    pingFenLab.textColor = QL_DescColor_Gray;
    [headPingJiaView addSubview:pingFenLab];
    [pingFenLab sizeToFit];
    pingFenLab.top = 7;
    
    starView = [[QLStarView alloc] initWithOrgPoint:CGPointMake(pingFenLab.right+7, 7)];
    [headPingJiaView addSubview:starView];
    
    scoreLab = [[UILabel alloc] initWithFrame:CGRectMake(starView.right+11, 7, 100, 9)];
    scoreLab.font = WTFontSys(10);
    scoreLab.textColor = QL_DescColor_Gray;
    [headPingJiaView addSubview:scoreLab];
}

- (void)setScoreAreaValue {
    double starCount = [[WTUtil strRelay:self.item.scoreText] doubleValue];
    starView.starCount = (int)starCount;
    scoreLab.text = [NSString stringWithFormat:@"%0.1f",starCount];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

@end
