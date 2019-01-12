//
//  WTTabTitleViewCell.m
//  WTPagerControllerDemo
//
//  Created by tany on 16/5/4.
//  Copyright © 2016年 jienliang. All rights reserved.
//

#import "WTTabPagerBarCell.h"

@interface WTTabPagerBarCell ()
@property (nonatomic, weak) UILabel *titleLabel;
@end

@implementation WTTabPagerBarCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addTabTitleLabel];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self addTabTitleLabel];
    }
    return self;
}

- (void)addTabTitleLabel
{
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor darkTextColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLabel];
    _titleLabel = titleLabel;
}

+ (NSString *)cellIdentifier {
    return @"WTTabPagerBarCell";
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _titleLabel.frame = self.contentView.bounds;
}

@end
