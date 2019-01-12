//
//  TAdLaunchImageView.m
//  TYLaunchAnimationDemo
//
//  Created by tanyang on 15/12/8.
//  Copyright © 2015年 tanyang. All rights reserved.
//

#import "TAdLaunchImageView.h"

#define kSkipBtnWidth 65
#define kSkipBtnHeight 30
#define kSkipRightEdging 20
#define kSkipTopEdging 40

@interface TAdLaunchImageView ()
@property (nonatomic, weak) UIImageView *adImageView;
@property (nonatomic, strong) dispatch_source_t timer;
@end

@implementation TAdLaunchImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addAdImageView];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
{
    if (self = [super initWithImage:image]) {
        [self addAdImageView];
    }
    return self;
}

- (void)addAdImageView
{
    UIImageView *imageView = [[UIImageView alloc]init];
    [self addSubview:imageView];
    _adImageView = imageView;
}

- (void)addSingleTapGesture
{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapGesture:)];
    [self addGestureRecognizer:singleTap];
}

#pragma maek - setter
- (void)setURLString:(NSString *)URLString
{
    if ([WTADLaunchUtil strNilOrEmpty:URLString]) {
        [self dismissController];
        return;
    }
    __typeof (self) __weak weakSelf = self;
    _URLString = URLString;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *filePath = [WTADLaunchUtil getADFilePath:URLString];
        if ([WTADLaunchUtil fileExistAtPath:filePath]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.adImageView.image = [UIImage imageWithContentsOfFile:filePath];
                //倒计时n秒后消失
                [weakSelf scheduledGCDTimer];
            });
        } else {
            // 异步操作
            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:URLString]];
            if (!data) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf dismissController];
                });
                return ;
            }
            //写入文件
            [data writeToFile:filePath atomically:YES];
            //倒计时3秒后消失
            dispatch_async(dispatch_get_main_queue(), ^{
                // 主线程更新
                weakSelf.adImageView.image = [UIImage imageWithData:data];
                //倒计时n秒后消失
                [weakSelf scheduledGCDTimer];
            });
        }
    });
}

- (void)scheduledGCDTimer
{
    [self addSingleTapGesture];
    [self addSkipBtn];
    [self cancleGCDTimer];
    __block int timeLeave = 3; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    __typeof (self) __weak weakSelf = self;
    dispatch_source_set_event_handler(_timer, ^{
        if(timeLeave <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(weakSelf.timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //关闭界面
                [weakSelf dismissController];
            });
        }else{
            int curTimeLeave = timeLeave;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面
                [weakSelf showSkipBtnTitleTime:curTimeLeave];
            });
            --timeLeave;
        }
    });
    dispatch_resume(_timer);
}

- (void)cancleGCDTimer
{
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

- (void)showSkipBtnTitleTime:(int)timeLeave
{
    NSString *timeLeaveStr = [NSString stringWithFormat:@"跳过 %ds",timeLeave];
    [self.skipBtn setTitle:timeLeaveStr forState:UIControlStateNormal];
    self.skipBtn.hidden = NO;
}

#pragma mark - action
- (void)dismissController
{
    [self cancleGCDTimer];
    [self showInWindowWithAnimation:[TYLaunchFadeScaleAnimation fadeAnimationWithDelay:0.3] completion:^(BOOL finished) {
        NSLog(@"finished");
    }];
}

#pragma mark - action

- (void)singleTapGesture:(UITapGestureRecognizer *)recognizer
{
    if (self.clickedImageURLHandle) {
        self.clickedImageURLHandle(self.URLString);
    }
    [self dismissController];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.hidden == NO && _adImageView.alpha > 0 && CGRectContainsPoint(_adImageView.frame, point)) {
        return self;
    }
    return nil;
}

- (void)layoutSubviews
{
    [super layoutSubviews];    
    _adImageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)*0.80);
    _skipBtn.frame = CGRectMake(CGRectGetWidth(self.frame) - kSkipBtnWidth - kSkipRightEdging, kSkipTopEdging, kSkipBtnWidth, kSkipBtnHeight);
}

- (void)addSkipBtn
{
    UIButton *skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    skipBtn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [skipBtn setTitle:@"跳过" forState:UIControlStateNormal];
    skipBtn.titleLabel.textColor = [UIColor whiteColor];
    skipBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    skipBtn.alpha = 0.92;
    skipBtn.layer.cornerRadius = 4.0;
    skipBtn.clipsToBounds = YES;
    [skipBtn addTarget:self action:@selector(skipBtnPress) forControlEvents:UIControlEventTouchDown];
    [self addSubview:skipBtn];
    _skipBtn = skipBtn;
}

- (void)skipBtnPress {
    [self dismissController];
}
@end
