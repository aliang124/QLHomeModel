//
//  QLMerchantTitleCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMerchantProductsCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"

@implementation QLMerchantProductsItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = (QL_MULPITLE*134);
    }
    return self;
}

@end

@interface QLMerchantProductsCell()
{
    UIScrollView *contentScrollView;
}
@end

@implementation QLMerchantProductsCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WTScreenWidth, self.height)];
    contentScrollView.showsVerticalScrollIndicator = NO;
    contentScrollView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:contentScrollView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    contentScrollView.height = self.item.cellHeight;
    [contentScrollView removeAllSubviews];
    float contentWidth = QL_MULPITLE * ((self.item.productArray.count*120)+(self.item.productArray.count+1)*12);
    [contentScrollView setContentSize:CGSizeMake(contentWidth, contentScrollView.height)];
    
    float offsetX = 12;
    for (int i = 0; i < self.item.productArray.count; i++) {
        offsetX = 12+(i*120)+(i*12);
        NSDictionary *dic = self.item.productArray[i];
        
        UIButton *productBtn = [[UIButton alloc] initWithFrame:CGRectMakes(offsetX, 12, 120, 110)];
        [contentScrollView addSubview:productBtn];

        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMakes(0, 0, 120, 92)];
        [imageV setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
        [productBtn addSubview:imageV];
        
        UIView *priceBgView = [[UIView alloc] initWithFrame:CGRectMakes(0, 92-22, 120, 22)];
        priceBgView.userInteractionEnabled = NO;
        priceBgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        [productBtn addSubview:priceBgView];

        UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMakes(0, 0, 120-6, 22)];
        priceLabel.font = [UIFont systemFontOfSize:12*QL_MULPITLE];
        priceLabel.textColor = [UIColor whiteColor];
        priceLabel.text = @"$12.0";
        priceLabel.textAlignment = NSTextAlignmentRight;
        [priceBgView addSubview:priceLabel];

        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMakes(0, 99, 120, 11)];
        nameLabel.font = [UIFont systemFontOfSize:12*QL_MULPITLE];
        nameLabel.textColor = QL_DescColor_Gray;
        nameLabel.text = @"儿童海鲜炒饭";
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [productBtn addSubview:nameLabel];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
