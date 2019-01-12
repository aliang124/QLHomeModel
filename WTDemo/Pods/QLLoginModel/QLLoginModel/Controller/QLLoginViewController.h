//
//  QLLoginViewController.h
//  Project
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTBaseCore.h"
#import "QLBusiness.h"
typedef void(^loginCompletionHandler)(void);

@interface QLLoginViewController : QLViewController
@property (nonatomic,copy) NSString *titleText;
//登录完成回调
@property (nonatomic, copy) loginCompletionHandler loginCompletionHandler;

@end
