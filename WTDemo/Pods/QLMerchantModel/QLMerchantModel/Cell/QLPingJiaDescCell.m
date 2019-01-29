//
//  QLTieBaShopCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLPingJiaDescCell.h"
#import "UIImageView+WebImage.h"
#import "QLStarView.h"

@implementation QLPingJiaDescItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 1;
    }
    return self;
}

@end

@interface QLPingJiaDescCell()
{
    UILabel *descLab;
}
@end

@implementation QLPingJiaDescCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    descLab = [[UILabel alloc] initWithFrame:CGRectMake(13, 0, WTScreenWidth-13-12, 0.1)];
    descLab.font = WTFontSys(12);
    descLab.textColor = QL_DescColor_Gray;
    descLab.numberOfLines = 0;
    [self.contentView addSubview:descLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    descLab.text = [WTUtil strRelay:self.item.descText];
    [descLab sizeToFit];
    self.item.cellHeight = descLab.height;
}
@end
