//
//  WTLoadFailView.h
//  WTDemo
//
//  Created by 计恩良 on 2018/11/18.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTLoadFailView : UIView
@property(nonatomic,copy) void  (^retryPress)(void);

// 便利方法
+ (void)showFailInView:(UIView *)view retryPress:(void (^)(void))retry;
+ (void)hideAllFailForView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
