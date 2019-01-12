//
//  QQLNickNameCell.h
//  QLLoginModel
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "QLNickNameCell.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLNickNameItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 44;
        self.bgColor = [UIColor whiteColor];
        self.hasBottomLine = NO;
        self.canHighlighted = NO;
    }
    return self;
}

@end

@interface QLNickNameCell()
{
    UITextField *nickNameTextField;
}
@end

@implementation QLNickNameCell

- (void)cellDidLoad
{
    [super cellDidLoad];
    nickNameTextField = [QLBusinessUtil createTextFieldView:CGRectMake(24, 0, WTScreenWidth-24-23, 44) superView:self.contentView placeHolder:@"你的昵称"];
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

@end
