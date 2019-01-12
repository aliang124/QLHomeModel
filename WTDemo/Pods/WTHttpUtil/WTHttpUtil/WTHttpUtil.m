//
//  WTHttpUtil.h
//  WTBaseCore
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#import "WTHttpUtil.h"

@implementation WTHttpUtil

+ (void)startMonitoring {
    [WTNetworkHelper networkStatusWithBlock:^(WTNetworkStatusType status) {
    }];
}

+ (void)POSTWithURL:(NSString *)URL
                                parameters:(NSDictionary *)parameters
                                   success:(WTHttpRequestSuccess)success
                                   failure:(WTHttpRequestFailed)failure {
    [WTNetworkHelper POSTWithURL:URL parameters:parameters success:success failure:failure];
}

@end
