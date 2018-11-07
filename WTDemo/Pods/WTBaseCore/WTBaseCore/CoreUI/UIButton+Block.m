//
//  UIButton+Block.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

typedef void(^WT_ButtonEventsBlock)(void);

@interface UIButton ()

/** 事件回调的block */
@property (nonatomic, copy) WT_ButtonEventsBlock wt_buttonEventsBlock;
@end

@implementation UIButton (WTBaseCore)

//------- 添加属性 -------//

static void *wt_buttonEventsBlockKey = &wt_buttonEventsBlockKey;

- (WT_ButtonEventsBlock)wt_buttonEventsBlock {
    return objc_getAssociatedObject(self, &wt_buttonEventsBlockKey);
}

- (void)setWt_buttonEventsBlock:(WT_ButtonEventsBlock)wt_buttonEventsBlock {
    objc_setAssociatedObject(self, &wt_buttonEventsBlockKey, wt_buttonEventsBlock, OBJC_ASSOCIATION_COPY);
}

/**
 给按钮绑定事件回调block
 
 @param block 回调的block
 @param controlEvents 回调block的事件
 */
- (void)wt_addEventHandler:(void (^)(void))block forControlEvents:(UIControlEvents)controlEvents {
    self.wt_buttonEventsBlock = block;
    [self addTarget:self action:@selector(wt_blcokButtonClicked) forControlEvents:controlEvents];
}

// 按钮点击
- (void)wt_blcokButtonClicked {
    !self.wt_buttonEventsBlock ?: self.wt_buttonEventsBlock();
}

@end
