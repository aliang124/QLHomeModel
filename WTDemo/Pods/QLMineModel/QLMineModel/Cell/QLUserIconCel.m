//
//  QLUserIconCel.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLUserIconCel.h"
#import "WTBaseCore.h"
#import "WTImagePickerUtil.h"
#import "QLMineNetWork.h"
#import "UIImageView+WebImage.h"

@implementation QLUserIconItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 64;
    }
    return self;
}

@end

@interface QLUserIconCel()
{
    UIButton *bgBtn;
    UILabel *leftLab;
}
@property (nonatomic,strong) UIImageView *iconImg;
@end

@implementation QLUserIconCel

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor clearColor];

    bgBtn = [[UIButton alloc] initWithFrame:CGRectMake(16, 0, WTScreenWidth-16-16, 64)];
    bgBtn.layer.cornerRadius = 4;
    bgBtn.layer.borderColor = WTColorHex(0xECECE6).CGColor;
    bgBtn.layer.borderWidth = 1;
    [bgBtn setImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [bgBtn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:bgBtn];
    
    leftLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 300, 64)];
    leftLab.font = WTFontSys(14);
    leftLab.textColor = QL_UserName_TitleColor_Black;
    [bgBtn addSubview:leftLab];
    
    UIImageView *arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(bgBtn.width-16-7, (64-10)/2, 7, 10)];
    [arrowImg setImage:[UIImage imageNamed:@"arrowImg"]];
    [bgBtn addSubview:arrowImg];

    _iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(arrowImg.left-40-16, 12, 40, 40)];
    _iconImg.layer.cornerRadius = 20;
    _iconImg.layer.masksToBounds = YES;
    [bgBtn addSubview:_iconImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    leftLab.text = [WTUtil strRelay:self.item.leftText];
    [_iconImg setWebImageWithUrl:self.item.iconUrl placeHolder:nil];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)btnPress {
    WT(weakSelf);
    [[WTImagePickerUtil shareInstance] showImagePicker:WTImagePickerUtilTypeActionSingleCrop inViewController:self.item.weakController];
    [[WTImagePickerUtil shareInstance] setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets) {
        if (photos.count>0) {
            [weakSelf.iconImg setImage:photos[0]];
        }
    }];
}
@end
