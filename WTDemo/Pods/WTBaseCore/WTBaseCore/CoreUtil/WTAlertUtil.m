//
//  WTAlertUtil.m
//  IFXY
//
//  Created by admin on 2017/12/18.
//  Copyright © 2017年 IFly. All rights reserved.
//

#import "WTAlertUtil.h"

@implementation WTAlertUtil
+ (UIAlertController *)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelBtn:(NSString *)btnName okHandler:(void (^ __nullable)(UIAlertAction *action))handler{
     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
     
     UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
          handler(action);
     }];
     [alertController addAction:cancel];
     return alertController;
}
+ (UIAlertController *)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelBtn:(NSString *)cancelBtnName okBtn:(NSString *)okBtnName okHandler:(void (^ __nullable)(UIAlertAction *action))handler{
     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
     UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelBtnName style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
          handler(action);
     }];
     UIAlertAction *okAction = [UIAlertAction actionWithTitle:okBtnName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
          handler(action);
     }];
     [alertController addAction:cancelAction];
     [alertController addAction:okAction];
     
     return alertController;
}

+ (UIAlertController *)showAlertSheetWithTitle:(NSString *)title andMessage:(NSString *)message cancelBtn:(NSString *)cancelBtnName listArray:(NSArray*)listArray selectHandler:(void (^ __nullable)(UIAlertAction *action))handler{
     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle: UIAlertControllerStyleActionSheet];
     
     UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelBtnName style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
     }];
     [alertController addAction:cancelAction];
     for (int i  = 0; i < listArray.count; i++) {
          NSString *t = listArray[i];
          UIAlertAction *myAction = [UIAlertAction actionWithTitle:t style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
               handler(action);
          }];
          [alertController addAction:myAction];
     }
     
     return alertController;
}
@end
