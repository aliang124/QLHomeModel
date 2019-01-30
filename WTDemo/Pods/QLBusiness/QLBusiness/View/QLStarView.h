//
//  QLStarView.h
//  WTDemo
//
//  Created by 计恩良 on 2019/1/26.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTBaseCore.h"
#import "QLBusiness.h"

@interface QLStarView : UIView
@property (strong,nonatomic) UIImageView *starImg1;
@property (strong,nonatomic) UIImageView *starImg2;
@property (strong,nonatomic) UIImageView *starImg3;
@property (strong,nonatomic) UIImageView *starImg4;
@property (strong,nonatomic) UIImageView *starImg5;

@property (nonatomic,assign) int starCount;
- (id)initWithPoint:(CGPoint)pt;
- (id)initWithOrgPoint:(CGPoint)pt;
@end
