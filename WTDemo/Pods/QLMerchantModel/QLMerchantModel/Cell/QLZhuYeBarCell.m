//
//  QLTieBaShopCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLZhuYeBarCell.h"
#import "UIImageView+WebImage.h"

@implementation QLZhuYeBarItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 48;
    }
    return self;
}

@end

@interface QLZhuYeBarCell()
{
}
@end

@implementation QLZhuYeBarCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    UIView *yingyin = [[UIView alloc] initWithFrame:CGRectMake(12, 0, WTScreenWidth-12-12, 48)];
    yingyin.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:yingyin];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, yingyin.width/2, 48)];
    [btn1 setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [yingyin addSubview:btn1];

    UIImageView *iconImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 13.5, 21, 21)];
    [iconImg1 setImage:[UIImage imageNamed:@"guanzhuHeart"]];
    [btn1 addSubview:iconImg1];
    
    UILabel *titleTextLab1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 13)];
    titleTextLab1.text = @"关注TA";
    titleTextLab1.font = WTFontSys(14);
    titleTextLab1.textColor = QL_UserName_TitleColor_Black;
    [btn1 addSubview:titleTextLab1];
    [titleTextLab1 sizeToFit];
    
    float totalW1 = titleTextLab1.width+21+11;
    iconImg1.left = (btn1.width-totalW1)/2;
    titleTextLab1.left = iconImg1.right+11;
    titleTextLab1.top = (btn1.height-titleTextLab1.height)/2;
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(btn1.width, 0, yingyin.width/2, 48)];
    [btn2 setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [yingyin addSubview:btn2];

    UIImageView *iconImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 13.5, 21, 21)];
    [iconImg2 setImage:[UIImage imageNamed:@"sixin"]];
    [btn2 addSubview:iconImg2];

    UILabel *titleTextLab2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 13)];
    titleTextLab2.text = @"私信TA";
    titleTextLab2.font = WTFontSys(14);
    titleTextLab2.textColor = QL_UserName_TitleColor_Black;
    [btn2 addSubview:titleTextLab2];
    [titleTextLab2 sizeToFit];
    
    float totalW2 = titleTextLab2.width+21+11;
    iconImg2.left = (btn2.width-totalW2)/2;
    titleTextLab2.left = iconImg2.right+11;
    titleTextLab2.top = (btn2.height-titleTextLab2.height)/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
}

@end
