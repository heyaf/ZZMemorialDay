//
//  DWDiaryContentView.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/13.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "UlSsDWDiaryContentViewsSlU.h"
#import "lWThDWDiaryAlertViewhTWl.h"
#import "whHIPrefixHeaderIHhw.pch"

//ZZProductmark
#define NQZPCurrentIndexPZQn @"tGfhButtonLasthfGT"


typedef void (^ThyroxinFTitleHandler) (NSString *pEzlCheckerlzEP,NSString *obfTManagedObjectContextTfbo);//ZZProductmark

@protocol HrlQLabelDayQlrHInterface <NSObject>
- (void)bNFmCompletionmFNB;//ZZProductmark

@end//ZZProductmark

@interface UlSsDWDiaryContentViewsSlU() <ZZDayAlarumDelegate>

@property (strong, nonatomic) UIWindow *effectsWindowpane;

@property (strong, nonatomic) UIView *OkllDateViewllkO;
@property (strong, nonatomic) UILabel *ZZwkLabelYearMonthkwZZ;
@property (strong, nonatomic) UILabel *judgeNight;
@property (strong, nonatomic) UILabel *xrAqLabelWeekTimeqArx;
@property (strong, nonatomic) UIButton *RhAcButtonQuitcAhR;

@property (strong, nonatomic) UITextView *tonneVPoint;

@property (strong, nonatomic) UIView *peckerMeasure;
@property (strong, nonatomic) UIButton *YONWButtonLastWNOY;
@property (strong, nonatomic) UIButton *TcqSButtonNextSqcT;
@property (strong, nonatomic) UIButton *buttonPercentage;
@property (strong, nonatomic) UIButton *gOwfButtonEditfwOg;
@property (strong, nonatomic) UIButton *euyzButtonDeletezyue;

@property (strong, nonatomic) lWThDWDiaryAlertViewhTWl *alertView;

@property(nonatomic,strong) NSString *routesWindow;//ZZProductmark
@property(nonatomic,weak) id<HrlQLabelDayQlrHInterface> vjhrNavigationBarrhjV;//ZZProductmark

@property(nonatomic,copy) ThyroxinFTitleHandler tzfMDelegateMfzt;//ZZProductmark

@end

@implementation UlSsDWDiaryContentViewsSlU

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 15;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.OkllDateViewllkO];
        [self addSubview:self.tonneVPoint];
        [self addSubview:self.peckerMeasure];
        
        [self.RhAcButtonQuitcAhR addTarget:self action:@selector(CzRtButtonQuitTaptRzC) forControlEvents:UIControlEventTouchUpInside];
        [self.YONWButtonLastWNOY addTarget:self action:@selector(buttonFinishKnock) forControlEvents:UIControlEventTouchUpInside];
        [self.TcqSButtonNextSqcT addTarget:self action:@selector(releaseFutureDab) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonPercentage addTarget:self action:@selector(unbuttonPartakeTap) forControlEvents:UIControlEventTouchUpInside];
        [self.gOwfButtonEditfwOg addTarget:self action:@selector(releaseDeleteTip) forControlEvents:UIControlEventTouchUpInside];
        [self.euyzButtonDeletezyue addTarget:self action:@selector(dKISButtonDeleteTapSIKd) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setDicDate:(NSDictionary *)dicDate {
    if (dicDate) {
        _dicDate = dicDate;
        
        CGRect rect;
        
        self.ZZwkLabelYearMonthkwZZ.text = [NSString stringWithFormat:@"%@，%@", dicDate[([NSString stringWithFormat:@"%@%@",@"yea",@"r"])], dicDate[([NSString stringWithFormat:@"%@%@",@"mont",@"h"])]];
        [self.ZZwkLabelYearMonthkwZZ sizeToFit];
        rect = self.ZZwkLabelYearMonthkwZZ.frame;
        rect.origin.x = self.OkllDateViewllkO.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = ZZDateStampPronounceWye;
        self.ZZwkLabelYearMonthkwZZ.frame = rect;
        
        self.judgeNight.text = dicDate[([NSString stringWithFormat:@"%@%@%@",@"d",@"a",@"y"])];
        [self.judgeNight sizeToFit];
        rect = self.judgeNight.frame;
        rect.origin.x = self.OkllDateViewllkO.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = CGRectGetMaxY(self.ZZwkLabelYearMonthkwZZ.frame);
        self.judgeNight.frame = rect;
        
        self.xrAqLabelWeekTimeqArx.text = [NSString stringWithFormat:@"%@ %@", dicDate[([NSString stringWithFormat:@"%@%@%@",@"we",@"e",@"k"])], dicDate[([NSString stringWithFormat:@"%@%@",@"t",@"ime"])]];
        [self.xrAqLabelWeekTimeqArx sizeToFit];
        rect = self.xrAqLabelWeekTimeqArx.frame;
        rect.origin.x = self.OkllDateViewllkO.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = CGRectGetMaxY(self.judgeNight.frame);
        self.xrAqLabelWeekTimeqArx.frame = rect;
    }
}

- (void)setDetail:(NSString *)detail {
    if (detail) {
        _detail = detail;
        self.tonneVPoint.text = detail;
    }
}

- (UIWindow *)effectsWindowpane {
    if (!_effectsWindowpane) {
        _effectsWindowpane = [[UIWindow alloc] init];
        _effectsWindowpane.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _effectsWindowpane.windowLevel = 100;
    }
    return _effectsWindowpane;
}

- (UIView *)OkllDateViewllkO {
    if (!_OkllDateViewllkO) {
        _OkllDateViewllkO = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, ZZAppointmentOpinionTop)];
        _OkllDateViewllkO.backgroundColor = byMUDWDiaryThemeBlueColorUMyb;
        
        [_OkllDateViewllkO addSubview:self.ZZwkLabelYearMonthkwZZ];
        [_OkllDateViewllkO addSubview:self.judgeNight];
        [_OkllDateViewllkO addSubview:self.xrAqLabelWeekTimeqArx];
        [_OkllDateViewllkO addSubview:self.RhAcButtonQuitcAhR];
    }
    return _OkllDateViewllkO;
}

