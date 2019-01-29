//
//  QLMerchantNetWorkingUtil.h
//  WTDemo
//
//  Created by 计恩良 on 2019/1/12.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMerchantNetWorkingUtil : NSObject
+ (void)getBusinessCategory:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
+ (void)getBusinessIndex:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
+ (void)getBusinessDetail:(NSString *)businessId successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
+ (void)getAllPingJia:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
+ (void)getPingJiaDetail:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
+ (void)getZhuYeInfo:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
@end
