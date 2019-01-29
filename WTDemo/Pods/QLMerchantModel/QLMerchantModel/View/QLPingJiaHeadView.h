//
//  QLPingJiaHeadView.h
//  WTDemo
//
//  Created by 计恩良 on 2019/1/26.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTBaseCore.h"
#import "QLBusiness.h"

@interface QLPingJiaHeadView : UIView
@property (nonatomic,strong) UIButton *allBtn;
@property (nonatomic,strong) UIButton *xinBtn;
@property (nonatomic,strong) UIButton *goodBtn;
@property (nonatomic,strong) UIButton *hasPicBtn;

@property (copy, nonatomic) void (^typeBtnPress)(int type);

@end
