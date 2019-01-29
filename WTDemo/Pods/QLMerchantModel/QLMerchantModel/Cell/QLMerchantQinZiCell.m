//
//  QLMerchantQinZiCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMerchantQinZiCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"
#import "QLStarView.h"
@implementation QLMerchantQinZiItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 34*QL_MULPITLE;
    }
    return self;
}

@end

@interface QLMerchantQinZiCell()
{
}
@end

@implementation QLMerchantQinZiCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    int xxx = (int)self.item.qinZiArray.count/2;
    if (self.item.qinZiArray.count%2!=0) {
        xxx = xxx + 1;
    }
    self.item.cellHeight = (16+12+(160*xxx)+(xxx-1)*12)*QL_MULPITLE;
    
    [self.contentView removeAllSubviews];
    float offsetY = 16;
    float offsetX = 12;
    for (int i = 0; i < self.item.qinZiArray.count; i++) {
        int yyy = i/2;
        int xxx = i%2;
        
        offsetY = 16+(160*yyy)+(12*yyy);
        offsetX = 12+(162*xxx)+(12*xxx);
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMakes(offsetX, offsetY, 162, 160)];
        btn.layer.cornerRadius = 2;
        btn.layer.borderColor = QL_Border_LineColor.CGColor;
        btn.layer.borderWidth = 0.5;
        [self.contentView addSubview:btn];
        
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMakes(0, 0, 162, 100)];
        [imageV setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
        [btn addSubview:imageV];
        
        UILabel *tagLab = [[UILabel alloc] init];
        tagLab.font = WTFontSys(10);
        tagLab.textColor = QL_TagTextColor_Green;
        tagLab.backgroundColor = QL_TagColor_Green;
        tagLab.text = @"西餐";
        tagLab.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:tagLab];
        [tagLab sizeToFit];
        tagLab.frame = CGRectMakes(8, 106, tagLab.width+(10*QL_MULPITLE), 14*QL_MULPITLE);
        
        UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(tagLab.right+6, tagLab.top, btn.width-tagLab.right-6, tagLab.height)];
        titleLab.font = WTFontBoldSys(10);
        titleLab.textColor = QL_UserName_TitleColor_Black;
        titleLab.text = @"Lunaluz露娜家亲子餐厅";
        [btn addSubview:titleLab];
        
        CGPoint pt = CGPointMake(8*QL_MULPITLE, 121*QL_MULPITLE);
        QLStarView *starView = [[QLStarView alloc] initWithPoint:pt];
        starView.starCount = 4;
        [btn addSubview:starView];
        
        UILabel *scoreLab = [[UILabel alloc] initWithFrame:CGRectMake(starView.right+6, starView.top, 40, starView.height)];
        scoreLab.font = WTFontSys(10);
        scoreLab.textColor = QL_DescColor_Gray;
        scoreLab.text = @"3.7";
        [btn addSubview:scoreLab];

        UILabel *ageLab = [[UILabel alloc] initWithFrame:CGRectMakes(0, 127, 154, 9)];
        ageLab.font = WTFontSys(10);
        ageLab.textColor = QL_DescColor_Gray;
        ageLab.textAlignment = NSTextAlignmentRight;
        ageLab.text = @"0-9岁";
        [btn addSubview:ageLab];
        
        UILabel *addressLab = [[UILabel alloc] initWithFrame:CGRectMakes(8, 142, 154, 10)];
        addressLab.font = WTFontSys(10);
        addressLab.textColor = QL_DescColor_Gray;
        addressLab.text = @"宁国路商业区";
        [btn addSubview:addressLab];
        
        UILabel *distanceLab = [[UILabel alloc] initWithFrame:CGRectMakes(0, 142, 154, 10)];
        distanceLab.font = WTFontSys(10);
        distanceLab.textColor = QL_DescColor_Gray;
        distanceLab.text = @"1.8km";
        distanceLab.textAlignment = NSTextAlignmentRight;
        [btn addSubview:distanceLab];
    }
}

@end
