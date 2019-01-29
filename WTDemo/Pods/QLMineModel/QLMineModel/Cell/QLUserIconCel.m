//
//  QLUserIconCel.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLUserIconCel.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
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
            [weakSelf uploadImage:photos[0]];
        }
    }];
}

- (void)uploadImage:(UIImage *)img {
    [QLMBProgressHUDUtil showActivityMessageInWindow:@"正在加载"];
    [QLNetWorkingUtil uploadPic:QL_Net_Host path:@"/image/index" param:nil files:[NSArray arrayWithObject:[NSDictionary dictionaryWithObject:img forKey:@"image"]] success:^(id json) {
        NSArray *ar = (NSArray *)json;
        if ([ar isKindOfClass:[NSArray class]] && ar.count>0) {
            NSMutableDictionary *info = [NSMutableDictionary dictionary];
            [info setObject:ar[0] forKey:@"image"];
            [QLMineNetWork updateUserInfo:info successHandler:^(id json) {
                [QLMBProgressHUDUtil hideHUD];
                [WTToast makeText:@"更新成功"];
                WTPostNotification(@"UpdateUserInfoSuccess", nil);
            } failHandler:^(NSString *message) {
                [QLMBProgressHUDUtil hideHUD];
                [WTToast makeText:message];
            }];
        } else {
            [QLMBProgressHUDUtil hideHUD];
            [WTToast makeText:@"更新失败"];
        }
    } fail:^(NSString *message) {
        [QLMBProgressHUDUtil hideHUD];
        [WTToast makeText:message];
    }];
}
@end
