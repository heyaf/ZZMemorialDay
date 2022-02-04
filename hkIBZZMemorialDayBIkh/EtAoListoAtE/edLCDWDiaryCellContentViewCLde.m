//
//  DWDiaryCellContentView.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/1.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "edLCDWDiaryCellContentViewCLde.h"
#import "whHIPrefixHeaderIHhw.pch"

//ZZProductmark
#define NSax_instancexaSn @"ycCzTableViewzCcy"

typedef void (^EjBmCellContentViewmBjEHandler) (int rRYXButtonHappyXYRr);//ZZProductmark


@interface edLCDWDiaryCellContentViewCLde()

@property (strong, nonatomic) UILabel *judgeNight;
@property (strong, nonatomic) UILabel *jAoVLabelWeekVoAj;
@property (strong, nonatomic) UILabel *zjtULabelTimeUtjz;
@property (strong, nonatomic) UILabel *pronounceRubric;
@property (strong, nonatomic) UILabel *DVhILabelDetailIhVD;
@property (strong, nonatomic) UIImageView *fourBraveOut;
@property (strong, nonatomic) UIImageView *ivInches;

@property(nonatomic,assign) double iehaAlphaWindowaheI;//ZZProductmark
@property(nonatomic,copy) EjBmCellContentViewmBjEHandler foregroundDate;//ZZProductmark
@end

@implementation edLCDWDiaryCellContentViewCLde

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3.0;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.judgeNight];
        [self addSubview:self.jAoVLabelWeekVoAj];
        [self addSubview:self.zjtULabelTimeUtjz];
        [self addSubview:self.pronounceRubric];
        [self addSubview:self.DVhILabelDetailIhVD];
        [self addSubview:self.fourBraveOut];
        [self addSubview:self.ivInches];
    }
    return self;
}

- (UILabel *)judgeNight {
    if (!_judgeNight) {
        _judgeNight = [[UILabel alloc] init];
        _judgeNight.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@%@%@%@",@"ST",@"HeitiSC-",@"M",@"e",@"di",@"u",@"m"]) size:25];
        _judgeNight.textColor = byMUDWDiaryThemeBlueColorUMyb;
    }
    return _judgeNight;
}

- (UILabel *)jAoVLabelWeekVoAj {
    if (!_jAoVLabelWeekVoAj) {
        _jAoVLabelWeekVoAj = [[UILabel alloc] init];
        _jAoVLabelWeekVoAj.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@",@"CourierNewPSM",@"T"]) size:10];
        _jAoVLabelWeekVoAj.textColor = byMUDWDiaryThemeBlueColorUMyb;
    }
    return _jAoVLabelWeekVoAj;
}

- (UILabel *)zjtULabelTimeUtjz {
    if (!_zjtULabelTimeUtjz) {
        _zjtULabelTimeUtjz = [[UILabel alloc] init];
        _zjtULabelTimeUtjz.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@",@"S",@"THeitiSC-Lig",@"h",@"t"]) size:10];
        _zjtULabelTimeUtjz.textColor = byMUDWDiaryThemeBlueColorUMyb;
    }
    return _zjtULabelTimeUtjz;
}

- (UILabel *)pronounceRubric {
    if (!_pronounceRubric) {
        _pronounceRubric = [[UILabel alloc] init];
        _pronounceRubric.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@%@%@%@",@"ST",@"HeitiSC-",@"M",@"e",@"di",@"u",@"m"]) size:14];
        _pronounceRubric.textColor = byMUDWDiaryThemeBlueColorUMyb;
    }
    return _pronounceRubric;
}

- (UILabel *)DVhILabelDetailIhVD {
    if (!_DVhILabelDetailIhVD) {
        _DVhILabelDetailIhVD = [[UILabel alloc] init];
        _DVhILabelDetailIhVD.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@",@"S",@"THeitiSC-Lig",@"h",@"t"]) size:12];
        _DVhILabelDetailIhVD.textColor = byMUDWDiaryThemeBlueColorUMyb;
    }
    return _DVhILabelDetailIhVD;
}

- (UIImageView *)fourBraveOut {
    if (!_fourBraveOut) {
        _fourBraveOut = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 40 - 20, 12, 20, 20)];
    }
    return _fourBraveOut;
}

- (UIImageView *)ivInches {
    if (!_ivInches) {
        _ivInches = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 20 - 10 , 12, 20, 20)];
    }
    return _ivInches;
}

- (void)setDicDate:(NSDictionary *)dicDate {
    if (dicDate) {
        _dicDate = dicDate;
        
        CGFloat margin = 12.0;
        CGFloat marginTime = 8.0;
        CGRect rect;
        
        self.jAoVLabelWeekVoAj.text = dicDate[([NSString stringWithFormat:@"%@%@",@"wee",@"k"])];
        [self.jAoVLabelWeekVoAj sizeToFit];
        rect = self.jAoVLabelWeekVoAj.frame;
        rect.origin.x = margin;
        rect.origin.y = self.frame.size.height - rect.size.height - margin;
        self.jAoVLabelWeekVoAj.frame = rect;
        
        self.judgeNight.text = dicDate[([NSString stringWithFormat:@"%@%@%@",@"d",@"a",@"y"])];
        [self.judgeNight sizeToFit];
        rect = self.judgeNight.frame;
        rect.origin.x = CGRectGetMidX(self.jAoVLabelWeekVoAj.frame) - rect.size.width / 2;
        rect.origin.y = margin - 2;
        self.judgeNight.frame = rect;
        
        self.zjtULabelTimeUtjz.text = dicDate[([NSString stringWithFormat:@"%@%@%@",@"ti",@"m",@"e"])];
        [self.zjtULabelTimeUtjz sizeToFit];
        rect = self.zjtULabelTimeUtjz.frame;
        rect.origin.x = CGRectGetMaxX(self.jAoVLabelWeekVoAj.frame) + margin;
        rect.origin.y = marginTime;
        self.zjtULabelTimeUtjz.frame = rect;
    }
}

- (void)setTitle:(NSString *)title {
    if (title) {
        _title = title;
        CGRect rect;
        self.pronounceRubric.text = title;
        [self.pronounceRubric sizeToFit];
        rect = self.pronounceRubric.frame;
        rect.origin.x = self.zjtULabelTimeUtjz.frame.origin.x;
        rect.origin.y = CGRectGetMaxY(self.zjtULabelTimeUtjz.frame) + 1.5;
        self.pronounceRubric.frame = rect;
    }
}

- (void)setDetail:(NSString *)detail {
    if (detail) {
        _detail = detail;
        CGRect rect;
        self.DVhILabelDetailIhVD.text = detail;
        [self.DVhILabelDetailIhVD sizeToFit];
        rect = self.DVhILabelDetailIhVD.frame;
        rect.origin.x = self.zjtULabelTimeUtjz.frame.origin.x;
        rect.origin.y = CGRectGetMaxY(self.pronounceRubric.frame) + 1.5;
        rect.size.width = 100;
        self.DVhILabelDetailIhVD.frame = rect;
    }
}

- (void)setWeather:(NSString *)weather {
    if (weather) {
        _weather = weather;
        self.fourBraveOut.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_blue", weather]];
    }
}

- (void)setEmotion:(NSString *)emotion {
    if (emotion) {
        _emotion = emotion;
        self.ivInches.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_blue", emotion]];
    }
}

@end
