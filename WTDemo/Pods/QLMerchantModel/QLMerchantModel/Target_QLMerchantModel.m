//
//  Target_QLMerchantModel.m
//
//
//  Created by elji on 2018/2/9.
//  Copyright © 2018年 elji. All rights reserved.
//

#import "Target_QLMerchantModel.h"
#import "QLMerchantListViewController.h"
#import "QLMerchantDetailViewController.h"

@implementation Target_QLMerchantModel
- (UIViewController *)Action_merchantListVC:(NSDictionary*)param {
    QLMerchantListViewController *vc = [[QLMerchantListViewController alloc] init];
    return vc;
}

- (UIViewController *)Action_merchantDetailVC:(NSDictionary*)param {
    QLMerchantDetailViewController *vc = [[QLMerchantDetailViewController alloc] init];
    return vc;
}
@end
