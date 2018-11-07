//
//  WTLanguageUtil.m
//  WTEmptyProject
//
//  Created by admin on 2018/6/1.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTLanguageUtil.h"
#import "NSString+Category.h"
#import "WTUtil.h"
@implementation WTLanguageUtil
+ (instancetype)shareInstance
{
    static WTLanguageUtil *share = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[WTLanguageUtil alloc]init];
    });
    return share;
}

- (NSString *)valueForKey:(NSString *)key {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"zh-Hans" ofType:@"lproj"];
    if ([self getCurrentAppLanguage]==WTAppLanguage_EN) {
        path = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
    }
    NSString *value = [[NSBundle bundleWithPath:path] localizedStringForKey:key value:nil table:@"Language"];
    return [WTUtil strRelay:value];
}

- (WTAppLanguageType)getCurrentAppLanguage {
    WTAppLanguageType type = WTAppLanguage_CN;
    NSString *lan = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppLanguage"];
    if (lan && lan.length>0 && [lan isEqualToString:@"en"]) {
        type = WTAppLanguage_EN;
    }
    return type;
}

- (void)setCurrentAppLanguage:(WTAppLanguageType)type {
    if (type==WTAppLanguage_EN) {
        [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"AppLanguage"];
    } else {
        [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"AppLanguage"];
    }
}
@end