- (UILabel *)ZZwkLabelYearMonthkwZZ {
    if (!_ZZwkLabelYearMonthkwZZ) {
        _ZZwkLabelYearMonthkwZZ = [[UILabel alloc] init];
        _ZZwkLabelYearMonthkwZZ.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@",@"STHeitiSC-",@"L",@"igh",@"t"]) size:15];
        _ZZwkLabelYearMonthkwZZ.textColor = [UIColor whiteColor];
    }
    return _ZZwkLabelYearMonthkwZZ;
}

- (UILabel *)judgeNight {
    if (!_judgeNight) {
        _judgeNight = [[UILabel alloc] init];
        _judgeNight.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@%@",@"STH",@"eitiT",@"C-L",@"igh",@"t"]) size:60];
        _judgeNight.textColor = [UIColor whiteColor];
    }
    return _judgeNight;
}

- (UILabel *)xrAqLabelWeekTimeqArx {
    if (!_xrAqLabelWeekTimeqArx) {
        _xrAqLabelWeekTimeqArx = [[UILabel alloc] init];
        _xrAqLabelWeekTimeqArx.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@",@"STHeitiSC-",@"L",@"igh",@"t"]) size:15];
        _xrAqLabelWeekTimeqArx.textColor = [UIColor whiteColor];
    }
    return _xrAqLabelWeekTimeqArx;
}

-(UIButton *)RhAcButtonQuitcAhR {
    if (!_RhAcButtonQuitcAhR) {
        _RhAcButtonQuitcAhR = [UIButton buttonWithType:UIButtonTypeCustom];
        [_RhAcButtonQuitcAhR setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@",@"de",@"velop",@"e",@"r"])] forState:UIControlStateNormal];
        _RhAcButtonQuitcAhR.frame = CGRectMake(self.OkllDateViewllkO.frame.size.width - 20 - 18, 20, 18, 18);
    }
    return _RhAcButtonQuitcAhR;
}

- (UITextView *)tonneVPoint {
    if (!_tonneVPoint) {
        _tonneVPoint = [[UITextView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.OkllDateViewllkO.frame), self.frame.size.width - 20, uLUkDWDetailTextViewHeightkULu)];
        _tonneVPoint.textColor = byMUDWDiaryThemeBlueColorUMyb;
        _tonneVPoint.font = [UIFont systemFontOfSize:17];
        _tonneVPoint.editable = NO;
    }
    return _tonneVPoint;
}

- (UIView *)peckerMeasure {
    if (!_peckerMeasure) {
        _peckerMeasure = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tonneVPoint.frame), self.frame.size.width, self.frame.size.height - ZZAppointmentOpinionTop - uLUkDWDetailTextViewHeightkULu)];
        _peckerMeasure.backgroundColor = byMUDWDiaryThemeBlueColorUMyb;
        
        [_peckerMeasure addSubview:self.YONWButtonLastWNOY];
        [_peckerMeasure addSubview:self.TcqSButtonNextSqcT];
//        [_toolBar addSubview:self.buttonShare];
        [_peckerMeasure addSubview:self.gOwfButtonEditfwOg];
        [_peckerMeasure addSubview:self.euyzButtonDeletezyue];
    }
    return _peckerMeasure;
}

