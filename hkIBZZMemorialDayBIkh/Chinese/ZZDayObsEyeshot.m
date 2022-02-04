//
//  DWDiaryCalendarView.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/11.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "ZZDayObsEyeshot.h"
#import "whHIPrefixHeaderIHhw.pch"

static NSString const * AaPDTVDetailDPaa = @"xpKNRightButtonNKpX";//ZZProductmark
typedef void (^LrnXButtonQuitXnrLComplete) (void);//ZZProductmark
@protocol ClaimProtocol <NSObject>
- (float)checkParole;//ZZProductmark

@end//ZZProductmark

@interface ZZDayObsEyeshot()

@property (strong, nonatomic) UILabel *EmrQLabelMonthQrmE;
@property (strong, nonatomic) UILabel *judgeNight;
@property (strong, nonatomic) UILabel *jAoVLabelWeekVoAj;

@property(nonatomic,strong) NSString *point;//ZZProductmark
@property(nonatomic,weak) id<ClaimProtocol> ivAFButtonCloudyFAvI;//ZZProductmark

@property(nonatomic,copy) LrnXButtonQuitXnrLComplete dUMEDicDateEMUD;//ZZProductmark
@end

@implementation ZZDayObsEyeshot

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.EmrQLabelMonthQrmE];
        [self addSubview:self.judgeNight];
        [self addSubview:self.jAoVLabelWeekVoAj];
    }
    return self;
}

- (UILabel *)EmrQLabelMonthQrmE {
    if (!_EmrQLabelMonthQrmE) {
        _EmrQLabelMonthQrmE = [[UILabel alloc] init];
        _EmrQLabelMonthQrmE.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@%@",@"S",@"THeitiSC-M",@"edi",@"u",@"m"]) size:30];
        _EmrQLabelMonthQrmE.textColor = byMUDWDiaryThemeBlueColorUMyb;
    }
    return _EmrQLabelMonthQrmE;
}

- (UILabel *)judgeNight {
    if (!_judgeNight) {
        _judgeNight = [[UILabel alloc] init];
        _judgeNight.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@",@"STHeitiTC-L",@"igh",@"t"]) size:100];
        _judgeNight.textColor = byMUDWDiaryThemeBlueColorUMyb;
    }
    return _judgeNight;
}

- (UILabel *)jAoVLabelWeekVoAj {
    if (!_jAoVLabelWeekVoAj) {
        _jAoVLabelWeekVoAj = [[UILabel alloc] init];
        _jAoVLabelWeekVoAj.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@",@"STHei",@"tiSC",@"-Ligh",@"t"]) size:28];
        _jAoVLabelWeekVoAj.textColor = byMUDWDiaryThemeBlueColorUMyb;
    }
    return _jAoVLabelWeekVoAj;
}

- (void)setDicDate:(NSDictionary *)dicDate {
    if (dicDate) {
        _dicDate = dicDate;
        
        CGRect rect;
        
        self.EmrQLabelMonthQrmE.text = dicDate[([NSString stringWithFormat:@"%@%@%@%@",@"m",@"o",@"nt",@"h"])];
        [self.EmrQLabelMonthQrmE sizeToFit];
        rect = self.EmrQLabelMonthQrmE.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = 40;
        self.EmrQLabelMonthQrmE.frame = rect;
        
        self.judgeNight.text = dicDate[([NSString stringWithFormat:@"%@%@",@"d",@"ay"])];
        [self.judgeNight sizeToFit];
        rect = self.judgeNight.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = CGRectGetMaxY(self.EmrQLabelMonthQrmE.frame) + 20;
        self.judgeNight.frame = rect;
        
        self.jAoVLabelWeekVoAj.text = dicDate[([NSString stringWithFormat:@"%@%@",@"wee",@"k"])];
        [self.jAoVLabelWeekVoAj sizeToFit];
        rect = self.jAoVLabelWeekVoAj.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = CGRectGetMaxY(self.judgeNight.frame) + 20;
        self.jAoVLabelWeekVoAj.frame = rect;
        
    }
}

@end
