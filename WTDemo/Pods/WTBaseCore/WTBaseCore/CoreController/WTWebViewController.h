//
//  WTWebViewController.h
//  IFXY
//
//  Created by elji on 15/7/14.
//  Copyright (c) 2015年 elji. All rights reserved.
//
#import <WebKit/WebKit.h>
#import "WTViewController.h"

@interface WTWebViewController : WTViewController
@property (nonatomic,copy) NSString *urlString;
@property (nonatomic,copy) NSString *navTitle;
- (instancetype)initWithUrlString:(NSString *)aUrlString;
@end
