//
//  QLLoginInfo.m
//  QLBusiness
//
//  Created by jienliang on 14-4-28.
//  Copyright (c) 2014年 jienliang. All rights reserved.
//

#import "QLLoginInfo.h"
#import "WTBaseCore.h"

@implementation QLLoginInfo
// 跟上面的方法实现有一点不同
+ (QLLoginInfo *)sharedInstance {
    static QLLoginInfo *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[self alloc] init];
    });
    return _sharedSingleton;
}

- (void)setLoginInfoWithDict:(NSDictionary *)dInfo{
    QLLoginInfo *loginInfo = [QLLoginInfo sharedInstance];
    loginInfo.phone = [WTUtil strRelay:dInfo[@"phone"]];
    loginInfo.username = [WTUtil strRelay:dInfo[@"username"]];
    loginInfo.userId = [WTUtil strRelay:dInfo[@"userId"]];
    loginInfo.token = [WTUtil strRelay:dInfo[@"token"]];
    loginInfo.image = [WTUtil strRelay:dInfo[@"image"]];
}

- (void)writeUserInfo:(NSDictionary *)dic {
    NSString *fileName = [QLLoginInfo getUserInfoFilePath];
    if ([WTFile fileExistAtPath:fileName]) {
        [WTFile fileDel:fileName];
    }
    dic = [QLLoginInfo processDictionaryIsNSNull:dic];
    NSString *str = [WTJsonUtil jsonStringWithObject:dic];
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [data writeToFile:fileName atomically:YES];
}

- (void)readLoginInfoFromFile {
    NSString *fileName = [QLLoginInfo getUserInfoFilePath];
    //文件不存在
    if (![WTFile fileExistAtPath:fileName]) {
        return;
    }
    NSData *data = [NSData dataWithContentsOfFile:fileName];
    if (data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        if (dic!=nil) {
            [[QLLoginInfo sharedInstance] setLoginInfoWithDict:dic];
        }
    }
}

- (BOOL)isLogin {
    if ([WTUtil strNilOrEmpty:[QLLoginInfo sharedInstance].userId]) {
        return NO;
    }
    return YES;
}

+ (NSString *)getUserInfoFilePath {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    NSString * path = [documentsDirectory stringByAppendingPathComponent:@"user.txt"];
    return path;
}

+ (id) processDictionaryIsNSNull:(id)obj {
    const NSString *blank = @"";
    if ([obj isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dt = [(NSMutableDictionary*)obj mutableCopy];
        for(NSString *key in [dt allKeys]) {
            id object = [dt objectForKey:key];
            if([object isKindOfClass:[NSNull class]]) {
                [dt setObject:blank
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSString class]]){
                NSString *strobj = (NSString*)object;
                if ([strobj isEqualToString:@"<null>"]) {
                    [dt setObject:blank
                           forKey:key];
                }
            }
            else if ([object isKindOfClass:[NSNumber class]]){
                NSString *strobj = (NSString*)object;
                [dt setObject:[NSString stringWithFormat:@"%@",strobj]
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSArray class]]){
                NSArray *da = (NSArray*)object;
                da = [self processDictionaryIsNSNull:da];
                [dt setObject:da
                       forKey:key];
            }
            else if ([object isKindOfClass:[NSDictionary class]]){
                NSDictionary *ddc = (NSDictionary*)object;
                ddc = [self processDictionaryIsNSNull:ddc];
                [dt setObject:ddc forKey:key];
            }
        }
        return [dt copy];
    }
    else if ([obj isKindOfClass:[NSArray class]]){
        NSMutableArray *da = [(NSMutableArray*)obj mutableCopy];
        for (int i=0; i<[da count]; i++) {
            NSDictionary *dc = [obj objectAtIndex:i];
            dc = [self processDictionaryIsNSNull:dc];
            [da replaceObjectAtIndex:i withObject:dc];
        }
        return [da copy];
    }
    else{
        return obj;
    }
}

@end
