//
//  WTAlertUtil.h
//  IFXY
//
//  Created by admin on 2017/12/18.
//  Copyright © 2017年 IFly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WTAlertUtil : NSObject
+ (UIAlertController *)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelBtn:(NSString *)btnName okHandler:(void (^)(UIAlertAction *action))handler;
+ (UIAlertController *)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelBtn:(NSString *)cancelBtnName okBtn:(NSString *)okBtnName okHandler:(void (^)(UIAlertAction *action))handler;
+ (UIAlertController *)showAlertSheetWithTitle:(NSString *)title andMessage:(NSString *)message cancelBtn:(NSString *)cancelBtnName listArray:(NSArray*)listArray selectHandler:(void (^)(UIAlertAction *action))handler;
@end
