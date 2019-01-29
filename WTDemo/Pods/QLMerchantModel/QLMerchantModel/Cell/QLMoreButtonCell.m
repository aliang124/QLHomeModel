//
//  QLMerchantTagCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMoreButtonCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLMoreButtonItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 34*QL_MULPITLE;
    }
    return self;
}

@end

@interface QLMoreButtonCell()
{
    UILabel *titleLab;
}
@end

@implementation QLMoreButtonCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    titleLab = [[UILabel alloc] initWithFrame:CGRectMakes(0, 0, 360, 10)];
    titleLab.font = [UIFont systemFontOfSize:10*QL_MULPITLE];
    titleLab.textColor = QL_DescColor_Gray;
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    titleLab.height = self.item.cellHeight;
    titleLab.text = [WTUtil strRelay:self.item.titleText];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
