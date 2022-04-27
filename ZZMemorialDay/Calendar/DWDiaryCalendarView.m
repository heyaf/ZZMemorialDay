//
//  DWDiaryCalendarView.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/11.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "DWDiaryCalendarView.h"
#import "PrefixHeader.pch"

@interface DWDiaryCalendarView()

@property (strong, nonatomic) UILabel *labelMonth;
@property (strong, nonatomic) UILabel *labelDay;
@property (strong, nonatomic) UILabel *labelWeek;
@property (strong, nonatomic) UILabel *labelNong;

@end

@implementation DWDiaryCalendarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.labelMonth];
        [self addSubview:self.labelDay];
        [self addSubview:self.labelWeek];
        [self addSubview:self.labelNong];
    }
    return self;
}

- (UILabel *)labelMonth {
    if (!_labelMonth) {
        _labelMonth = [[UILabel alloc] init];
        _labelMonth.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:30];
        _labelMonth.textColor = DWDiaryThemeBlueColor;
    }
    return _labelMonth;
}

- (UILabel *)labelDay {
    if (!_labelDay) {
        _labelDay = [[UILabel alloc] init];
        _labelDay.font = [UIFont fontWithName:@"STHeitiTC-Light" size:100];
        _labelDay.textColor = DWDiaryThemeBlueColor;
    }
    return _labelDay;
}

- (UILabel *)labelWeek {
    if (!_labelWeek) {
        _labelWeek = [[UILabel alloc] init];
        _labelWeek.font = [UIFont fontWithName:@"STHeitiSC-Light" size:28];
        _labelWeek.textColor = DWDiaryThemeBlueColor;
    }
    return _labelWeek;
}
- (UILabel *)labelNong {
    if (!_labelNong) {
        _labelNong = [[UILabel alloc] init];
        _labelNong.font = [UIFont fontWithName:@"STHeitiSC-Light" size:20];
        _labelNong.textColor = DWDiaryThemeBlueColor;
    }
    return _labelNong;
}

- (void)setDicDate:(NSDictionary *)dicDate {
    if (dicDate) {
        _dicDate = dicDate;
        
        CGRect rect;
        
        self.labelMonth.text = dicDate[@"month"];
        [self.labelMonth sizeToFit];
        rect = self.labelMonth.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = 40;
        self.labelMonth.frame = rect;
        
        self.labelDay.text = dicDate[@"day"];
        [self.labelDay sizeToFit];
        rect = self.labelDay.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = CGRectGetMaxY(self.labelMonth.frame) + 20;
        self.labelDay.frame = rect;
        
        self.labelWeek.text = dicDate[@"week"];
        [self.labelWeek sizeToFit];
        rect = self.labelWeek.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = CGRectGetMaxY(self.labelDay.frame) + 20;
        self.labelWeek.frame = rect;
        
        NSMutableString *yearStr = dicDate[@"year"];
        NSMutableString *monthStr = dicDate[@"month"];

        NSString *timer = [NSString stringWithFormat:@"%@-%@-%@",[yearStr stringByReplacingOccurrencesOfString:@"年" withString:@""],[monthStr stringByReplacingOccurrencesOfString:@"月" withString:@""],dicDate[@"day"]];
        NSDate *data = [NSString getDateWithDateString:timer formatString:@"yyyy-MM-dd"];
        if (k_isValidString(dicDate[@"time"])) {
            timer = [NSString stringWithFormat:@"%@-%@-%@ %@",[yearStr stringByReplacingOccurrencesOfString:@"年" withString:@""],[monthStr stringByReplacingOccurrencesOfString:@"月" withString:@""],dicDate[@"day"],dicDate[@"time"]];
            data = [NSString getDateWithDateString:timer formatString:@"yyyy-MM-dd HH:mm"];
        }
        NSString *str = [NSString getChineseCalendarWithDate:data];
        self.labelNong.text = str;
        [self.labelNong sizeToFit];
        rect = self.labelNong.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = CGRectGetMaxY(self.labelWeek.frame)+10;
        self.labelNong.frame = rect;
        
    }
}

@end
