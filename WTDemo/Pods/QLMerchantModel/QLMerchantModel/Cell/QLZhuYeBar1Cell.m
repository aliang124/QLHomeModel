//
//  QLZhuYeBar1Cell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLZhuYeBar1Cell.h"
#import "UIImageView+WebImage.h"

@implementation QLZhuYeBar1Item
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 46;
        self.type = 0;
    }
    return self;
}

@end

@interface QLZhuYeBar1Cell()
{
    UIButton *btn1;
    UIButton *btn2;
}
@end

@implementation QLZhuYeBar1Cell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, WTScreenWidth/2, 46)];
    [btn1 setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [btn1 setTitle:@"商品服务" forState:UIControlStateNormal];
    [btn1 setTitleColor:QL_DescColor_Gray forState:UIControlStateNormal];
    [btn1 setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateSelected];
    [self.contentView addSubview:btn1];
    
    btn2 = [[UIButton alloc] initWithFrame:CGRectMake(btn1.width, 0, WTScreenWidth/2, 46)];
    [btn2 setTitleColor:QL_DescColor_Gray forState:UIControlStateNormal];
    [btn2 setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateSelected];
    [btn2 setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [btn2 setTitle:@"用户评价" forState:UIControlStateNormal];
    [self.contentView addSubview:btn2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    if (self.item.type==0) {
        btn1.selected = YES;
        btn1.titleLabel.font = WTFontBoldSys(14);
        btn2.selected = NO;
        btn2.titleLabel.font = WTFontSys(12);
    } else {
        btn1.selected = NO;
        btn1.titleLabel.font = WTFontSys(12);
        btn2.selected = YES;
        btn2.titleLabel.font = WTFontBoldSys(14);
    }
}

@end
