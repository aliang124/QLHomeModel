//
//  WTCustomBarItem.h
//  WTDemo
//
//  Created by 计恩良 on 2018/12/4.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WTCustomBarItem : NSObject
@property (nonatomic, assign) int itemStyle;//0文字/1图片
//itemStyle为0时设置文字属性
@property (nonatomic, copy) NSString *itemTitle;//按钮文字
@property (nonatomic, copy) UIColor *itemTextColor;//按钮文字颜色
@property (nonatomic, copy) UIFont *itemTextFont;//按钮文字字体
@property (nonatomic, copy) UIColor *itemHighlightBackgroundColor;//按钮高亮颜色
//itemStyle为1时设置图片属性
@property (nonatomic, copy) UIImage *itemImage;//图片
@property (nonatomic,assign) CGSize imgSize;//图片大小
//点击事件回调
@property (copy, readwrite, nonatomic) void (^onClick)(void);

@end

@interface WTCustomBarButton : UIButton
@property (nonatomic, strong) WTCustomBarItem *barItem;
@end
