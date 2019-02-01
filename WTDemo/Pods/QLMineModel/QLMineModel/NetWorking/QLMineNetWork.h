//
//  QLMineNetWork.h
//  WTDemo
//
//  Created by 计恩良 on 2019/1/9.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QLMineNetWork : NSObject
/*  获取个人中心数据
 */
+ (void)getAccountCenterInfo:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
/*  获取个人资料
 */
+ (void)getAccountMemberInfo:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
/*  登录
 ** info:个人信息字典
 */
+ (void)updateUserInfo:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
/*  粉丝
 ** info:
 */
+ (void)getFlowerFuns:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
/*  粉丝里关注用户
 ** info:
 */
+ (void)guanZhuUser:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
/*  关注列表
 ** info:
 */
+ (void)getFlowerIndex:(NSDictionary *)info successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
@end
