//
//  QLSearchView.h
//  WTDemo
//
//  Created by 计恩良 on 2019/2/2.
//  Copyright © 2019年 计恩良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTBaseCore.h"
#import "QLBusiness.h"

@interface QLSearchView : UIView <RETableViewManagerDelegate>
@property (nonatomic, strong) UITableView *formTable;
@property (nonatomic, strong) RETableViewManager *formManager;

@property (copy, readwrite, nonatomic) void (^selectionHandler)(NSString *keyText);

@end
