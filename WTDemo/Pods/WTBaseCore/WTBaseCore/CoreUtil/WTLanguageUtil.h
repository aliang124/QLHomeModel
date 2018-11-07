//
//  WTLanguageUtil.h
//  WTEmptyProject
//
//  Created by admin on 2018/6/1.
//  Copyright © 2018年 计恩良. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, WTAppLanguageType){
    WTAppLanguage_CN = 0,//中文
    WTAppLanguage_EN = 1,//英文
};

@interface WTLanguageUtil : NSObject
+ (instancetype)shareInstance;

- (WTAppLanguageType)getCurrentAppLanguage;
- (void)setCurrentAppLanguage:(WTAppLanguageType)type;

- (NSString *)valueForKey:(NSString *)key;
@end
