//
//  QLNetWorkingUtil.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/9.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLNetWorkingUtil.h"
#import <AFNetworking.h>
#import "WTBaseCore.h"
#import "QLLoginInfo.h"
@implementation QLNetWorkingUtil
+ (void)postDataWithHost:(NSString *)host Path:(NSString *)path Param:(NSDictionary *)param success:(void (^)(id json))success fail:(void (^)(NSString *message))fail
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy.validatesDomainName = NO;
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    AFHTTPRequestSerializer *_requestSerializer = [AFHTTPRequestSerializer serializer];
    [_requestSerializer setTimeoutInterval:30];
    NSString *auth = @"Bearer";
    if (![WTUtil strNilOrEmpty:[QLLoginInfo sharedInstance].token]) {
        auth = [NSString stringWithFormat:@"%@ %@",auth,[QLLoginInfo sharedInstance].token];
    }
    [_requestSerializer setValue:auth forHTTPHeaderField:@"Authorization"];
    [_requestSerializer setValue:@"Ios" forHTTPHeaderField:@"clientType"];
    
    manager.requestSerializer = _requestSerializer;
    
    AFJSONResponseSerializer *_responseSerializer = [AFJSONResponseSerializer serializer];
    _responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    manager.responseSerializer = _responseSerializer;
    
    [manager POST:[NSString stringWithFormat:@"%@%@",host,path] parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([[WTUtil strRelay:responseObject[@"resultCode"]] isEqualToString:@"000"]) {
            if (success) {
                success(responseObject[@"data"]);
            }
        } else {
            if (fail) {
                fail([WTUtil strRelay:responseObject[@"message"]]);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(@"网络错误");
        }
    }];
}

+ (void)uploadPic:(NSString *)host path:(NSString *)path param:(NSDictionary *)param files:(NSArray *)files success:(void (^)(id json))success fail:(void (^)(NSString *message))fail
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFHTTPRequestSerializer *_requestSerializer = [AFHTTPRequestSerializer serializer];
    [_requestSerializer setTimeoutInterval:30];
    NSString *auth = @"Bearer";
    if (![WTUtil strNilOrEmpty:[QLLoginInfo sharedInstance].token]) {
        auth = [NSString stringWithFormat:@"%@ %@",auth,[QLLoginInfo sharedInstance].token];
    }
    [_requestSerializer setValue:auth forHTTPHeaderField:@"Authorization"];
    [_requestSerializer setValue:@"Ios" forHTTPHeaderField:@"clientType"];
    manager.requestSerializer = _requestSerializer;
    
    AFJSONResponseSerializer *_responseSerializer = [AFJSONResponseSerializer serializer];
    _responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    manager.responseSerializer = _responseSerializer;
    
    [manager POST:[NSString stringWithFormat:@"%@%@",host,path] parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int k = 0; k < [files count]; k++) {
            NSDictionary *dic = [files objectAtIndex:k];
            NSString *key = [[dic allKeys] objectAtIndex:0];
            id date = dic[key];
            NSData *fileData = nil;
            if ([date isKindOfClass:[NSString class]]) {
                fileData = [NSData dataWithContentsOfFile:date];
            } else if ([date isKindOfClass:[UIImage class]]) {
                fileData = UIImagePNGRepresentation(date);
            }
            if (fileData) {
                [formData appendPartWithFileData:fileData name:key fileName:key mimeType:@"*/*"];
            }
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([[WTUtil strRelay:responseObject[@"resultCode"]] isEqualToString:@"000"]) {
            if (success) {
                success(responseObject[@"data"]);
            }
        } else {
            if (fail) {
                fail([WTUtil strRelay:responseObject[@"message"]]);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(@"网络错误");
        }
    }];
}

@end
