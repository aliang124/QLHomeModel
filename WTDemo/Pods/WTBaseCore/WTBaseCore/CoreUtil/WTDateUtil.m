//
//  WTDateUtil.m
//  IFXY
//
//  Created by admin on 2018/6/21.
//  Copyright © 2018年 IFly. All rights reserved.
//

#import "WTDateUtil.h"

@implementation WTDateUtil
+ (NSString *)date2String:(NSDate *)date format:(NSString *)format {
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setDateFormat:format];
     NSString *dateStr = [dateFormatter stringFromDate:date];
     return dateStr;
}

+ (NSDate *)string2Date:(NSString *)dateStr format:(NSString *)format {
     NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
     [dateFormat setDateFormat:format];//设定时间格式,要注意跟下面的dateString匹配，否则日起将无效
     NSDate *date =[dateFormat dateFromString:dateStr];
     return date;
}

+ (NSString *)date2StringNow {
     NSDate *dateNow = [NSDate date];
     return [WTDateUtil date2String:dateNow format:WTDateFormatDate];
}

+ (NSString *)date2String:(NSDate *)date {
     return [WTDateUtil date2String:date format:WTDateFormatDate];
}

+ (NSString *)date2StringDay:(NSDate *)date {
     return [WTDateUtil date2String:date format:WTDateFormatDay];
}

+ (NSString *)date2StringTime:(NSDate *)date {
     return [WTDateUtil date2String:date format:WTDateFormatTime];
}

/**获取两个时间差值*/
+ (long long)getDurationStartTime:(NSString *)startTime endTime:(NSString *)endTime {
     if (startTime && endTime) {
          NSDateFormatter *strDateStr = [[NSDateFormatter alloc]init];
          [strDateStr setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
          NSDate *startdate = [strDateStr dateFromString:startTime];
          NSDate *enddate = [strDateStr dateFromString:endTime];
          //时间转时间戳的方法:
          NSTimeInterval aTime = [enddate timeIntervalSinceDate:startdate];
          return (long long)aTime;
     } else {
          return -1;
     }
}
@end
