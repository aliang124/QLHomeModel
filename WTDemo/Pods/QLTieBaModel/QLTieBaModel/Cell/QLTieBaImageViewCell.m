//
//  QLTieBaImageViewCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLTieBaImageViewCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLTieBaImageViewItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 144;
        self.hasBottomLine = NO;
    }
    return self;
}

@end

@interface QLTieBaImageViewCell()
{
    UIImageView *imgView;
}
@end

@implementation QLTieBaImageViewCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(16, 0, WTScreenWidth-16-16, 144)];
    imgView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:imgView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
