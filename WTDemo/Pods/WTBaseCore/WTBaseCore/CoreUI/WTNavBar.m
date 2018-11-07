//
//  WTNavBar.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "WTNavBar.h"
#import "WTUtil.h"
#import "WTDefine.h"
#import "UIView+Category.h"
#import "NSString+Category.h"

@implementation WTBarItem

- (id)init {
    if (self = [super init]) {
        self.imgSize = CGSizeMake(20, 20);
        self.itemTextColor = [UIColor whiteColor];
    }
    return self;
}
@end

@implementation WTNavBar {
    UILabel *titleLab;
    UIImageView *lineImg;
}

- (id)init {
    self = [super initWithFrame:CGRectMake(0, 0, WTScreenWidth, WT_NavBar_Height)];
    if (self){
        self.titleFont = WTFontSys(18);
        self.titleColor = [UIColor whiteColor];
        self.bgColor = WT_Color_BlueColor;

        titleLab = [[UILabel alloc] initWithFrame:CGRectMake(50, self.height-44, WTScreenWidth-100, 44)];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.tag = 11;
        [self addSubview:titleLab];
        
        lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, WT_NavBar_Height-WT_Line_Height, WTScreenWidth, WT_Line_Height)];
        lineImg.backgroundColor = WT_Color_Line;
        lineImg.tag = 12;
        [self addSubview:lineImg];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = self.bgColor;
    titleLab.text = [WTUtil strRelay:self.title];
    titleLab.font = self.titleFont;
    titleLab.textColor = self.titleColor;

    for (UIView *v in [self subviews]) {
        if (v.tag!=11&&v.tag!=12) {
            [v removeFromSuperview];
        }
    }
    float offsetX = 0;
    if (self.leftItemList&&[self.leftItemList count]>0) {
        for (int i = 0; i < self.leftItemList.count; i++) {
            WTBarItem *it = self.leftItemList[i];
            UIButton *btn = nil;
            if (it.itemStyle == 1) {
                btn = [self createImgBtn:it];
            } else if (it.itemStyle == 0) {
                btn = [self createTitleBtn:it];
            }
            btn.left = offsetX;
            offsetX = btn.right;
            [self addSubview:btn];
        }
    }

    offsetX = WTScreenWidth;
    if (self.rightItemList&&[self.rightItemList count]>0) {
        for (int i = 0; i < self.rightItemList.count; i++) {
            WTBarItem *it = self.rightItemList[i];
            WTBarButton *btn = nil;
            if (it.itemStyle == 1) {
                btn = [self createImgBtn:it];
            } else if (it.itemStyle == 0) {
                btn = [self createTitleBtn:it];
            }
            btn.left = offsetX-btn.width;
            offsetX = btn.left;
            [self addSubview:btn];
        }
    }
}

- (WTBarButton *)createImgBtn:(WTBarItem *)item {
    float offsetX = (50-item.imgSize.width)/2;
    float offsetY = (44-item.imgSize.height)/2;
    
    WTBarButton *btn = [[WTBarButton alloc] initWithFrame:CGRectMake(0, self.height-44, 50, 44)];
    [btn setImage:item.itemImage forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(offsetY, offsetX, offsetY, offsetX)];
    btn.barItem = item;
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)btnPress:(WTBarButton *)btn {
    if (btn.barItem.onClick) {
        btn.barItem.onClick();
    }
}

- (WTBarButton *)createTitleBtn:(WTBarItem *)item {
    UIColor *ccc = [UIColor clearColor];
    CGSize sz = [WTUtil sizeForFont:item.itemTitle Font:WTFontSys(15) CtrlSize:CGSizeMake(600, 44)];
    float w = sz.width+10+10;
    if (w<50) {
        w = 50;
    }
    float offsetX = (50-w)/2;
    
    WTBarButton *btn = [[WTBarButton alloc] initWithFrame:CGRectMake(0, self.height-44, w, 44)];
    [btn setTitle:item.itemTitle forState:UIControlStateNormal];
    [btn setBackgroundImage:[WTUtil createImageFromColor:ccc] forState:UIControlStateNormal];
    [btn setBackgroundImage:[WTUtil createImageFromColor:WTColor(231, 231, 231)] forState:UIControlStateHighlighted];
    [btn setTitleColor:item.itemTextColor forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, offsetX, 0, offsetX)];
    btn.titleLabel.font = WTFontSys(15);
    btn.barItem = item;
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
@end

@implementation WTBarButton
@end
