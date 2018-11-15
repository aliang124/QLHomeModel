//
//  WTRegularUtil.m
//  IFXY
//
//  Created by admin on 2018/1/9.
//  Copyright © 2018年 IFly. All rights reserved.
//

#import "WTRegularUtil.h"

@implementation WTRegularUtil
+ (BOOL)ValidateText:(NSString *)validateString ValidatedType:(WTValidatedType)type {
     NSString *pattern = @"";
     if (type==WTValidatedTypeEmail) {
          pattern = @"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$";
     } else if (type==WTValidatedTypePhoneNumber) {
          pattern = @"^1[0-9]{10}$";
     } else if (type==WTValidatedTypeNumber) {
          pattern = @"^[0-9]*$";
     } else if (type==WTValidatedTypeSpecificNumbers) {
          pattern = @"^\\d{n}$";
     } else if (type==WTValidatedTypeChinese) {
          pattern = @"[\\u4e00-\\u9fa5]";
     } else if (type==WTValidatedTypeIllegalCharacter) {
          pattern = @"[%&',;=?$\\\\^]+";
     } else if (type==WTValidatedTypeURL) {
          pattern = @"^http://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$";
     } else if (type==WTValidatedTypeBlankLines) {
          pattern = @"^s*|s*$";
     } else if (type==WTValidatedTypeQQ) {
          pattern = @"[1-9][0-9]{4,}";
     } else if (type==WTValidatedTypeID) {
          pattern = @"([1-9]{1,3}\\.){3}[1-9]";
     } else if (type==WTValidatedTypeMAC) {
          pattern = @"([A-Fa-f0-9]{2}\\:){5}[A-Fa-f0-9]";
     } else if (type==WTValidatedTypeIdCard) {
          pattern = @"\\d{14}[[0-9],0-9xX]";
     } else if (type==WTValidatedTypeDateInformation) {
          pattern = @"^\\d{4}-\\d{1,2}-\\d{1,2}";
     } else if (type==WTValidatedTypeAccountLegal) {
          pattern = @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$";
     } else if (type==WTValidatedTypePassword) {
          pattern = @"^[a-zA-Z]\\w{5,17}$";
     } else if (type==WTValidatedTypeStrongPassword) {
          pattern = @"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$";
     }
     
     NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
     NSArray *matches = [regex matchesInString:validateString options:NSMatchingReportProgress range:NSMakeRange(0, validateString.length)];
     return matches.count>0;
}

@end
