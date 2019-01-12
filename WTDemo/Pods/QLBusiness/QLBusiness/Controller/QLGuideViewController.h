//
//  QLGuideViewController.h
//  QLBusiness
//
//  Created by jienliang on 2018/12/7.
//  Copyright © 2018   All rights reserved.
//

#import <UIKit/UIKit.h>
@interface QLGuideViewController : UIViewController
@property (nonatomic,copy) NSArray *imageArray;
@property (copy, readwrite, nonatomic) UIButton * (^onCreateButton)(void);
@end
