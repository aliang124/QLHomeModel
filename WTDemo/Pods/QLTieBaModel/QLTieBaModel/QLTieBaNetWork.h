//
//  QLTieBaNetWork.h
//  WTDemo
//
//  Created by 计恩良 on 2019/1/9.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QLTieBaNetWork : NSObject
/*  获取贴吧分类接口
 */
+ (void)getTieBaCatogery:(NSDictionary *)param successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
/*  获取贴吧列表
 */
+ (void)getTieBaList:(NSDictionary *)param successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
/*  获取贴吧详情
 */
+ (void)getTieBaDetail:(NSDictionary *)param successHandler:(void (^)(id json))successHandler failHandler:(void (^)(NSString *message))failHandler;
@end
