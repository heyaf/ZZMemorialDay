//
//  NSString+extention.m
//  ZZMemorialDay
//
//  Created by mac on 2022/4/22.
//

#import "NSString+extention.h"

@implementation NSString (extention)
+(NSDate *)getDateWithDateString:(NSString *)strDate formatString:(NSString*)strFormat{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    NSTimeZone *timeZone =  [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : strFormat];
    NSDate *dateTime = [formatter dateFromString:strDate];
    return dateTime;
}
+(NSString*)getChineseCalendarWithDate:(NSDate *)date{
 
    NSArray *chineseYears = [NSArray arrayWithObjects:
                       @"甲子", @"乙丑", @"丙寅",    @"丁卯",    @"戊辰",    @"己巳",    @"庚午",    @"辛未",    @"壬申",    @"癸酉",
                       @"甲戌",    @"乙亥",    @"丙子",    @"丁丑", @"戊寅",    @"己卯",    @"庚辰",    @"辛己",    @"壬午",    @"癸未",
                       @"甲申",    @"乙酉",    @"丙戌",    @"丁亥",    @"戊子",    @"己丑",    @"庚寅",    @"辛卯",    @"壬辰",    @"癸巳",
                       @"甲午",    @"乙未",    @"丙申",    @"丁酉",    @"戊戌",    @"己亥",    @"庚子",    @"辛丑",    @"壬寅",    @"癸丑",
                       @"甲辰",    @"乙巳",    @"丙午",    @"丁未",    @"戊申",    @"己酉",    @"庚戌",    @"辛亥",    @"壬子",    @"癸丑",
                       @"甲寅",    @"乙卯",    @"丙辰",    @"丁巳",    @"戊午",    @"己未",    @"庚申",    @"辛酉",    @"壬戌",    @"癸亥", nil];
    
    NSArray *chineseMonths=[NSArray arrayWithObjects:
                        @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                        @"九月", @"十月", @"冬月", @"腊月", nil];
    
    
    NSArray *chineseDays=[NSArray arrayWithObjects:
                      @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                      @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                      @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    
    
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
 
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];
    
    
    NSString *y_str = [chineseYears objectAtIndex:localeComp.year-1];
    NSString *m_str = [chineseMonths objectAtIndex:localeComp.month-1];
    NSString *d_str = [chineseDays objectAtIndex:localeComp.day-1];
 
    NSString *chineseCal_str =[NSString stringWithFormat: @"%@年 %@ %@",y_str,m_str,d_str];
    
    
    return chineseCal_str;
}
+ (NSInteger)distanceTodayDayCount:(NSString *)inputDate{
    NSDate *nowDate = [NSDate date]; // 当前时间
        
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *creat = [formatter dateFromString:inputDate]; // 传入的时间
        
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *compas = [calendar components:unit fromDate:creat toDate:nowDate options:0];
    NSLog(@"year=%zd  month=%zd  day=%zd hour=%zd  minute=%zd",compas.year,compas.month,compas.day,compas.hour,compas.minute);
    return compas.day;
}
@end
