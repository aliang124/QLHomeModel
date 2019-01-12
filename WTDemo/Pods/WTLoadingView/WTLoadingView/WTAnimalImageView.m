//
//  WTAnimalImageView.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/12.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "WTAnimalImageView.h"

@implementation WTAnimalImageView

// 播放GIF
- (void)playGifAnim:(NSArray *)images
{
    if (!images.count) {
        return;
    }
    //动画图片数组
    self.animationImages = images;
    //执行一次完整动画所需的时长
    self.animationDuration = 0.5;
    //动画重复次数, 设置成0 就是无限循环
    self.animationRepeatCount = 0;
    [self startAnimating];
}

// 停止动画
- (void)stopGifAnim
{
    if (self.isAnimating) {
        [self stopAnimating];
    }
    [self removeFromSuperview];
}

-(void)rotate360DegreeWithImageView {
    CABasicAnimation * rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"]; //让其在z轴旋转
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];//旋转角度
    rotationAnimation.duration = 1; //旋转周期
    rotationAnimation.cumulative = YES;//旋转累加角度
    rotationAnimation.repeatCount = HUGE_VALF;//旋转次数
    rotationAnimation.removedOnCompletion = NO;//解决放入后台动画停止问题
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

@end
