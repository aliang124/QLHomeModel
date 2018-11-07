//
//  WTCountDownButton.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WTCountDownButton;
typedef NSString* (^CountDownChanging)(WTCountDownButton *countDownButton,NSUInteger second);
typedef NSString* (^CountDownFinished)(WTCountDownButton *countDownButton,NSUInteger second);
typedef void (^TouchedCountDownButtonHandler)(WTCountDownButton *countDownButton,NSInteger tag);

@interface WTCountDownButton : UIButton
@property(nonatomic,strong) id userInfo;
///倒计时按钮点击回调
- (void)countDownButtonHandler:(TouchedCountDownButtonHandler)touchedCountDownButtonHandler;
//倒计时时间改变回调
- (void)countDownChanging:(CountDownChanging)countDownChanging;
//倒计时结束回调
- (void)countDownFinished:(CountDownFinished)countDownFinished;
///开始倒计时
- (void)startCountDownWithSecond:(NSUInteger)second;
///停止倒计时
- (void)stopCountDown;
@end
