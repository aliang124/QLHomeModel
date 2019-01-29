//
//  WTLoadingView1.h
//  WTDemo
//
//  Created by 计恩良 on 2018/11/18.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTLoadingView1 : UIView
// 便利方法
+ (void)showLoadingInView:(UIView *)view;
+ (void)showLoadingInView:(UIView *)view top:(float)top;
+ (void)hideAllLoadingForView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
