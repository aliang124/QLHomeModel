//
//  QLTieBaShopCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLZhuYeHeadCell.h"
#import "UIImageView+WebImage.h"

@implementation QLZhuYeHeadItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 154;
    }
    return self;
}

@end

@interface QLZhuYeHeadCell()
{
}
@end

@implementation QLZhuYeHeadCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 0, WTScreenWidth-12-12, 154)];
    [bgImg setImage:[UIImage imageNamed:@"zhuyeBg"]];
    [self.contentView addSubview:bgImg];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
}

@end
