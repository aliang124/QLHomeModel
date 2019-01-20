//
//  QLHomeCategoryCell.h
//  QLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLHomeCategoryCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLHomeCategoryItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 176*QL_MULPITLE;
    }
    return self;
}

@end

@interface QLHomeCategoryCell()
{
}
@end

@implementation QLHomeCategoryCell

- (void)cellDidLoad
{
    [super cellDidLoad];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [self.contentView removeAllSubviews];
    
    float top = 22;
    float offsetX = 32;
    float widthHeight = 44;
    float offsetBtn = 40;
    for (int i = 0; i < self.item.datas.count; i++) {
        NSDictionary *dic = self.item.datas[i];
        offsetX = 32+(offsetBtn * (i%4))+(i%4)*widthHeight;

        int xxxx = i/4;
        top = 22+(xxxx*56)+(xxxx*18);

        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMakes(offsetX, top, widthHeight, 56)];
        [btn addTarget:self action:@selector(iconBtnPress:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self.contentView addSubview:btn];
        
        UIImageView *iconImg = [[UIImageView alloc] initWithFrame:CGRectMakes(0, 0, widthHeight, widthHeight)];
        [iconImg setImage:[UIImage imageNamed:dic[@"icon"]]];
        [btn addSubview:iconImg];
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMakes(0, widthHeight+3, btn.width, 9)];
        titleLab.font = WTFontSys(10);
        titleLab.textColor = QL_DateTextColor_Gray;
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.text = [WTUtil strRelay:dic[@"title"]];
        [btn addSubview:titleLab];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)iconBtnPress:(UIButton *)btn {
    if (self.item.iconPressHandler) {
        self.item.iconPressHandler(self.item.datas[btn.tag]);
    }
}
@end
