//
//  NSString+extention.h
//  ZZMemorialDay
//
//  Created by mac on 2022/4/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (extention)
+(NSDate *)getDateWithDateString:(NSString *)strDate formatString:(NSString*)strFormat;
+(NSString*)getChineseCalendarWithDate:(NSDate *)date;
//距今多少天
+ (NSInteger)distanceTodayDayCount:(NSString *)inputDate;
//获取当前时间
+ (NSString *)timeNowDate;
//获取当前时间戳
+ (NSTimeInterval)nowintTimestamp;
@end

NS_ASSUME_NONNULL_END
