//
//  QLMerchantTagTimeCell.h
//  QLTieBa
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLMerchantTagTimeCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLMerchantTagTimeItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 18;
    }
    return self;
}

@end

@interface QLMerchantTagTimeCell()
{
    UILabel *tagLab;
    UILabel *timeLab;
}
@end

@implementation QLMerchantTagTimeCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
    
    tagLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 38, 18)];
    tagLab.font = WTFontSys(10);
    tagLab.textColor = [UIColor whiteColor];
    tagLab.textAlignment = NSTextAlignmentCenter;
    tagLab.backgroundColor = WTColorHex(0x21DB87);
    tagLab.layer.cornerRadius = 2;
    tagLab.layer.masksToBounds = YES;
    [self.contentView addSubview:tagLab];
    
    timeLab = [[UILabel alloc] initWithFrame:CGRectMake(tagLab.right+12, tagLab.top+4, WTScreenWidth-tagLab.right-12-12, 11)];
    timeLab.font = WTFontSys(12);
    timeLab.textColor = QL_UserName_TitleColor_Black;
    [self.contentView addSubview:timeLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    tagLab.text = @"营业中";
    NSString *startDate = [WTUtil strRelay:self.item.info[@"startDate"]];
    NSString *overDate = [WTUtil strRelay:self.item.info[@"overDate"]];
    NSString *dateString = [NSString stringWithFormat:@"%@至于%@",startDate,overDate];
    timeLab.text = dateString;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