- (UIButton *)YONWButtonLastWNOY {
    if (!_YONWButtonLastWNOY) {
        _YONWButtonLastWNOY = [UIButton buttonWithType:UIButtonTypeCustom];
        [_YONWButtonLastWNOY setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@%@",@"zVD",@"LLa",@"s",@"tLDV",@"z"])] forState:UIControlStateNormal];
        _YONWButtonLastWNOY.frame = CGRectMake(10, self.peckerMeasure.frame.size.height / 2 - 25 / 2, 25, 25);
    }
    return _YONWButtonLastWNOY;
}

- (UIButton *)TcqSButtonNextSqcT {
    if (!_TcqSButtonNextSqcT) {
        _TcqSButtonNextSqcT = [UIButton buttonWithType:UIButtonTypeCustom];
        [_TcqSButtonNextSqcT setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@",@"PPmAFutureAmP",@"P"])] forState:UIControlStateNormal];
        _TcqSButtonNextSqcT.frame = CGRectMake(CGRectGetMaxX(self.YONWButtonLastWNOY.frame) + 10, self.peckerMeasure.frame.size.height / 2 - 25 / 2, 25, 25);
    }
    return _TcqSButtonNextSqcT;
}

- (UIButton *)buttonPercentage {
    if (!_buttonPercentage) {
        _buttonPercentage = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonPercentage setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@",@"sha",@"r",@"e"])] forState:UIControlStateNormal];
        _buttonPercentage.frame = CGRectMake(self.gOwfButtonEditfwOg.frame.origin.x - 10 - 25, self.peckerMeasure.frame.size.height / 2 - 25 / 2, 25, 25);
    }
    return _buttonPercentage;
}

- (UIButton *)gOwfButtonEditfwOg {
    if (!_gOwfButtonEditfwOg) {
        _gOwfButtonEditfwOg = [UIButton buttonWithType:UIButtonTypeCustom];
        [_gOwfButtonEditfwOg setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@",@"AAZY",@"EditYZA",@"A"])] forState:UIControlStateNormal];
        _gOwfButtonEditfwOg.frame = CGRectMake(self.euyzButtonDeletezyue.frame.origin.x - 10 - 25, self.peckerMeasure.frame.size.height / 2 - 25 / 2, 25, 25);
    }
    return _gOwfButtonEditfwOg;
}

- (UIButton *)euyzButtonDeletezyue {
    if (!_euyzButtonDeletezyue) {
        _euyzButtonDeletezyue = [UIButton buttonWithType:UIButtonTypeCustom];
        [_euyzButtonDeletezyue setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@",@"del",@"e",@"t",@"e"])] forState:UIControlStateNormal];
        _euyzButtonDeletezyue.frame = CGRectMake(self.peckerMeasure.frame.size.width - 10 - 25, self.peckerMeasure.frame.size.height / 2 - 25 / 2, 25, 25);
    }
    return _euyzButtonDeletezyue;
}

- (lWThDWDiaryAlertViewhTWl *)alertView {
    if (!_alertView) {
        _alertView = [[lWThDWDiaryAlertViewhTWl alloc] initWithFrame:CGRectMake(mjoXDWScreenWidthXojm / 2 - pTncDWDiaryAlertViewWidthcnTp / 2, RHhQDWScreenHeightQhHR / 2 - zcmGDWDiaryAlertViewHeightGmcz / 2, pTncDWDiaryAlertViewWidthcnTp, zcmGDWDiaryAlertViewHeightGmcz)];
        _alertView.title = ([NSString stringWithFormat:@"%@%@%@",@"确定要删除这篇日",@"记",@"吗？"]);
        _alertView.message = ([NSString stringWithFormat:@"%@%@%@%@%@",@"此操",@"作不",@"可逆。请",@"三思",@"。"]);
        _alertView.delegate = self;
    }
    return _alertView;
}

#pragma mark - handle tap gesture
- (void)CzRtButtonQuitTaptRzC {
    [self disappearLensBottomlandDeaden];
}

- (void)buttonFinishKnock {
    [_delegate updateContentViewWithOffset:-1];
}

- (void)releaseFutureDab {
    [_delegate updateContentViewWithOffset:1];
}

- (void)unbuttonPartakeTap {
    
}

- (void)releaseDeleteTip {
    [self CzRtButtonQuitTaptRzC];
    [_delegate openTypingViewWithDicDate:self.dicDate];
}

- (void)dKISButtonDeleteTapSIKd {
    [self.alertView HtjaShowAnimatedajtH];
}

#pragma mark - implementaion
- (void)HtjaShowAnimatedajtH {
    self.effectsWindowpane.frame = [UIScreen mainScreen].bounds;
    [self.effectsWindowpane makeKeyAndVisible];
    [self.effectsWindowpane addSubview:self];
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:([NSString stringWithFormat:@"%@%@",@"t",@"ransform"])];
    animation.duration = 0.25;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [self.layer addAnimation:animation forKey:nil];
}

- (void)disappearLensBottomlandDeaden {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = self.frame;
        self.frame = CGRectMake(rect.origin.x, rect.origin.y + 642, rect.size.width, rect.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.effectsWindowpane.hidden = YES;
    }];
}

- (void)yRZYDisappearFromTopAnimatedYZRy {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = self.frame;
        self.frame = CGRectMake(rect.origin.x, rect.origin.y - 652, rect.size.width, rect.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.effectsWindowpane.hidden = YES;
    }];
}

#pragma mark - DWDiaryAlertDelegate
- (void)pushYesWeigh {
    [self yRZYDisappearFromTopAnimatedYZRy];
    [_delegate deleteDiaryWithDicDate:self.dicDate];
}

- (void)ApCiButtonNoPressediCpA {
}

@end
