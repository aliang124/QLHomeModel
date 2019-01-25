//
//  Target_QLMerchantModel.m
//
//
//  Created by elji on 2018/2/9.
//  Copyright © 2018年 elji. All rights reserved.
//

#import "Target_QLTieBaModel.h"
#import "QLTieBaDetailViewController.h"

@implementation Target_QLTieBaModel
- (UIViewController *)Action_tieBaDetailVC:(NSDictionary*)param {
    QLTieBaDetailViewController *vc = [[QLTieBaDetailViewController alloc] init];
    return vc;
}
@end
