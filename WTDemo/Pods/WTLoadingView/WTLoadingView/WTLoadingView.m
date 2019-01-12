//
//  WTLoadingView.m
//  WTDemo
//
//  Created by 计恩良 on 2018/11/18.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTLoadingView.h"
#import "WTLoadFailView.h"
static NSArray *s_refreshingImages = nil;

@interface WTLoadingView ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation WTLoadingView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        int imgH = 50;
        int imgW = 20;
        float top = (frame.size.height-imgH-50)/2;
        float offsetX = (frame.size.width-imgW)/2;
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(offsetX, top, imgW, imgH)];
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _imageView.frame.origin.y+_imageView.frame.size.height, frame.size.width, 50)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"正在载入中";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];

        [self addAnimalImages];
    }
    return self;
}

- (NSArray *)refreshingImages
{
    if (!s_refreshingImages) {
        NSMutableArray *refreshingImages  = [NSMutableArray array];
        for (int i = 1; i < 7; ++i) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"WTLoading.bundle/loading_step%d",i]];
            [refreshingImages addObject:image];
        }
        s_refreshingImages = [refreshingImages copy];
    }
    return s_refreshingImages;
}

- (void)addAnimalImages
{
    self.imageView.animationDuration = 1.5;
    self.imageView.animationImages = [self refreshingImages];
}

#pragma mark - 便利方法

+ (void)showLoadingInView:(UIView *)view
{
    //隐藏所有的加载失败视图
    [WTLoadFailView hideAllFailForView:view];
    //显示加载中视图
    WTLoadingView *loadingView = [[WTLoadingView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    [loadingView showInView:view];
}

+ (void)hideLoadingForView:(UIView *)view
{
    WTLoadingView *loadingView = [self loadingForView:view];
    if (loadingView) {
        [loadingView hide];
    }
}

+ (void)hideAllLoadingForView:(UIView *)view
{
    NSEnumerator *reverseSubviews = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in reverseSubviews) {
        if ([subview isKindOfClass:self]) {
            [(WTLoadingView *)subview hideNoAnimation];
        }
    }
}

+ (WTLoadingView *)loadingForView:(UIView *)view
{
    NSEnumerator *reverseSubviews = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in reverseSubviews) {
        if ([subview isKindOfClass:self]) {
            return (WTLoadingView *)subview;
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
    [self.imageView startAnimating];
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
    [self.imageView stopAnimating];
    [self removeFromSuperview];
}

- (void)dealloc
{
    [self.imageView stopAnimating];
    self.imageView.animationImages = nil;
}

@end
