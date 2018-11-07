//
//  WTNavBar.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTBarItem : NSObject
@property (nonatomic, assign) int itemStyle;//0文字/1图片
@property (nonatomic, copy) NSString *itemTitle;
@property (nonatomic, copy) UIImage *itemImage;
@property (nonatomic, copy) UIColor *itemTextColor;
@property (nonatomic,assign) CGSize imgSize;

@property (copy, readwrite, nonatomic) void (^onClick)(void);
@end

@interface WTBarButton : UIButton
@property (nonatomic, strong) WTBarItem *barItem;
@end

//导航条
@interface WTNavBar : UIView
@property (nonatomic,copy) NSString *title;//标题
@property (nonatomic,copy) UIColor *titleColor;//标题颜色
@property (nonatomic,copy) UIFont *titleFont;//标题字体
@property (nonatomic,copy) UIColor *bgColor;//背景颜色

@property (nonatomic, copy) NSArray *rightItemList;
@property (nonatomic, copy) NSArray *leftItemList;
@end
