//
//  QLMerchantTagStarCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMerchantTagStarCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLMerchantTagStarItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 16;
    }
    return self;
}

@end

@interface QLMerchantTagStarCell()
{
    UIView *bgView;
    UIView *starView;
    UIView *tipView;

    UILabel *tagLab;
    UIImageView *starImg1;
    UIImageView *starImg2;
    UIImageView *starImg3;
    UIImageView *starImg4;
    UIImageView *starImg5;
}
@end

@implementation QLMerchantTagStarCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 16)];
    bgView.layer.cornerRadius = 8;
    bgView.layer.borderWidth = 0.5;
    bgView.backgroundColor = QL_NavBar_BgColor_Yellow;
    bgView.layer.borderColor = QL_Border_LineColor.CGColor;
    [self.contentView addSubview:bgView];
    
    starView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 16)];
    starView.backgroundColor = [UIColor whiteColor];
    starView.layer.cornerRadius = 8;
    starView.layer.borderWidth = 0.5;
    starView.layer.borderColor = QL_Border_LineColor.CGColor;
    [self.contentView addSubview:starView];

    tipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0.5, 8, 15)];
    tipView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:tipView];

    tagLab = [[UILabel alloc] initWithFrame:CGRectMake(9, 3.5, 0, 9)];
    tagLab.font = WTFontSys(10);
    tagLab.textColor = QL_UserName_TitleColor_Black;
    [bgView addSubview:tagLab];
    
    starImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 3.5, 9, 9)];
    [starImg1 setImage:[UIImage imageNamed:@"starYellow"]];
    [starView addSubview:starImg1];

    starImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(starImg1.right+4, 3.5, 9, 9)];
    [starImg2 setImage:[UIImage imageNamed:@"starYellow"]];
    [starView addSubview:starImg2];

    starImg3 = [[UIImageView alloc] initWithFrame:CGRectMake(starImg2.right+4, 3.5, 9, 9)];
    [starImg3 setImage:[UIImage imageNamed:@"starYellow"]];
    [starView addSubview:starImg3];

    starImg4 = [[UIImageView alloc] initWithFrame:CGRectMake(starImg3.right+4, 3.5, 9, 9)];
    [starImg4 setImage:[UIImage imageNamed:@"starYellow"]];
    [starView addSubview:starImg4];

    starImg5 = [[UIImageView alloc] initWithFrame:CGRectMake(starImg4.right+4, 3.5, 9, 9)];
    [starImg5 setImage:[UIImage imageNamed:@"starYellow"]];
    [starView addSubview:starImg5];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    tagLab.text = @"西餐";
    [tagLab sizeToFit];
    tagLab.top = (16-tagLab.height)/2;
    
    float xingWidth = 81;
    float totalWidth = tagLab.width+9+9+xingWidth;
    bgView.width = totalWidth;
    bgView.left = (WTScreenWidth-totalWidth)/2;
    
    starView.left = bgView.left+tagLab.right+9;
    starView.width = xingWidth;
    tipView.left = starView.left;
    
    starImg1.left = 7;
    starImg2.left = starImg1.right+4;
    starImg3.left = starImg2.right+4;
    starImg4.left = starImg3.right+4;
    starImg5.left = starImg4.right+4;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
