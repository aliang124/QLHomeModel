//
//  WTCyclePagerViewCell.m
//  WTCyclePagerViewDemo
//
//  Created by elji on 2017/6/14.
//  Copyright © 2017年 elji. All rights reserved.
//

#import "WTCyclePagerViewCell.h"

@interface WTCyclePagerViewCell ()
@end

@implementation WTCyclePagerViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self.contentView addSubview:_bgImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

@end
