//
//  QLNetWorkingUtil.h
//  WTDemo
//
//  Created by 计恩良 on 2019/1/9.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface QLNetWorkingUtil : NSObject
+ (void)postDataWithHost:(NSString *)host Path:(NSString *)path Param:(NSDictionary *)param success:(void (^)(id json))success fail:(void (^)(NSString *message))fail;
+ (void)uploadPic:(NSString *)host path:(NSString *)path param:(NSDictionary *)param files:(NSArray *)files success:(void (^)(id json))success fail:(void (^)(NSString *message))fail;

@end
