//
//  QLMerchantView.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/28.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLMerchantView.h"

@interface QLMerchantView () {
    UIButton *bgView;
    UIImageView *iconImg;
    UILabel *nameLab;
    UILabel *tagLab;
    UILabel *addressLab;
}
@end

@implementation QLMerchantView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        bgView = [[UIButton alloc] initWithFrame:CGRectMake(12, 0, self.width-12-12, 76)];
        bgView.layer.cornerRadius = 3;
        bgView.layer.masksToBounds = YES;
        bgView.backgroundColor = WTColorHex(0xFAFAF7);
        bgView.layer.borderWidth = 1;
        bgView.layer.borderColor = WTColorHex(0xE4E4DA).CGColor;
        bgView.userInteractionEnabled = NO;
        [self addSubview:bgView];
        
        iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 80, 60)];
        [bgView addSubview:iconImg];
        
        nameLab = [[UILabel alloc] initWithFrame:CGRectMake(iconImg.right+10, 15, bgView.width-iconImg.right-10-10, 13)];
        nameLab.font = WTFontBoldSys(14);
        nameLab.textColor = QL_UserName_TitleColor_Black;
        [bgView addSubview:nameLab];
        
        //下面布局
        tagLab = [[UILabel alloc] initWithFrame:CGRectMake(nameLab.left, 48, 10, 14)];
        tagLab.font = WTFontSys(10);
        tagLab.textColor = QL_TagTextColor_Green;
        tagLab.backgroundColor = WTColorHex(0xE5FBF7);
        tagLab.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:tagLab];
        
        addressLab = [[UILabel alloc] initWithFrame:CGRectMake(nameLab.left, 50, nameLab.width, 9)];
        addressLab.font = WTFontSys(10);
        addressLab.textColor = QL_DescColor_Gray;
        [bgView addSubview:addressLab];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    nameLab.text = @"Lunaluz露娜家亲子餐厅";
    [iconImg setWebImageWithUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547976453468&di=0730fb64aadc80b0f2490a430f51aebb&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201105%2F31%2F20110531094303_d5JZB.jpg" placeHolder:nil];
    //下面的布局
    tagLab.text = @"西餐";
    [tagLab sizeToFit];
    tagLab.width = tagLab.width + 8;
    tagLab.height = 14;
    //
    addressLab.left = tagLab.right+5;
    addressLab.text = @"西城区西直门外大街1号购物中心B1层...";
}
@end
