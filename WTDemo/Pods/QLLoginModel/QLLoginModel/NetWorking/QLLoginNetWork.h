//
//  QLLoginNetWork.h
//  WTDemo
//
//  Created by 计恩良 on 2019/1/9.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QLLoginNetWork : NSObject
/*  获取验证码
 ** phone:手机号
 ** type:1:注册验证码，2:找回密码验证码，10:验证码
 */
+ (void)SentSMSMessage:(NSString *)phone type:(NSString *)type successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;

/*  注册
 ** phone:手机号
 ** pass:登录密码
 ** code:验证码
 */
+ (void)registerWithPhone:(NSString *)phone password:(NSString *)pass code:(NSString *)code successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
/*  登录
 ** phone:手机号
 ** pass:登录密码
 */
+ (void)loginWithPhone:(NSString *)phone password:(NSString *)pass successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
@end
