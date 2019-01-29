//
//  QLTieBaShopCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLPingJiaScoreCell.h"
#import "UIImageView+WebImage.h"
#import "QLStarView.h"

@implementation QLPingJiaScoreItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 28;
    }
    return self;
}

@end

@interface QLPingJiaScoreCell()
{
    QLStarView *starView;
    UILabel *scoreLab;
}
@end

@implementation QLPingJiaScoreCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    UILabel *pingFenLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 8, 100, 9)];
    pingFenLab.font = WTFontSys(10);
    pingFenLab.text = @"评分:";
    pingFenLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:pingFenLab];
    [pingFenLab sizeToFit];
    pingFenLab.top = 7;
    
    starView = [[QLStarView alloc] initWithOrgPoint:CGPointMake(pingFenLab.right+7, 7)];
    [self.contentView addSubview:starView];
    
    scoreLab = [[UILabel alloc] initWithFrame:CGRectMake(starView.right+11, 7, 100, 9)];
    scoreLab.font = WTFontSys(10);
    scoreLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:scoreLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    double starCount = [[WTUtil strRelay:self.item.scoreText] doubleValue];
    starView.starCount = (int)starCount;
    scoreLab.text = [NSString stringWithFormat:@"%0.1f",starCount];
}
@end
