//
//  WTCustomNavBar.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#define Line_Height  (1 / [UIScreen mainScreen].scale)
#define ColorHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//判断是否是iphoneX
#define isIPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#import "WTCustomNavBar.h"
#import "NarBarUtil.h"

@implementation WTCustomNavBar {
    UILabel *titleLab;
    UIImageView *lineImg;
}

- (id)init {
    self = [super init];
    if (self){
        self.navBarTitleHeight = 44;
        self.statusBarHeight = isIPhoneX ? 44.0f : 20.0f;
        
        self.titleFont = [UIFont systemFontOfSize:18];
        self.titleColor = [UIColor blackColor];
        self.bgColor = ColorHex(0xfff8dc3d);
        
        titleLab = [[UILabel alloc] init];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.tag = 11;
        [self addSubview:titleLab];
        
        lineImg = [[UIImageView alloc] init];
        lineImg.tag = 12;
        [self addSubview:lineImg];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.frame = CGRectMake(0, 0, ScreenWidth, self.navBarTitleHeight+self.statusBarHeight);
    titleLab.frame = CGRectMake(50, self.frame.size.height-self.navBarTitleHeight, ScreenWidth-100, self.navBarTitleHeight);
    lineImg.frame = CGRectMake(0, self.statusBarHeight+self.navBarTitleHeight-Line_Height, ScreenWidth, Line_Height);
    
    self.backgroundColor = self.bgColor;
    if (self.lineColor) {
        lineImg.backgroundColor = self.lineColor;
    }
    
    titleLab.text = [NarBarUtil strRelay:self.title];
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
            WTCustomBarItem *it = self.leftItemList[i];
            UIButton *btn = nil;
            if (it.itemStyle == 1) {
                btn = [self createImgBtn:it];
            } else if (it.itemStyle == 0) {
                btn = [self createTitleBtn:it];
            }
            btn.frame = CGRectMake(offsetX,btn.frame.origin.y, btn.frame.size.width, btn.frame.size.height);
            offsetX = btn.frame.origin.x + btn.frame.size.width;
            [self addSubview:btn];
        }
    }

    offsetX = ScreenWidth;
    if (self.rightItemList&&[self.rightItemList count]>0) {
        for (int i = 0; i < self.rightItemList.count; i++) {
            WTCustomBarItem *it = self.rightItemList[i];
            WTCustomBarButton *btn = nil;
            if (it.itemStyle == 1) {
                btn = [self createImgBtn:it];
            } else if (it.itemStyle == 0) {
                btn = [self createTitleBtn:it];
            }
            btn.frame = CGRectMake(offsetX-btn.frame.size.width, btn.frame.origin.y, btn.frame.size.width, btn.frame.size.height);
            offsetX = btn.frame.origin.x;
            [self addSubview:btn];
        }
    }
}

- (WTCustomBarButton *)createImgBtn:(WTCustomBarItem *)item {
    float offsetX = (50-item.imgSize.width)/2;
    float offsetY = (self.navBarTitleHeight-item.imgSize.height)/2;
    
    WTCustomBarButton *btn = [[WTCustomBarButton alloc] initWithFrame:CGRectMake(0, self.frame.size.height-self.navBarTitleHeight, 50, self.navBarTitleHeight)];
    [btn setImage:item.itemImage forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(offsetY, offsetX, offsetY, offsetX)];
    btn.barItem = item;
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)btnPress:(WTCustomBarButton *)btn {
    if (btn.barItem.onClick) {
        btn.barItem.onClick();
    }
}

- (WTCustomBarButton *)createTitleBtn:(WTCustomBarItem *)item {
    UIColor *ccc = [UIColor clearColor];
    CGSize sz = [NarBarUtil sizeForFont:item.itemTitle Font:item.itemTextFont CtrlSize:CGSizeMake(MAXFLOAT, self.navBarTitleHeight)];
    float w = sz.width + 8 + 8;
    if (w < 50) {
        w = 50;
    }
    WTCustomBarButton *btn = [[WTCustomBarButton alloc] initWithFrame:CGRectMake(0, self.frame.size.height-self.navBarTitleHeight, w, self.navBarTitleHeight)];
    [btn setTitle:item.itemTitle forState:UIControlStateNormal];
    [btn setBackgroundImage:[NarBarUtil createImageFromColor:ccc] forState:UIControlStateNormal];
    [btn setBackgroundImage:[NarBarUtil createImageFromColor:item.itemHighlightBackgroundColor] forState:UIControlStateHighlighted];
    [btn setTitleColor:item.itemTextColor forState:UIControlStateNormal];
    btn.titleLabel.font = item.itemTextFont;
    btn.barItem = item;
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
@end
