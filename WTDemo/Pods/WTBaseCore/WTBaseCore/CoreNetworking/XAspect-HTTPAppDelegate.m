//
//  XAspect-HTTPAppDelegate.m
//  WTBaseCore
//
//  Created by jienliang on 18/02/28.
//  Copyright © 2018年 jienliang. All rights reserved.
//

#import "WTAppDelegate.h"
#import "WTHttpUtil.h"
#import "XAspect.h"

#define AtAspect HTTPAppDelegate

#define AtAspectOfClass WTAppDelegate
@classPatchField(WTAppDelegate)

AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions)
{
    //开启网络监听
    [WTHttpUtil startMonitoring];
    
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}

@end
#undef AtAspectOfClass
#undef AtAspect
