//
//  QLMerchantTitleCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMerchantTitleCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLMerchantTitleItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 32;
        self.currentIndex = 0;
    }
    return self;
}

@end

@interface QLMerchantTitleCell()
{
    UIButton *goodBtn;
    UIButton *pingJiaBtn;
    UIButton *qinziBtn;
}
@end

@implementation QLMerchantTitleCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    float width = WTScreenWidth/3;
    
    goodBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width, 32)];
    [goodBtn setTitle:@"商品服务" forState:UIControlStateNormal];
    [goodBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    [self.contentView addSubview:goodBtn];

    pingJiaBtn = [[UIButton alloc] initWithFrame:CGRectMake(goodBtn.right, 0, width, 32)];
    [pingJiaBtn setTitle:@"用户评价" forState:UIControlStateNormal];
    [pingJiaBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    [self.contentView addSubview:pingJiaBtn];

    qinziBtn = [[UIButton alloc] initWithFrame:CGRectMake(pingJiaBtn.right, 0, width, 32)];
    [qinziBtn setTitle:@"周边亲子" forState:UIControlStateNormal];
    [qinziBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    [self.contentView addSubview:qinziBtn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    if (self.item.currentIndex==0) {
        goodBtn.titleLabel.font = WTFontBoldSys(14);
        qinziBtn.titleLabel.font = WTFontSys(12);
        pingJiaBtn.titleLabel.font = WTFontSys(12);
    } else if (self.item.currentIndex==1) {
        qinziBtn.titleLabel.font = WTFontBoldSys(14);
        goodBtn.titleLabel.font = WTFontSys(12);
        pingJiaBtn.titleLabel.font = WTFontSys(12);
    } else if (self.item.currentIndex==2) {
        pingJiaBtn.titleLabel.font = WTFontBoldSys(14);
        goodBtn.titleLabel.font = WTFontSys(12);
        qinziBtn.titleLabel.font = WTFontSys(12);
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
