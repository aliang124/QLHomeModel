//
//  QLMerchantTagCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMerchantTagCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLMerchantTagItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 38;
    }
    return self;
}

@end

@interface QLMerchantTagCell()
{
}
@end

@implementation QLMerchantTagCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [self.contentView removeAllSubviews];
    NSString *labelString = [WTUtil strRelay:self.item.info[@"label"]];
    NSArray *ar = [NSArray arrayWithObjects:labelString, nil];
    float offsetX = 66;
    for (int i = 0; i < ar.count; i++) {
        NSString *tagStr = ar[i];
        
        UILabel *tagLab = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, 8, 20, 14)];
        tagLab.font = WTFontSys(10);
        tagLab.textColor = QL_TagTextColor_Green;
        tagLab.backgroundColor = QL_TagColor_Green;
        tagLab.text = tagStr;
        tagLab.textAlignment = NSTextAlignmentCenter;
        [tagLab sizeToFit];
        [self.contentView addSubview:tagLab];
        tagLab.width = tagLab.width+10;
        tagLab.height = 14;
        
        offsetX = tagLab.right + 8;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
