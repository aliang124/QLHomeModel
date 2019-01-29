//
//  QLFunsViewController.h
//  WTDemo
//
//  Created by 计恩良 on 2018/12/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLFunsViewController : QLFormViewController
@property (nonatomic,strong) NSMutableArray *listArray;
@property (nonatomic,assign) int pageIndex;
@property (nonatomic,assign) int totalPage;
@end
