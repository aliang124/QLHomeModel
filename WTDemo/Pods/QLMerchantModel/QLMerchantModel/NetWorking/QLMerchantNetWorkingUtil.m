//
//  QLMerchantNetWorkingUtil.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/12.
//  Copyright © 2019年 计恩良. All rights reserved.
//
//商家分类
#define QL_NetWorking_BusinessCategory @"/business/category"
//商家列表
#define QL_NetWorking_BusinessIndex @"/business/index"
//商家详情
#define QL_NetWorking_BusinessDetail @"/business/detail"

#import "QLMerchantNetWorkingUtil.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "QLNetWorkingUtil.h"

@implementation QLMerchantNetWorkingUtil
+ (void)getBusinessCategory:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler {
    [QLNetWorkingUtil postDataWithHost:QL_Net_Host Path:QL_NetWorking_BusinessCategory Param:info success:^(id json) {
        if (successHandler) {
            successHandler(json);
        }
    } fail:^(NSString *message) {
        if (failHandler) {
            failHandler(message);
        }
    }];
}

+ (void)getBusinessIndex:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler {
    [QLNetWorkingUtil postDataWithHost:QL_Net_Host Path:QL_NetWorking_BusinessIndex Param:info success:^(id json) {
        if (successHandler) {
            successHandler(json);
        }
    } fail:^(NSString *message) {
        if (failHandler) {
            failHandler(message);
        }
    }];
}

+ (void)getBusinessDetail:(NSString *)businessId successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler {
    NSDictionary *param = [NSDictionary dictionaryWithObject:businessId forKey:@"businessId"];
    [QLNetWorkingUtil postDataWithHost:QL_Net_Host Path:QL_NetWorking_BusinessDetail Param:param success:^(id json) {
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
