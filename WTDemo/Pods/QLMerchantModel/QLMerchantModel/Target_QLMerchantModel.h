//
//  Target_QLMerchantModel.h
//  Login
//
//  Created by elji on 2018/2/9.
//  Copyright © 2018年 elji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Target_QLMerchantModel : NSObject
//跳转到商家列表
- (UIViewController *)Action_merchantListVC:(NSDictionary*)param;
//跳转商家详情
- (UIViewController *)Action_merchantDetailVC:(NSDictionary*)param;
//跳转到个人主页
- (UIViewController *)Action_zhuYeVC:(NSDictionary*)param;
//跳转到评价详情
- (UIViewController *)Action_pingJiaDetailVC:(NSDictionary*)param;
@end
