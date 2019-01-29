//
//  QLPingJiaViewController.h
//  WTDemo
//
//  Created by 计恩良 on 2018/12/31.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "WTLoadFailEmpty.h"

@interface QLPingJiaListViewController : QLFormViewController
@property (nonatomic,copy) NSString *businessId;

@property (nonatomic,strong) NSMutableArray *listArray;
@property (nonatomic,assign) int pageIndex;
@property (nonatomic,assign) int totalPage;
@property (nonatomic,assign) int type;
@end
