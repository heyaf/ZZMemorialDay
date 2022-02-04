//
//  DWDiaryTypingCalendarView.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/12.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "ERAJDWDiaryTypingCalendarViewJARE.h"
#import "whHIPrefixHeaderIHhw.pch"


//ZZProductmark
#define ArrayDayAcquisition @"gOeQDetailQeOG"

typedef void (^GhAuLabelMessageuAhgBlock) (float jTmuTVDetailumTj,BOOL tapView);//ZZProductmark

@protocol ThyroxinFluorineTitleExtension <NSObject>
- (void)tgdUDicDateUdgt:(int)mjIUWindowUIjm pictureAnimated:(float)cmnTButtonRainTnmC;//ZZProductmark

@end//ZZProductmark

@interface ERAJDWDiaryTypingCalendarViewJARE()

@property (strong, nonatomic) UILabel *EmrQLabelMonthQrmE;
@property (strong, nonatomic) UILabel *judgeNight;
@property (strong, nonatomic) UILabel *jAoVLabelWeekVoAj;
@property (strong, nonatomic) UIButton *hhGXLeftButtonXGhh;
@property (strong, nonatomic) UIButton *iCwKRightButtonKwCi;

@property (strong, nonatomic) UILabel *NIaOLabelSmallOaIN;

@property(nonatomic,strong) NSString *zCMyArrayNumButtonyMCZ;//ZZProductmark

@property(nonatomic,weak) id<ThyroxinFluorineTitleExtension> gwihDetailhiwg;//ZZProductmark

@property(nonatomic,copy) GhAuLabelMessageuAhgBlock bghmLabelMonthmhgb;//ZZProductmark

@end

@implementation ERAJDWDiaryTypingCalendarViewJARE

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = byMUDWDiaryThemeBlueColorUMyb;
        
        [self addSubview:self.EmrQLabelMonthQrmE];
        [self addSubview:self.judgeNight];
        [self addSubview:self.jAoVLabelWeekVoAj];
        [self addSubview:self.hhGXLeftButtonXGhh];
        [self addSubview:self.iCwKRightButtonKwCi];
    }
    return self;
}

- (UILabel *)EmrQLabelMonthQrmE {
    if (!_EmrQLabelMonthQrmE) {
        _EmrQLabelMonthQrmE = [[UILabel alloc] init];
        _EmrQLabelMonthQrmE.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@%@",@"STHeit",@"iS",@"C-Medi",@"u",@"m"]) size:20];
        _EmrQLabelMonthQrmE.textColor = [UIColor whiteColor];
    }
    return _EmrQLabelMonthQrmE;
}

- (UILabel *)judgeNight {
    if (!_judgeNight) {
        _judgeNight = [[UILabel alloc] init];
        _judgeNight.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@%@",@"STHeit",@"iTC-L",@"i",@"g",@"ht"]) size:40];
        _judgeNight.textColor = [UIColor whiteColor];
    }
    return _judgeNight;
}

- (UILabel *)jAoVLabelWeekVoAj {
    if (!_jAoVLabelWeekVoAj) {
        _jAoVLabelWeekVoAj = [[UILabel alloc] init];
        _jAoVLabelWeekVoAj.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@%@",@"STHeiti",@"SC-L",@"ig",@"h",@"t"]) size:20];
        _jAoVLabelWeekVoAj.textColor = [UIColor whiteColor];
    }
    return _jAoVLabelWeekVoAj;
}

- (UILabel *)NIaOLabelSmallOaIN {
    if (!_NIaOLabelSmallOaIN) {
        _NIaOLabelSmallOaIN = [[UILabel alloc] init];
        _NIaOLabelSmallOaIN.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@%@",@"STHeiti",@"SC-L",@"ig",@"h",@"t"]) size:15];
        _NIaOLabelSmallOaIN.textColor = [UIColor whiteColor];
    }
    return _NIaOLabelSmallOaIN;
}

