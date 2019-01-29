//
//  WTLoadFailView.m
//  WTDemo
//
//  Created by 计恩良 on 2018/11/18.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTLoadFailView.h"
#import "WTLoadingView.h"
#import "WTLoadingView1.h"

@interface WTLoadFailView ()
@property (strong, nonatomic) IBOutlet UIButton *retryBtn;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation WTLoadFailView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        int imgH = 39;
        int imgW = 39;
        int titleLabHeight = 50;
        
        float top = (frame.size.height-imgH-titleLabHeight)/2;
        float offsetX = (frame.size.width-imgW)/2;
        
        _retryBtn = [[UIButton alloc] initWithFrame:CGRectMake(offsetX, top, imgW, imgH)];
        [_retryBtn setImage:[UIImage imageNamed:@"WTLoading.bundle/comon_refresh_button"] forState:UIControlStateNormal];
        [_retryBtn addTarget:self action:@selector(retryBtnPress) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_retryBtn];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _retryBtn.frame.origin.y+_retryBtn.frame.size.height, frame.size.width, titleLabHeight)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"加载失败";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)retryBtnPress {
    self.hidden = YES;
    if (self.retryPress) {
        self.retryPress();
    }
}
#pragma mark - 便利方法
+ (void)showFailInView:(UIView *)view top:(float)top retryPress:(void (^)(void))retry
{
    //隐藏所有的加载中view
    [WTLoadingView hideAllLoadingForView:view];
    [WTLoadingView1 hideAllLoadingForView:view];
    //显示加载失败View
    WTLoadFailView *loadingView = [[WTLoadFailView alloc] initWithFrame:CGRectMake(0, top, view.frame.size.width, view.frame.size.height)];
    loadingView.retryPress = retry;
    [loadingView showInView:view];
}

+ (void)showFailInView:(UIView *)view retryPress:(void (^)(void))retry
{
    //隐藏所有的加载中view
    [WTLoadingView hideAllLoadingForView:view];
    [WTLoadingView1 hideAllLoadingForView:view];
    //显示加载失败View
    WTLoadFailView *loadingView = [[WTLoadFailView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    loadingView.retryPress = retry;
    [loadingView showInView:view];
}

+ (void)hideLoadingForView:(UIView *)view
{
    WTLoadFailView *loadingView = [self loadingForView:view];
    if (loadingView) {
        [loadingView hide];
    }
}

+ (void)hideAllFailForView:(UIView *)view
{
    NSEnumerator *reverseSubviews = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in reverseSubviews) {
        if ([subview isKindOfClass:self]) {
            [(WTLoadFailView *)subview hideNoAnimation];
        }
    }
}

+ (WTLoadFailView *)loadingForView:(UIView *)view
{
    NSEnumerator *reverseSubviews = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in reverseSubviews) {
        if ([subview isKindOfClass:self]) {
            return (WTLoadFailView *)subview;
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
