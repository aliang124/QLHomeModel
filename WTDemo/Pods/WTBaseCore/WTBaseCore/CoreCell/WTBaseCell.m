//
//  WTBaseCell.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "WTBaseCell.h"
#import "WTDefine.h"
#import "UIView+Category.h"

@implementation WTBaseItem
- (id)init{
     if (self = [super init]) {
          self.cellHeight = 48;
          self.hasTopLine = NO;
          self.hasBottomLine = YES;
          self.hasArrow = NO;
          self.bgColor = [UIColor whiteColor];
          self.canHighlighted = YES;
     }
     return self;
}
@end

@interface WTBaseCell()
{
     UIImageView *topLineImg;
     UIImageView *bottomLineImg;
     UIImageView *arrowImg;
}
@end

@implementation WTBaseCell

- (void)cellDidLoad
{
    [super cellDidLoad];
     topLineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WTScreenWidth, WT_Line_Height)];
     topLineImg.backgroundColor = WT_Color_Line;
     [self.contentView addSubview:topLineImg];
     
     bottomLineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 48-WT_Line_Height, WTScreenWidth, WT_Line_Height)];
     bottomLineImg.backgroundColor = WT_Color_Line;
     [self.contentView addSubview:bottomLineImg];
     
     arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(WTScreenWidth-12-11, (48-11)/2, 11, 11)];
     [arrowImg setImage:[UIImage imageNamed:@"WTBaseCore.bundle/Arrow_Right"]];
     [self.contentView addSubview:arrowImg];
}

- (void)cellWillAppear {
     [super cellWillAppear];
     topLineImg.hidden = !self.item.hasTopLine;
     bottomLineImg.hidden = !self.item.hasBottomLine;
     bottomLineImg.top = self.item.cellHeight-WT_Line_Height;
     arrowImg.top = (self.item.cellHeight-11)/2;
     arrowImg.hidden = !self.item.hasArrow;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    if (self.item.canHighlighted) {
        if (highlighted) {
            self.backgroundColor = WTColorHex(0xcccccc);
        } else {
            self.backgroundColor = self.item.bgColor;
        }
    }
}

@end
