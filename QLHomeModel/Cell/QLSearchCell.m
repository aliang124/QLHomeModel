//
//  QLHomeHotTagCell.h
//  QLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLSearchCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLSearchItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 44;
    }
    return self;
}

@end

@interface QLSearchCell()
{
    UILabel *titleLab;
}
@end

@implementation QLSearchCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, WTScreenWidth-15-15, 44)];
    titleLab.font = WTFontSys(14);
    titleLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:titleLab];
    
    UIButton *clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(WTScreenWidth-18-21, 11.5, 21, 21)];
    [clearBtn setImage:[UIImage imageNamed:@"gray_delete"] forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(deleteBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:clearBtn];
    
    UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 43.5, WTScreenWidth, 0.5)];
    lineImg.backgroundColor = QL_Border_LineColor;
    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    titleLab.text = [WTUtil strRelay:self.item.titleText];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)deleteBtnPress {
    
}
@end
