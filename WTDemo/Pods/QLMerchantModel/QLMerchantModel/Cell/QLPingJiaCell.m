//
//  QLMerchantTitleCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLPingJiaCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"
#import "QLStarView.h"

@implementation QLPingJiaItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 32;
    }
    return self;
}

@end

@interface QLPingJiaCell()
{
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

@implementation QLPingJiaCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    [self createSocreArea];
    [self createDescLab];
    [self createBottomView];
    
    lineImg = [[UIImageView alloc] initWithFrame:CGRectMakes(12, 0, 360-12-12, 0.5)];
    lineImg.backgroundColor = QL_Border_LineColor;
    [self.contentView addSubview:lineImg];

}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [self setScoreAreaValue];
    descLab.text = [WTUtil strRelay:self.item.info[@"comments"]];
    [descLab sizeToFit];
    [self createPictures];
    
    float pictureHeight = 0;
    if (self.item.pictureArray.count>0) {
        pictureHeight = 96*QL_MULPITLE;
    }
    self.item.cellHeight = descLab.bottom+pictureHeight+(28*QL_MULPITLE);
    
    bottomView.top = self.item.cellHeight- (28*QL_MULPITLE);
    [self setBottomView];
    lineImg.top = self.item.cellHeight-(0.5*QL_MULPITLE);
}

- (void)setBottomView {
    //评论数
    liuYanCountLab.text = [WTUtil strRelay:self.item.info[@"commentsNumber"]];
    [liuYanCountLab sizeToFit];
    liuYanCountLab.top = (bottomView.height-liuYanCountLab.height)/2;
    liuYanCountLab.left = WTScreenWidth-(16*QL_MULPITLE)-liuYanCountLab.width;
    
    liuYanIcon.top = 9*QL_MULPITLE;
    liuYanIcon.left = liuYanCountLab.left-(15*QL_MULPITLE);
    //点赞数
    liulanCountLab.text = [WTUtil strRelay:self.item.info[@"praiseNumber"]];
    liulanCountLab.top = 9*QL_MULPITLE;
    [liulanCountLab sizeToFit];
    liulanCountLab.left = liuYanIcon.left-(16*QL_MULPITLE)-liulanCountLab.width;
    
    liulanIcon.top = 9*QL_MULPITLE;
    liulanIcon.left = liulanCountLab.left-(15*QL_MULPITLE);
}

- (void)createBottomView {
    bottomView = [[UIView alloc] initWithFrame:CGRectMakes(0, 0, 360, 28)];
    bottomView.userInteractionEnabled = NO;
    [self.contentView addSubview:bottomView];
    //留言数
    liuYanCountLab = [[UILabel alloc] initWithFrame:CGRectMakes(360-12, 9, 9, 7)];
    liuYanCountLab.font = WTFontSys(10*QL_MULPITLE);
    liuYanCountLab.textColor = QL_DescColor_Gray;
    [bottomView addSubview:liuYanCountLab];
    
    liuYanIcon = [[UIImageView alloc] initWithFrame:CGRectMakes(0, 0, 10, 10)];
    [liuYanIcon setImage:[UIImage imageNamed:@"liuyan"]];
    [bottomView addSubview:liuYanIcon];

    //浏览数
    liulanCountLab = [[UILabel alloc] initWithFrame:CGRectMakes(360-12, 9, 9, 7)];
    liulanCountLab.font = WTFontSys(10*QL_MULPITLE);
    liulanCountLab.textColor = QL_DescColor_Gray;
    [bottomView addSubview:liulanCountLab];
    
    liulanIcon = [[UIImageView alloc] initWithFrame:CGRectMakes(0, 0, 10, 10)];
    [liulanIcon setImage:[UIImage imageNamed:@"liulan"]];
    [bottomView addSubview:liulanIcon];    
}

- (void)createPictures {
    [[self.contentView viewWithTag:12345] removeFromSuperview];
    if (self.item.pictureArray.count>0) {
        UIView *pictureView = [[UIView alloc] initWithFrame:CGRectMake(0, descLab.bottom+(8*QL_MULPITLE), WTScreenWidth, 88*QL_MULPITLE)];
        pictureView.userInteractionEnabled = NO;
        pictureView.tag = 12345;
        [self.contentView addSubview:pictureView];
        
        float offsetX = 16;
        for (int i = 0; i < self.item.pictureArray.count; i++) {
            offsetX = 16+(i*100)+(i*14);
            
            UIButton *picBtn = [[UIButton alloc] initWithFrame:CGRectMakes(offsetX, 0, 100, 88)];
            picBtn.backgroundColor = [UIColor redColor];
            [pictureView addSubview:picBtn];
        }
    }
}

- (void)createDescLab {
    descLab = [[UILabel alloc] initWithFrame:CGRectMakes(16, 32, 360-16-21, 12)];
    descLab.font = WTFontSys(QL_MULPITLE*12);
    descLab.textColor = QL_DescColor_Gray;
    descLab.numberOfLines = 0;
    [self.contentView addSubview:descLab];
}

- (void)createSocreArea {
    headPingJiaView = [[UIView alloc] initWithFrame:CGRectMakes(0, 0, 360, 32)];
    headPingJiaView.userInteractionEnabled = NO;
    [self.contentView addSubview:headPingJiaView];
    
    UILabel *pingFenLab = [[UILabel alloc] initWithFrame:CGRectMakes(15, 0, 100, 32)];
    pingFenLab.font = WTFontSys(QL_MULPITLE*10);
    pingFenLab.text = @"评分:";
    pingFenLab.textColor = QL_DescColor_Gray;
    [headPingJiaView addSubview:pingFenLab];
    [pingFenLab sizeToFit];
    pingFenLab.top = (headPingJiaView.height-pingFenLab.height)/2;
    
    CGPoint pt = CGPointMake(pingFenLab.right+(7*QL_MULPITLE), 11.5*QL_MULPITLE);
    starView = [[QLStarView alloc] initWithPoint:pt];
    [headPingJiaView addSubview:starView];
    
    scoreLab = [[UILabel alloc] initWithFrame:CGRectMake(starView.right+11, 0, 100, headPingJiaView.height)];
    scoreLab.font = WTFontSys(QL_MULPITLE*10);
    scoreLab.textColor = QL_DescColor_Gray;
    [headPingJiaView addSubview:scoreLab];
}

- (void)setScoreAreaValue {
    double starCount = [[WTUtil strRelay:self.item.info[@"score"]] doubleValue];
    starView.starCount = (int)starCount;
    scoreLab.text = [NSString stringWithFormat:@"%0.1f",starCount];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

@end
