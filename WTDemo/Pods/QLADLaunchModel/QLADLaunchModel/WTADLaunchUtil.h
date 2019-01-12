//
//  WTADLaunchUtil.h
//  WTDemo
//
//  Created by 计恩良 on 2018/11/15.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTADLaunchUtil : NSObject
+ (NSString *)getADFilePath:(NSString *)urlString;
+ (NSString *)md5:(NSString *)str;
+ (BOOL)strNilOrEmpty:(NSString *)str;
+ (BOOL)fileExistAtPath:(NSString *)path;
@end

NS_ASSUME_NONNULL_END
