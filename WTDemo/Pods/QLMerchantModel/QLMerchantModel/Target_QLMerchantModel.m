//
//  Target_QLMerchantModel.m
//
//
//  Created by elji on 2018/2/9.
//  Copyright © 2018年 elji. All rights reserved.
//

#import "Target_QLMerchantModel.h"
#import "QLMerchantListViewController.h"
@implementation Target_QLMerchantModel
- (UIViewController *)Action_merchantListVC:(NSDictionary*)param {
    QLMerchantListViewController *login = [[QLMerchantListViewController alloc] init];
    return login;
}
@end
