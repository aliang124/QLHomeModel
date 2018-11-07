//
//  WTUtil.h
//  WTBaseCore
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#import "WTUtil.h"
#import "NSString+Category.h"
#import <MessageUI/MessageUI.h>

@implementation WTUtil
+ (BOOL)strNilOrEmpty:(NSString *)str {
    return str == nil
    || str == NULL
    || [str isKindOfClass:[NSNull class]]
    ||([str respondsToSelector:@selector(length)]
       && [(NSData *)str length] == 0)
    || ([str respondsToSelector:@selector(count)]
        && [(NSArray *)str count] == 0);
}

+ (NSString *)strRelay:(NSString *)str
{
    if([WTUtil strNilOrEmpty:str]){
        return @"";
    }
    else if([str isKindOfClass:[NSString class]]){
        return str;
    } else if ([str isKindOfClass:[NSNumber class]]) {
        return [((NSNumber *)str) stringValue];
    }
    return [str trim];
}

+ (void)call:(NSString *)phoneNo
{
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNo]];
    UIWebView*phoneCallWebView =[[UIWebView alloc] init];
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
}

+ (NSString *)toXingPhone:(NSString *)phone {
    NSString *telPhone = [WTUtil strRelay:phone];
    if (telPhone.length > 7) {
        telPhone = [telPhone stringByReplacingCharactersInRange:NSMakeRange(3,4 ) withString:@"****"];
    }
    return telPhone;
}

+ (MFMessageComposeViewController *)sendSMS:(NSString *)bodyOfMessage
                              recipientList:(NSArray *)recipients
                                   delegate:(UIViewController<MFMessageComposeViewControllerDelegate> *)delegate

{
    MFMessageComposeViewController *megVC = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText]) {
        
        megVC.body = bodyOfMessage;
        if (recipients != nil) {
            megVC.recipients = recipients;
        }
        
        megVC.messageComposeDelegate = delegate;
        [delegate presentViewController:megVC animated:YES completion:^{ }];
    }
    return megVC;
}

+ (UIImage *)createImageFromColor:(UIColor *)color
{
    CGSize sz = CGSizeMake(1, 1);
    CGRect rect = CGRectMake(0, 0, sz.width,sz.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (CGSize)sizeForFont:(NSString *)str Font:(UIFont *)font CtrlSize:(CGSize)size
{
    CGSize sz = CGSizeZero;
    NSDictionary *attributes = @{NSFontAttributeName:font,};
    sz = [str boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine |
          NSStringDrawingUsesLineFragmentOrigin |
          NSStringDrawingUsesFontLeading
                        attributes:attributes
                           context:nil].size;
    return sz;
}

+ (NSString *)getAppVersion {
     return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)strGUID {
     CFUUIDRef    uuidObj = CFUUIDCreate(nil);//create a new GUID
     NSString    *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
     NSString    *guidStr = [uuidString lowercaseString];
     CFRelease(uuidObj);
     return guidStr;
}

+ (WTAppDelegate *)appDelegate {
    return ((WTAppDelegate *)[UIApplication sharedApplication].delegate);
}
@end
