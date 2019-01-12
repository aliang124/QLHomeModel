//
//  QLWanShanTitleCell.h
//  QLLoginModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLWanShanTitleCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "WTImagePickerUtil.h"

@implementation QLWanShanTitleItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 56;
        self.bgColor = [UIColor whiteColor];
        self.hasBottomLine = NO;
        self.canHighlighted = NO;
    }
    return self;
}

@end

@interface QLWanShanTitleCell()
{
    UIImageView *cameraImg;
}
@property (nonatomic,strong) UIButton *cameraBtn;
@end

@implementation QLWanShanTitleCell
@synthesize cameraBtn;

- (void)cellDidLoad
{
    [super cellDidLoad];
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(25, 4, WTScreenWidth-25-25, 23)];
    titleLab.font = WTFontSys(24);
    titleLab.textColor = QL_NavBar_TitleColor_Black;
    titleLab.text = @"完善资料";
    [self.contentView addSubview:titleLab];
    
    UILabel *subTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(25, titleLab.bottom+14, titleLab.width, 11)];
    subTitleLab.font = WTFontSys(12);
    subTitleLab.textColor = QL_DescColor_Gray;
    subTitleLab.text = @"请完善你的基本信息";
    [self.contentView addSubview:subTitleLab];

    cameraBtn = [[UIButton alloc] initWithFrame:CGRectMake(WTScreenWidth-23-56, 0, 56, 56)];
    [cameraBtn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateNormal];
    cameraBtn.layer.cornerRadius = 28;
    cameraBtn.layer.masksToBounds = YES;
    [cameraBtn addTarget:self action:@selector(cameraPress) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:cameraBtn];
    
    cameraImg = [[UIImageView alloc] initWithFrame:CGRectMake(14, 14, 28, 28)];
    [cameraImg setImage:[UIImage imageNamed:@"camera"]];
    [cameraBtn addSubview:cameraImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = self.item.bgColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)cameraPress {
    WT(weakSelf);
    [[WTImagePickerUtil shareInstance] showImagePicker:WTImagePickerUtilTypeActionSingleCrop inViewController:self.item.delegateController];
    [[WTImagePickerUtil shareInstance] setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets) {
        if (photos.count>0) {
            weakSelf.item.selectImage = photos[0];
            [weakSelf.cameraBtn setBackgroundImage:photos[0] forState:UIControlStateNormal];
        }
    }];
}
@end
