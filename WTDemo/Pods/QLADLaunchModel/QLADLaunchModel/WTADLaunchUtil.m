//
//  WTADLaunchUtil.m
//  WTDemo
//
//  Created by 计恩良 on 2018/11/15.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTADLaunchUtil.h"
#import <CommonCrypto/CommonDigest.h>

@implementation WTADLaunchUtil
+ (NSString *)getADFilePath:(NSString *)urlString {
    NSArray *cache = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDir = [cache objectAtIndex:0];
    NSString *filePath = [cacheDir stringByAppendingPathComponent:[self md5:urlString]];
    return filePath;
}

+ (BOOL)strNilOrEmpty:(NSString *)str {
    return str == nil
    || str == NULL
    || [str isKindOfClass:[NSNull class]]
    ||([str respondsToSelector:@selector(length)]
       && [(NSData *)str length] == 0)
    || ([str respondsToSelector:@selector(count)]
        && [(NSArray *)str count] == 0);
}

+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (unsigned int) strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (BOOL)fileExistAtPath:(NSString *)path {
    NSFileManager *filemanager = [NSFileManager defaultManager];
    return [filemanager fileExistsAtPath:path];
}

@end