- (void)setDicDate:(NSDictionary *)dicDate {
    if (dicDate) {
        _dicDate = dicDate;
        
        CGRect rect;
        
        self.EmrQLabelMonthQrmE.text = dicDate[([NSString stringWithFormat:@"%@%@",@"mont",@"h"])];
        [self.EmrQLabelMonthQrmE sizeToFit];
        rect = self.EmrQLabelMonthQrmE.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = 8;
        self.EmrQLabelMonthQrmE.frame = rect;
        
        self.judgeNight.text = dicDate[([NSString stringWithFormat:@"%@%@",@"da",@"y"])];
        [self.judgeNight sizeToFit];
        rect = self.judgeNight.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = CGRectGetMaxY(self.EmrQLabelMonthQrmE.frame);
        self.judgeNight.frame = rect;
        
        self.jAoVLabelWeekVoAj.text = dicDate[([NSString stringWithFormat:@"%@%@%@%@",@"w",@"e",@"e",@"k"])];
        [self.jAoVLabelWeekVoAj sizeToFit];
        rect = self.jAoVLabelWeekVoAj.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = CGRectGetMaxY(self.judgeNight.frame);
        self.jAoVLabelWeekVoAj.frame = rect;
    }
}

- (UIButton *)hhGXLeftButtonXGhh {
    if (!_hhGXLeftButtonXGhh) {
        _hhGXLeftButtonXGhh = [UIButton buttonWithType:UIButtonTypeCustom];
        [_hhGXLeftButtonXGhh setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@",@"le",@"f",@"t"])] forState:UIControlStateNormal];
        [_hhGXLeftButtonXGhh addTarget:self action:@selector(SwRFLeftButtonTapFRwS) forControlEvents:UIControlEventTouchUpInside];
        _hhGXLeftButtonXGhh.frame = CGRectMake(5, self.bounds.size.height / 2 - 10, 20, 20);
    }
    return _hhGXLeftButtonXGhh;
}

- (UIButton *)iCwKRightButtonKwCi {
    if (!_iCwKRightButtonKwCi) {
        _iCwKRightButtonKwCi = [UIButton buttonWithType:UIButtonTypeCustom];
        [_iCwKRightButtonKwCi setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@",@"righ",@"t"])] forState:UIControlStateNormal];
        [_iCwKRightButtonKwCi addTarget:self action:@selector(BUxPRightButtonTapPxUB) forControlEvents:UIControlEventTouchUpInside];
        _iCwKRightButtonKwCi.frame = CGRectMake(mjoXDWScreenWidthXojm - 5 - 20, self.bounds.size.height / 2 - 10, 20, 20);
    }
    return _iCwKRightButtonKwCi;
}

- (void)SwRFLeftButtonTapFRwS {
    [_delegate leftButtonPressed];
}

- (void)BUxPRightButtonTapPxUB {
    [_delegate rightButtonPressed];
}

- (void)BYJhTransformToSmallMoodhJYB {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.NIaOLabelSmallOaIN.text = [NSString stringWithFormat:@"%@%@日，%@", self.dicDate[([NSString stringWithFormat:@"%@%@",@"mont",@"h"])], self.dicDate[([NSString stringWithFormat:@"%@%@",@"da",@"y"])], self.dicDate[([NSString stringWithFormat:@"%@%@%@%@",@"w",@"e",@"e",@"k"])]];
    [self.NIaOLabelSmallOaIN sizeToFit];
    CGRect rect = self.NIaOLabelSmallOaIN.frame;
    rect.origin.x = mjoXDWScreenWidthXojm / 2 - rect.size.width / 2;
    rect.origin.y = 54 / 2 - rect.size.height / 2 + 5;
    self.NIaOLabelSmallOaIN.frame = rect;
    [self addSubview:self.NIaOLabelSmallOaIN];
}

- (void)metamorphosePrintedAbnormalMode {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    [self addSubview:self.EmrQLabelMonthQrmE];
    [self addSubview:self.judgeNight];
    [self addSubview:self.jAoVLabelWeekVoAj];
    [self addSubview:self.hhGXLeftButtonXGhh];
    [self addSubview:self.iCwKRightButtonKwCi];
}

@end
