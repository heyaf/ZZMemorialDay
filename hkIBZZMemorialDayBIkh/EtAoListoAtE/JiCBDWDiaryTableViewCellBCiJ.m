//
//  DWDiaryTableViewCell.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/1.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "JiCBDWDiaryTableViewCellBCiJ.h"
#import "edLCDWDiaryCellContentViewCLde.h"

//ZZProductmark
#define Switcher @"zXeWAlphaWindowWeXz"

typedef void (^BLgGDelegateGgLBHandler) (NSString *bWxYIvWeatherYxWb,NSString *raHbLaContextbHaR);//ZZProductmark
typedef void (^DelegateComplete) (NSString *yOJbLabelWeekTimebJOY);//ZZProductmark


#define mjoXDWScreenWidthXojm [UIScreen mainScreen].bounds.size.width

@interface JiCBDWDiaryTableViewCellBCiJ()

@property (strong, nonatomic) edLCDWDiaryCellContentViewCLde *zpMVCellContentViewVMpz;

@property(nonatomic,assign) int dcLADisKeyboardButtonALcd;//ZZProductmark
@property(nonatomic,copy) DelegateComplete zmWgIsEmptygWmz;//ZZProductmark

@property(nonatomic,copy) BLgGDelegateGgLBHandler lXNNIsFullNNXL;//ZZProductmark

@end

@implementation JiCBDWDiaryTableViewCellBCiJ

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        _zpMVCellContentViewVMpz = [[edLCDWDiaryCellContentViewCLde alloc] initWithFrame:CGRectMake(8, 8, mjoXDWScreenWidthXojm - 16, 74)];
        [self.contentView addSubview:_zpMVCellContentViewVMpz];
        
    }
    return self;
}

- (void)setDicDate:(NSDictionary *)dicDate {
    if (dicDate) {
        _dicDate = dicDate;
        _zpMVCellContentViewVMpz.dicDate = dicDate;
    }
}

- (void)setTitle:(NSString *)title {
    if (title) {
        _title = title;
        _zpMVCellContentViewVMpz.title = title;
    }
}

- (void)setDetail:(NSString *)detail {
    if (detail) {
        _detail = detail;
        _zpMVCellContentViewVMpz.detail = detail;
    }
}

- (void)setEmotion:(NSString *)emotion {
    if (emotion) {
        _emotion = emotion;
        _zpMVCellContentViewVMpz.emotion = emotion;
    }
}

- (void)setWeather:(NSString *)weather {
    if (weather) {
        _weather = weather;
        _zpMVCellContentViewVMpz.weather = weather;
    }
}

@end
