//
//  QLHomeHotTagCell.h
//  QLHomeModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLSearchBarCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLSearchBarItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 36;
    }
    return self;
}

@end

@interface QLSearchBarCell()
{
}
@end

@implementation QLSearchBarCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(12, 12, WTScreenWidth-12-12, 11)];
    titleLab.font = WTFontBoldSys(12);
    titleLab.text = @"历史搜素";
    titleLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:titleLab];
    
    UILabel *clearLab = [[UILabel alloc] initWithFrame:CGRectMake(WTScreenWidth-50-17, 0, 50, 36)];
    clearLab.font = WTFontSys(12);
    clearLab.textColor = WTColorHex(0xA6A5A1);
    clearLab.text = @"清空记录";
    clearLab.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:clearLab];
    
    UIButton *clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(clearLab.left-22, 0, 22, 36)];
    [clearBtn setImage:[UIImage imageNamed:@"clear_icon"] forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:clearBtn];
    
    UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 35.5, WTScreenWidth, 0.5)];
    lineImg.backgroundColor = QL_Border_LineColor;
    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)clearBtnPress {
    
}
@end
