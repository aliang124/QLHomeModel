//
//  QLHomeNetWorkingUtil.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/12.
//  Copyright © 2019年 计恩良. All rights reserved.
//
//个人中心
#define QL_NetWorking_HomeIndex @"/home/index"

#import "QLHomeNetWorkingUtil.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLHomeNetWorkingUtil
+ (void)getHomeIndex:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler {
    [QLNetWorkingUtil postDataWithHost:QL_Net_Host Path:QL_NetWorking_HomeIndex Param:info success:^(id json) {
        if (successHandler) {
            successHandler(json);
        }
    } fail:^(NSString *message) {
        if (failHandler) {
            failHandler(message);
        }
    }];
}

@end
