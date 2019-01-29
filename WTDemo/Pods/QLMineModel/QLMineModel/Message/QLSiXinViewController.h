//
//  QLSiXinViewController.h
//  WTDemo
//
//  Created by 计恩良 on 2019/1/26.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import "QLFormViewController.h"

@interface QLSiXinViewController : QLFormViewController
@property (nonatomic,strong) NSMutableArray *listArray;
@property (nonatomic,assign) int pageIndex;
@property (nonatomic,assign) int totalPage;

@end
