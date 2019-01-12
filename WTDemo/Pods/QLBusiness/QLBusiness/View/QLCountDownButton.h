//
//  QLCountDownButton.h
//  QLBusiness
//
//  Created by 计恩良 on 2017/9/8.
//  Copyright © 2017年. All rights reserved.
//

//========== 倒计时button ==========//

#import <UIKit/UIKit.h>
typedef void(^ButtonClickedBlock)(void);
typedef void(^CountDownStartBlock)(void);
typedef void(^CountDownUnderwayBlock)(NSInteger restCountDownNum);
typedef void(^CountDownCompletionBlock)(void);

@interface QLCountDownButton : UIButton

/**
 构造方法
 
 @param duration 倒计时时间
 @param buttonClicked 按钮点击事件的回调
 @param countDownStart 倒计时开始时的回调
 @param countDownUnderway 倒计时进行中的回调（每秒一次）
 @param countDownCompletion 倒计时完成时的回调
 @return 倒计时button
 */
- (instancetype)initWithDuration:(NSInteger)duration
                buttonClicked:(void(^)(void))buttonClicked
               countDownStart:(void(^)(void))countDownStart
            countDownUnderway:(void(^)(NSInteger restCountDownNum))countDownUnderway
          countDownCompletion:(void(^)(void))countDownCompletion;

/** 开始倒计时 */
- (void)startCountDown;

/** 结束倒计时 */
- (void)endCountDown;

@end
