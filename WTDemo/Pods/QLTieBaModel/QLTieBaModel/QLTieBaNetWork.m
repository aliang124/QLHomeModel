//
//  QLMineNetWork.m
//  WTDemo
//
//  Created by 计恩良 on 2019/1/9.
//  Copyright © 2019年 计恩良. All rights reserved.
//
//帖子分类
#define QL_NetWorking_TieBaCatogery @"/plate/index"
//帖子列表
#define QL_NetWorking_TieBaList @"/subject/record"
//帖子详情
#define QL_NetWorking_TieBaDetail @"/subject/detail"

#import "QLTieBaNetWork.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation QLTieBaNetWork
+ (void)getTieBaCatogery:(NSDictionary *)param successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler {
    [QLNetWorkingUtil postDataWithHost:QL_Net_Host Path:QL_NetWorking_TieBaCatogery Param:param success:^(id json) {
        if (successHandler) {
            successHandler(json);
        }
    } fail:^(NSString *message) {
        if (failHandler) {
            failHandler(message);
        }
    }];
}

+ (void)getTieBaList:(NSDictionary *)param successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler {
    [QLNetWorkingUtil postDataWithHost:QL_Net_Host Path:QL_NetWorking_TieBaList Param:param success:^(id json) {
        if (successHandler) {
            successHandler(json);
        }
    } fail:^(NSString *message) {
        if (failHandler) {
            failHandler(message);
        }
    }];
}

+ (void)getTieBaDetail:(NSDictionary *)param successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler {
    [QLNetWorkingUtil postDataWithHost:QL_Net_Host Path:QL_NetWorking_TieBaDetail Param:param success:^(id json) {
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
