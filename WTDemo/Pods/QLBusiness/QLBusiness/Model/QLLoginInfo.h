//
//  QLLoginInfo.h
//  QLBusiness
//
//  Created by jienliang on 14-4-28.
//  Copyright (c) 2014年 jienliang. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface QLLoginInfo : NSObject{
}
@property (nonatomic, copy) NSString *phone;//手机号
@property (nonatomic, copy) NSString *username;//用户名
@property (nonatomic, copy) NSString *userId;//用户Id
@property (nonatomic, copy) NSString *token;//token
@property (nonatomic, copy) NSString *image;//用户头像

+ (QLLoginInfo *)sharedInstance;

//设置登录信息
- (void)setLoginInfoWithDict:(NSDictionary *)dInfo;
//写入本地登录文件路径
- (void)writeUserInfo:(NSDictionary *)dic;
//从文件中读取用户信息
- (void)readLoginInfoFromFile;
//判断是否登录
- (BOOL)isLogin;
@end
