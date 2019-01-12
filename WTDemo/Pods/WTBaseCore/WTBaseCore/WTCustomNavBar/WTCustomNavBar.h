//
//  WTCustomNavBar.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTCustomBarItem.h"
//导航条
@interface WTCustomNavBar : UIView
@property (nonatomic,copy) NSString *title;//标题
@property (nonatomic,copy) UIColor *titleColor;//标题颜色
@property (nonatomic,copy) UIFont *titleFont;//标题字体
@property (nonatomic,copy) UIColor *bgColor;//背景颜色
@property (nonatomic,copy) UIColor *lineColor;//底部线条颜色

@property (nonatomic, copy) NSArray *rightItemList;
@property (nonatomic, copy) NSArray *leftItemList;


//状态栏区域高度，如果是iPhoneX加上刘海区域高度
@property (nonatomic,assign) float statusBarHeight;
//实际操作title区域和按钮区域高度
@property (nonatomic,assign) float navBarTitleHeight;

@end
