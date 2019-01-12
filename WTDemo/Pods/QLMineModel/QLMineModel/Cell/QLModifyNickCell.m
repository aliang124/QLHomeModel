//
//  QQLModifyNickCell.h
//  QLMineModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLModifyNickCell.h"
#import "WTBaseCore.h"

@implementation QLModifyNickItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 50;
    }
    return self;
}

@end

@interface QLModifyNickCell()
{
}
@property (nonatomic,strong) WTTextField *nameTextField;
@end

@implementation QLModifyNickCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    WT(weakSelf);
    
    _nameTextField = [[WTTextField alloc] initWithFrame:CGRectMake(15, 0, WTScreenWidth-30, 50)];
    _nameTextField.textColor = QL_UserName_TitleColor_Black;
    _nameTextField.font = WTFontSys(16);
    _nameTextField.placeholder = @"请输入您的昵称";
    _nameTextField.maxLen = 20;
    _nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _nameTextField.textFieldDidChanged = ^{
        weakSelf.item.nickName = weakSelf.nameTextField.text;
    };
    [self.contentView addSubview:_nameTextField];

    UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 49, WTScreenWidth, 1)];
    lineImg.backgroundColor = WTColorHex(0xEEEEE5);
    [self.contentView addSubview:lineImg];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.nameTextField.text = [WTUtil strRelay:self.item.nickName];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}
@end
