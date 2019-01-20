//
//  QLMerchantPictureCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMerchantPictureCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "UIImageView+WebImage.h"

@implementation QLMerchantPictureItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 120 * (WTScreenWidth/360);
        self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface QLMerchantPictureCell()
{
    UIImageView *iconImage;
}
@end

@implementation QLMerchantPictureCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WTScreenWidth, 120)];
    iconImage.contentMode = UIViewContentModeScaleAspectFill;
    iconImage.clipsToBounds = YES;
    [self.contentView addSubview:iconImage];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    iconImage.height = self.item.cellHeight;
    [iconImage setWebImageWithUrl:[WTUtil strRelay:self.item.info[@"logo"]] placeHolder:nil];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
