//
//  WTEmptyView.m
//  WTDemo
//
//  Created by 计恩良 on 2018/11/18.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTEmptyView.h"
#import "WTLoadingView1.h"
#import "WTLoadingView.h"

@interface WTEmptyView ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation WTEmptyView

- (id)initWithFrame:(CGRect)frame img:(UIImage *)img {
    self = [super initWithFrame:frame];
    if (self) {
        int imgH = 80;
        int imgW = 80;
        int labelHeight = 13;
        int labelImageOffset = 7;
        
        float top = (frame.size.height-imgH-labelHeight-labelImageOffset)/2;
        float offsetX = (frame.size.width-imgW)/2;
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, top, imgW, imgH)];
        [_imageView setImage:img];
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _imageView.frame.origin.y+_imageView.frame.size.height+labelImageOffset, frame.size.width, labelHeight)];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"暂无数据";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return self;
}
#pragma mark - 便利方法
+ (void)showEmptyInView:(UIView *)view top:(float)top image:(UIImage *)img
{
    //隐藏所有加载中视图
    [WTLoadingView hideAllLoadingForView:view];
    [WTLoadingView1 hideAllLoadingForView:view];
    //显示空视图
    WTEmptyView *loadingView = [[WTEmptyView alloc] initWithFrame:CGRectMake(0, top, view.frame.size.width, view.frame.size.height) img:img];
    [loadingView showInView:view];
}

+ (void)showEmptyInView:(UIView *)view image:(UIImage *)img
{
    //隐藏所有加载中视图
    [WTLoadingView hideAllLoadingForView:view];
    [WTLoadingView1 hideAllLoadingForView:view];
    //显示空视图
    WTEmptyView *loadingView = [[WTEmptyView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height) img:img];
    [loadingView showInView:view];
}

+ (void)hideAllEmptyViewForView:(UIView *)view
{
    WTEmptyView *loadingView = [self loadingForView:view];
    if (loadingView) {
        [loadingView hide];
    }
}

+ (void)hideAllLoadingForView:(UIView *)view
{
    NSEnumerator *reverseSubviews = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in reverseSubviews) {
        if ([subview isKindOfClass:self]) {
            [(WTEmptyView *)subview hideNoAnimation];
        }
    }
}

+ (WTEmptyView *)loadingForView:(UIView *)view
{
    NSEnumerator *reverseSubviews = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in reverseSubviews) {
        if ([subview isKindOfClass:self]) {
            return (WTEmptyView *)subview;
        }
    }
    return nil;
}

#pragma mark - 实例方法

- (void)showInView:(UIView *)view
{
    if (!view) {
        return ;
    }
    if (self.superview != view) {
        [self removeFromSuperview];
        [view addSubview:self];
        [view bringSubviewToFront:self];
    }
}

- (void)hide
{
    self.alpha = 1.0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished) {
        [self hideNoAnimation];
    }];
}

- (void)hideNoAnimation
{
    [self removeFromSuperview];
}
@end
