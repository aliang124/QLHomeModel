//
//  WTDateUtil.h
//  IFXY
//
//  Created by admin on 2018/6/21.
//  Copyright © 2018年 IFly. All rights reserved.
//

#import <Foundation/Foundation.h>
#define WTDateFormatDate @"yyyy-MM-dd HH:mm:ss"
#define WTDateFormatDay @"yyyy-MM-dd"
#define WTDateFormatTime @"HH:mm:ss"

@interface WTDateUtil : NSObject
/**
 *     @brief     日期转换为格式字符串.
 *
 *     @param      date      待转换日期.
 *     @param      format      日期格式字符串.
 *
 *     @return     日期字符串.
 */
+ (NSString *)date2String:(NSDate *)date format:(NSString *)format;

/**
 *     @brief     当前日期转换为格式字符串.
 *
 *     @return     日期字符串, yyyy-MM-dd HH:mm:ss.
 */
+ (NSString *)date2StringNow;

/**
 *     @brief     日期转换为格式字符串.
 *
 *     @param      date      待转换日期.
 *
 *     @return     日期字符串, yyyy-MM-dd HH:mm:ss.
 */
+ (NSString *)date2String:(NSDate *)date;

/**
 *     @brief     日期转换为格式字符串.
 *
 *     @param      date      待转换日期.
 *
 *     @return     日期字符串, yyyy-MM-dd.
 */
+ (NSString *)date2StringDay:(NSDate *)date;

/**
 *     @brief     日期转换为格式字符串.
 *
 *     @param      date      待转换日期.
 *
 *     @return     日期字符串, HH:mm:ss.
 */
+ (NSString *)date2StringTime:(NSDate *)date;

/**
 *     @brief     日期字符串转换为日期.
 *
 *     @param      date      待转换日期字符串.
 *     @param      format      日期格式字符串.
 *
 *     @return     日期.
 */
+ (NSDate *)string2Date:(NSString *)dateStr format:(NSString *)format;
/**获取两个时间差值*/
+ (long long)getDurationStartTime:(NSString *)startTime endTime:(NSString *)endTime;
@end
