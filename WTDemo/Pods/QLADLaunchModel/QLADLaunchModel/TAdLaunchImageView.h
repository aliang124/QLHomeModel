//
//  TAdLaunchImageView.h
//  TYLaunchAnimationDemo
//
//  Created by tanyang on 15/12/8.
//  Copyright © 2015年 tanyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+TYLaunchAnimation.h"
#import "TYLaunchFadeScaleAnimation.h"
#import "WTADLaunchUtil.h"
#import "UIImage+TYLaunchImage.h"

@interface TAdLaunchImageView : UIImageView
@property (nonatomic, weak, readonly) UIButton *skipBtn;
@property (nonatomic, weak, readonly) UIImageView *adImageView;
@property (nonatomic, copy) NSString *URLString;

@property (nonatomic, copy) void (^clickedImageURLHandle)(NSString *URLString);
@end
