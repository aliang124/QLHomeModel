//
//  WTUtil.h
//  WTBaseCore
//
//  Created by jienliang on 17/6/23.
//  Copyright (c) 2017年 jienliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WTAppDelegate.h"

@class MFMessageComposeViewController;
@protocol MFMessageComposeViewControllerDelegate;

@interface WTUtil : NSObject
/**
 *    @brief    判断是否串是否为空.
 *
 *    @return    BOOL.
 */
+ (BOOL)strNilOrEmpty:(NSString *)str;
/**
 *    @brief    格式化字符串.
 *
 *    @return    字符串实例.
 */
+ (NSString *)strRelay:(NSString *)str;

/**
 *    @brief    拨打电话
 *
 *    @param     phoneNo     电话号码
 *
 *    @return
 */
+ (void)call:(NSString *)phoneNo;
/**
 *    @brief    手机号中间4位*号表示
 *
 *    @param     phoneNo     电话号码
 *
 *    @return
 */
+ (NSString *)toXingPhone:(NSString *)phone;
/**
 *    @brief    发送短信
 *
 *    @param     bodyOfMessage     短信内容
 *    @param     recipients      收信人
 *    @param     delegate        代理
 *
 *    @return             发送短信视图
 */
+ (MFMessageComposeViewController *)sendSMS:(NSString *)bodyOfMessage
                              recipientList:(NSArray *)recipients
                                   delegate:(UIViewController<MFMessageComposeViewControllerDelegate> *)delegate;
/**
 *	@brief	通过颜色来生成一个纯色图
 *
 *	@param 	color 	颜色值
 *
 *	@return	图片
 */
+ (UIImage *)createImageFromColor:(UIColor *)color;
/**
 *	@brief	取得文本在固定的字体情况下，在固定大小控件中的大小
 *
 *	@param 	str 	文本
 *	@param 	font 	字体
 *	@param 	size 	控件大小
 *
 *	@return	文本大小
 */
+ (CGSize)sizeForFont:(NSString *)str Font:(UIFont *)font CtrlSize:(CGSize)size;

/**
 *     @brief     获取app版本号
 *
 *  @return     版本号
 */
+ (NSString *)getAppVersion;
/**
 *     @brief guid字符串
 *
 *     @return     字符串实例.
 */
+ (NSString *)strGUID;
/**
 *     @brief 应用程序对象
 *
 *     @return     AppDelegate.
 */
+ (WTAppDelegate *)appDelegate;
@end
