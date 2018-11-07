//
//  UIButton+Block.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (WTBaseCore)
/**
 给按钮绑定事件回调block

 @param block 回调的block
 @param controlEvents 回调block的事件
 */
- (void)wt_addEventHandler:(void(^)(void))block forControlEvents:(UIControlEvents)controlEvents;

@end
