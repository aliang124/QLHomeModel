//
//  WTHttpUtil.h
//  WTBaseCore
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTNetworkHelper.h"

@interface WTHttpUtil : NSObject
+ (void)startMonitoring;
+ (void)POSTWithURL:(NSString *)URL parameters:(NSDictionary *)parameters success:(WTHttpRequestSuccess)success failure:(WTHttpRequestFailed)failure;
@end
