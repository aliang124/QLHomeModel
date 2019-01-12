//
//  WTTabbarController.h
//  WTBaseCore
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface QLTabbarController : UITabBarController
@property (nonatomic,strong) UIView *tabBarView;
@property (nonatomic,strong) NSArray *itemsArray;
@property (nonatomic,assign) int currentIndex;
- (void)setTabIndex:(int)idx;
@end
