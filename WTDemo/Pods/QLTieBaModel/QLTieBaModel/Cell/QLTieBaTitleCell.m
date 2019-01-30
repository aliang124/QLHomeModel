//
//  QLMineHeadCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLTieBaTitleCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLTieBaTitleItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 5;
        self.titleFont = WTFontBoldSys(16);
        self.titleColor = QL_UserName_TitleColor_Black;
        self.hasBottomLine = NO;
        self.rightOffset = 40;
        self.titleTextHeight = 5;
    }
    return self;
}

@end

@interface QLTieBaTitleCell()
{
    UILabel *titleLab;
}
@end

@implementation QLTieBaTitleCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, WTScreenWidth-16-40, 5)];
    titleLab.numberOfLines = 0;
    [self.contentView addSubview:titleLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = [UIColor whiteColor];
    titleLab.width = WTScreenWidth-16-self.item.rightOffset;
    titleLab.font = self.item.titleFont;
    titleLab.textColor = self.item.titleColor;
    titleLab.text = [WTUtil strRelay:self.item.titleText];
    
    float H = 5;
    if (self.item.titleTextHeight==5) {
        [titleLab sizeToFit];
        H = titleLab.height;
    }
    self.item.cellHeight = H;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)btnPress {
    if (self.item.selectionHandler) {
        self.item.selectionHandler(self.item);
    }
}
@end
