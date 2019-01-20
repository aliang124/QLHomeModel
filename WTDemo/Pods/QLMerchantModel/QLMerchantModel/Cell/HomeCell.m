//
//  HomeCell.m
//  KYPhotoBrowser
//
//  Created by Cuikeyi on 2017/8/2.
//  Copyright © 2017年 Cuikeyi. All rights reserved.
//

#import "HomeCell.h"
#import "UIImageView+WebImage.h"

@interface HomeCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation HomeCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    _imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageView];
}

- (void)updateImage:(UIImage *)image;
{
    _imageView.image = image;
}

- (void)updateImageURL:(NSString *)URLString
{
    [_imageView setWebImageWithUrl:URLString placeHolder:nil];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame = self.contentView.bounds;
}

@end
