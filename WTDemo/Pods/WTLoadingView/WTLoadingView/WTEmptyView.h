//
//  WTEmptyView.h
//  WTDemo
//
//  Created by 计恩良 on 2018/11/18.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTEmptyView : UIView
- (id)initWithFrame:(CGRect)frame img:(UIImage *)img;
// 便利方法
+ (void)showEmptyInView:(UIView *)view image:(UIImage *)img;
+ (void)hideAllEmptyViewForView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
