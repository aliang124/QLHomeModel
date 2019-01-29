//
//  QLPingJiaDianZanCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLPingJiaDianZanCell.h"
#import "UIImageView+WebImage.h"

@implementation QLPingJiaDianZanItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 52;
        self.isHuiFuTitle = NO;
    }
    return self;
}

@end

@interface QLPingJiaDianZanCell()
{
    UIImageView *iconImg;
    UILabel *titleLab;
    UIImageView *lineImg;
}
@end

@implementation QLPingJiaDianZanCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 16, 20, 20)];
    [iconImg setImage:[UIImage imageNamed:@"dianzan"]];
    [self.contentView addSubview:iconImg];
    
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(41, 19, 200, 14)];
    titleLab.font = WTFontSys(14);
    titleLab.textColor = QL_DescColor_Gray;
    [self.contentView addSubview:titleLab];
    
    lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WTScreenWidth, 0.5)];
    lineImg.backgroundColor = QL_TableView_LineColor;
    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    titleLab.frame = CGRectMake(41, 19, 200, 14);
    self.item.cellHeight = 52;
    if (self.item.isHuiFuTitle) {
        iconImg.hidden = YES;
        lineImg.hidden = NO;
        lineImg.top = 41.5;
        titleLab.text = [NSString stringWithFormat:@"评价回复 （%@）",[WTUtil strRelay:self.item.count]];
        self.item.cellHeight = 42;
        titleLab.frame = CGRectMake(12, 14, WTScreenWidth-12-12, 14);
    } else {
        iconImg.hidden = NO;
        lineImg.hidden = YES;
        titleLab.text = [NSString stringWithFormat:@"点赞 （%@）",[WTUtil strRelay:self.item.count]];
        [self createUsers];
    }
}

- (void)createUsers {
    for (UIView *subView in self.contentView.subviews) {
        if (subView.tag>=100) {
            [subView removeFromSuperview];
        }
    }
    
    float offsetX = 0;
    for (int i = 0; i < 4; i++) {
        offsetX = WTScreenWidth-12-24-(21*i);
        
        UIImageView *userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, 14, 24, 24)];
        [userIcon setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1542593731&di=392abf890c5d3d1e8ae849cb0091500c&imgtype=jpg&er=1&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F960a304e251f95cada6c0462c3177f3e6609524c.jpg" placeHolder:nil];
        userIcon.layer.cornerRadius = 12;
        userIcon.layer.masksToBounds = YES;
        userIcon.tag = 100+i;
        [self.contentView addSubview:userIcon];
    }
}
@end
