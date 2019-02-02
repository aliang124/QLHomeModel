//
//  QLBottomView.h
//  WTDemo
//
//  Created by 计恩良 on 2019/1/26.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTBaseCore.h"
#import "QLBusiness.h"
typedef void(^pingjiaCompletionHandler)(void);

@interface QLBottomView : UIView
@property (nonatomic,copy) id info;
@property (nonatomic,copy) NSString *businessId;
//评价完成回调
@property (nonatomic, copy) pingjiaCompletionHandler pingjiaCompletionHandler;
@end
