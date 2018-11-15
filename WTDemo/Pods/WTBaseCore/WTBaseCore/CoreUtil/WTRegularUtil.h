//
//  WTRegularUtil.h
//  IFXY
//
//  Created by admin on 2018/1/9.
//  Copyright © 2018年 IFly. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, WTValidatedType) {
     WTValidatedTypeEmail     = 0,
     WTValidatedTypePhoneNumber = 1,
     WTValidatedTypeNumber = 2,
     WTValidatedTypeSpecificNumbers = 3,
     WTValidatedTypeChinese = 4,
     WTValidatedTypeIllegalCharacter = 5,
     WTValidatedTypeURL = 6,
     WTValidatedTypeBlankLines = 7,
     WTValidatedTypeQQ = 8,
     WTValidatedTypeID = 9,
     WTValidatedTypeMAC = 10,
     WTValidatedTypeIdCard = 11,
     WTValidatedTypeDateInformation = 12,
     WTValidatedTypeAccountLegal = 13,
     WTValidatedTypePassword = 14,
     WTValidatedTypeStrongPassword = 15,
     WTValidatedTypeThereIsNo = 16,
};


@interface WTRegularUtil : NSObject
+ (BOOL)ValidateText:(NSString *)validateString ValidatedType:(WTValidatedType)type;
@end
