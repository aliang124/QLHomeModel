//
//  WTTextField.h
//  WTBaseCore
//
//  Created by jienliang on 2017/12/5.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "WTTextField.h"
#import "NSString+Category.h"

@implementation WTTextField

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.hasCopyAndPast = NO;
         self.maxLen = INT_MAX;
         [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (!self.hasCopyAndPast) {
        if (action == @selector(paste:))//禁止粘贴
            return NO;
        if (action == @selector(select:))// 禁止选择
            return NO;
        if (action == @selector(selectAll:))// 禁止全选
            return NO;
    }
    return [super canPerformAction:action withSender:sender];
}

- (void)textFieldDidChange:(UITextField *)textField {
     [self checkTextFieldMaxLen:self.maxLen];
}

- (void)checkTextFieldMaxLen:(int)max {
     int kMaxLength = INT_MAX;
     if (max > 0) {
          kMaxLength = max;
     }
     NSString *toBeString = self.text;
     if ([self.text stringContainsEmoji]) {
          toBeString = [toBeString disable_emoji];
          self.text = toBeString;
          return;
     }
     
     NSString *lang = [self.textInputMode primaryLanguage];
     if ([lang isEqualToString:@"zh-Hans"])// 简体中文输入
     {
          //获取高亮部分
          UITextRange *selectedRange = [self markedTextRange];
          UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
          
          // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
          if (!position)
          {
               if (toBeString.length > kMaxLength)
               {
                    self.text = [toBeString substringToIndex:kMaxLength];
               }
          }
     }
     // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
     else
     {
          if (toBeString.length > kMaxLength)
          {
               NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:kMaxLength];
               if (rangeIndex.length == 1)
               {
                    self.text = [toBeString substringToIndex:kMaxLength];
               }
               else
               {
                    NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, kMaxLength)];
                    self.text = [toBeString substringWithRange:rangeRange];
               }
          }
     }
}

@end
