//
//  Target_QLMineModel.m
//
//
//  Created by elji on 2018/2/9.
//  Copyright © 2018年 elji. All rights reserved.
//

#import "Target_QLMineModel.h"
#import "QLMessageViewController.h"
@implementation Target_QLMineModel
- (UIViewController *)Action_messageVC:(NSDictionary*)param {
    QLMessageViewController *msg = [[QLMessageViewController alloc] init];
    return msg;
}
@end
