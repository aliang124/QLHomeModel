//
//  Target_QLMineModel.m
//
//
//  Created by elji on 2018/2/9.
//  Copyright © 2018年 elji. All rights reserved.
//

#import "Target_QLHomeModel.h"
#import "QLSearchViewController.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"

@implementation Target_QLHomeModel
- (UIViewController *)Action_searchVC:(NSDictionary*)param {
    QLSearchViewController *msg = [[QLSearchViewController alloc] init];
    return msg;
}

- (void)Action_initRoot:(NSDictionary*)param {
    WTTabBarItem *itIndex = [[WTTabBarItem alloc] init];
    itIndex.titleText = @"发现";
    itIndex.normalImage = @"tabbar_translate";
    itIndex.selectImage = @"tabbar_translate_highlighted";
    itIndex.textNormaltColor = QL_DescColor_Gray;
    itIndex.textSelectColor = QL_UserName_TitleColor_Black;
    itIndex.vc = [self stringChangeToClass:@"QLHomeViewController"];
    
    WTTabBarItem *itCare = [[WTTabBarItem alloc] init];
    itCare.titleText = @"关注";
    itCare.normalImage = @"tabbar_application";
    itCare.selectImage = @"tabbar_application_highlighted";
    itCare.textNormaltColor = QL_DescColor_Gray;
    itCare.textSelectColor = QL_UserName_TitleColor_Black;
    itCare.vc = [self stringChangeToClass:@"QLCareViewController"];
    
    WTTabBarItem *itTieBa = [[WTTabBarItem alloc] init];
    itTieBa.titleText = @"浪吧";
    itTieBa.normalImage = @"tabbar_langba";
    itTieBa.selectImage = @"tabbar_langba_highlighted";
    itTieBa.textNormaltColor = QL_DescColor_Gray;
    itTieBa.textSelectColor = QL_UserName_TitleColor_Black;
    itTieBa.vc = [self stringChangeToClass:@"QLTieBaViewController"];
    
    WTTabBarItem *itMine = [[WTTabBarItem alloc] init];
    itMine.titleText = @"我的";
    itMine.normalImage = @"tabbar_profile";
    itMine.selectImage = @"tabbar_profile_highlighted";
    itMine.textNormaltColor = QL_DescColor_Gray;
    itMine.textSelectColor = QL_UserName_TitleColor_Black;
    itMine.vc = [self stringChangeToClass:@"QLMineViewController"];
    
    QLTabbarController *tab = [[QLTabbarController alloc] init];
    tab.itemsArray = [NSArray arrayWithObjects:itIndex,itCare,itTieBa,itMine, nil];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tab];
    nav.navigationBarHidden = YES;
    [WTUtil appDelegate].window.rootViewController = nav;
    [[WTUtil appDelegate].window makeKeyAndVisible];
}

/**
 * @brief 将字符串转化为控制器.
 *
 * @param str 需要转化的字符串.
 *
 * @return 控制器(需判断是否为空).
 */
- (UIViewController*)stringChangeToClass:(NSString *)str {
    id vc = [[NSClassFromString(str) alloc]init];
    if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    return nil;
}
@end
