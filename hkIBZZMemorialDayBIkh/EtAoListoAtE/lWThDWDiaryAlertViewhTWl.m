//
//  DWDiaryAlertView.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/18.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "lWThDWDiaryAlertViewhTWl.h"
#import "whHIPrefixHeaderIHhw.pch"
static const NSString * XNJaScrollViewaJNx = @"gthNCurrentIndexNhtg";//ZZProductmark


typedef void (^CwLhWeatherhLwCCallback) (BOOL noncurrentPowerPath,NSString *yEjRLabelDayRjEY);//ZZProductmark


typedef void (^PHbgControllerModegbHPHandler) (NSString *feDPIsSettingModePDef,NSString *trimmedDate);//ZZProductmark

@protocol ButtonGladExtension <NSObject>
- (NSInteger)yAPHShowAnimatedHPAy;//ZZProductmark

@end//ZZProductmark

@interface lWThDWDiaryAlertViewhTWl()

@property (strong, nonatomic) UIWindow *effectsWindowpane;

@property (strong, nonatomic) UILabel *pronounceRubric;
@property (strong, nonatomic) UILabel *qKpkLabelMessagekpKq;

@property (strong, nonatomic) UIButton *qwhlButtonYeslhwq;
@property (strong, nonatomic) UIButton *uiWmButtonNomWiu;

@property(nonatomic,strong) NSString *wWsUMessageUsWw;//ZZProductmark

@property(nonatomic,weak) id<ButtonGladExtension> yXhbToolBarbhXy;//ZZProductmark
@property(nonatomic,copy) PHbgControllerModegbHPHandler emotion;//ZZProductmark

@property(nonatomic,copy) CwLhWeatherhLwCCallback znxbCurrentIndexbxnz;//ZZProductmark

@end

@implementation lWThDWDiaryAlertViewhTWl

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = byMUDWDiaryThemeBlueColorUMyb;
        
        self.layer.cornerRadius = 15;
        self.layer.masksToBounds = YES;
        
        [self.qwhlButtonYeslhwq addTarget:self action:@selector(AqzzButtonYesTapzzqA) forControlEvents:UIControlEventTouchUpInside];
        [self.uiWmButtonNomWiu addTarget:self action:@selector(RMMVButtonNoTapVMMR) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.pronounceRubric];
        [self addSubview:self.qKpkLabelMessagekpKq];
        [self addSubview:self.qwhlButtonYeslhwq];
        [self addSubview:self.uiWmButtonNomWiu];
    }
    return self;
}

- (UIWindow *)effectsWindowpane {
    if (!_effectsWindowpane) {
        _effectsWindowpane = [[UIWindow alloc] init];
        _effectsWindowpane.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _effectsWindowpane.windowLevel = 101;
    }
    return _effectsWindowpane;
}

- (UILabel *)pronounceRubric {
    if (!_pronounceRubric) {
        _pronounceRubric = [[UILabel alloc] init];
        _pronounceRubric.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@",@"STHeitiSC-Medi",@"u",@"m"]) size:18];
        _pronounceRubric.textColor = [UIColor whiteColor];
    }
    return _pronounceRubric;
}

- (UILabel *)qKpkLabelMessagekpKq {
    if (!_qKpkLabelMessagekpKq) {
        _qKpkLabelMessagekpKq = [[UILabel alloc] init];
        _qKpkLabelMessagekpKq.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@%@",@"STHeitiSC-L",@"i",@"g",@"h",@"t"]) size:12];
        _qKpkLabelMessagekpKq.textColor = [UIColor whiteColor];
    }
    return _qKpkLabelMessagekpKq;
}

- (UIButton *)uiWmButtonNomWiu {
    if (!_uiWmButtonNomWiu) {
        _uiWmButtonNomWiu = [UIButton buttonWithType:UIButtonTypeCustom];
        [_uiWmButtonNomWiu setImage:[UIImage imageNamed:@"no"] forState:UIControlStateNormal];
        _uiWmButtonNomWiu.frame = CGRectMake(30, self.frame.size.height - 15 - 28, 28, 28);
    }
    return _uiWmButtonNomWiu;
}

- (UIButton *)qwhlButtonYeslhwq {
    if (!_qwhlButtonYeslhwq) {
        _qwhlButtonYeslhwq = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qwhlButtonYeslhwq setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@%@",@"gij",@"tYes",@"tj",@"i",@"g"])] forState:UIControlStateNormal];
        _qwhlButtonYeslhwq.frame = CGRectMake(self.frame.size.width - 28 - 30, self.uiWmButtonNomWiu.frame.origin.y - 5, 35, 35);
    }
    return _qwhlButtonYeslhwq;
}

- (void)setTitle:(NSString *)title {
    if (title) {
        _title = title;
        self.pronounceRubric.text = title;
        [self.pronounceRubric sizeToFit];
        CGRect rect = self.pronounceRubric.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = 10;
        self.pronounceRubric.frame = rect;
    }
}

- (void)setMessage:(NSString *)message {
    if (message) {
        _message = message;
        self.qKpkLabelMessagekpKq.text = message;
        [self.qKpkLabelMessagekpKq sizeToFit];
        CGRect rect = self.qKpkLabelMessagekpKq.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = CGRectGetMaxY(self.pronounceRubric.frame) + 10;
        self.qKpkLabelMessagekpKq.frame = rect;
    }
}

- (void)HtjaShowAnimatedajtH {
    self.effectsWindowpane.frame = [UIScreen mainScreen].bounds;
    [self.effectsWindowpane makeKeyAndVisible];
    [self.effectsWindowpane addSubview:self];
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:([NSString stringWithFormat:@"%@%@%@%@%@",@"tr",@"a",@"nsf",@"or",@"m"])];
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

#pragma mark - handle tap gesture
- (void)AqzzButtonYesTapzzqA {
    [_delegate pushYesWeigh];
    [self removeFromSuperview];
    self.effectsWindowpane.hidden = YES;
}

- (void)RMMVButtonNoTapVMMR {
    [_delegate ApCiButtonNoPressediCpA];
    [self removeFromSuperview];
    self.effectsWindowpane.hidden = YES;
}

@end
