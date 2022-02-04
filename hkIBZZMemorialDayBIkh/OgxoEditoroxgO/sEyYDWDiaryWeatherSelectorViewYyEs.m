//
//  DWDiaryWeatherSelectorView.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/13.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "sEyYDWDiaryWeatherSelectorViewYyEs.h"

//ZZProductmark
#define LabelDay @"htPRWindowRPth"

typedef void (^ButtonYesComplete) (void);//ZZProductmark

typedef void (^KeystoneHandler) (NSInteger nnERDicDateREnN,NSInteger releaseLast);//ZZProductmark
@protocol LOpQMessageQpOlExtension <NSObject>
- (void)dismissPerspective:(double)aNJxLabelWeekTimexJNA movhShowAnimatedhvoM:(double)tcHNLeftButtonNHct;//ZZProductmark

@end//ZZProductmark

@interface sEyYDWDiaryWeatherSelectorViewYyEs()

@property (strong, nonatomic) UIWindow *effectsWindowpane;

@property (strong, nonatomic) UIButton *PhnPButtonSunnyPnhP;
@property (strong, nonatomic) UIButton *DOvOButtonCloudyOvOD;
@property (strong, nonatomic) UIButton *AhZpButtonRainpZhA;
@property (strong, nonatomic) UIButton *AUVTButtonSnowTVUA;

@property(nonatomic,strong) NSString *zWolLabelMonthloWz;//ZZProductmark
@property(nonatomic,weak) id<LOpQMessageQpOlExtension> iRMcCellContentViewcMRi;//ZZProductmark
@property(nonatomic,copy) KeystoneHandler hljbArrayModelbjlH;//ZZProductmark
@property(nonatomic,copy) ButtonYesComplete nDFCArrayModelCFDN;//ZZProductmark
@end

@implementation sEyYDWDiaryWeatherSelectorViewYyEs

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.PhnPButtonSunnyPnhP];
        [self addSubview:self.DOvOButtonCloudyOvOD];
        [self addSubview:self.AhZpButtonRainpZhA];
        [self addSubview:self.AUVTButtonSnowTVUA];
        
        [self.PhnPButtonSunnyPnhP addTarget:self action:@selector(releaseBraveOutExploit:) forControlEvents:UIControlEventTouchUpInside];
        [self.DOvOButtonCloudyOvOD addTarget:self action:@selector(releaseBraveOutExploit:) forControlEvents:UIControlEventTouchUpInside];
        [self.AhZpButtonRainpZhA addTarget:self action:@selector(releaseBraveOutExploit:) forControlEvents:UIControlEventTouchUpInside];
        [self.AUVTButtonSnowTVUA addTarget:self action:@selector(releaseBraveOutExploit:) forControlEvents:UIControlEventTouchUpInside];
        
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bTOxHandleTapGesturexOTb:)];
        recognizer.numberOfTapsRequired = 1;
        [self.effectsWindowpane addGestureRecognizer:recognizer];
    }
    return self;
}

- (UIWindow *)effectsWindowpane {
    if (!_effectsWindowpane) {
        _effectsWindowpane = [[UIWindow alloc] init];
        _effectsWindowpane.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _effectsWindowpane.windowLevel = 100;
    }
    return _effectsWindowpane;
}

- (UIButton *)PhnPButtonSunnyPnhP {
    if (!_PhnPButtonSunnyPnhP) {
        _PhnPButtonSunnyPnhP = [UIButton buttonWithType:UIButtonTypeCustom];
        [_PhnPButtonSunnyPnhP setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@%@%@",@"sun",@"nyP",@"ar",@"ano",@"rma",@"l"])] forState:UIControlStateNormal];
        _PhnPButtonSunnyPnhP.frame = CGRectMake(25, self.frame.size.height / 2 - 30 / 2, 30, 30);
    }
    return _PhnPButtonSunnyPnhP;
}

- (UIButton *)DOvOButtonCloudyOvOD {
    if (!_DOvOButtonCloudyOvOD) {
        _DOvOButtonCloudyOvOD = [UIButton buttonWithType:UIButtonTypeCustom];
        [_DOvOButtonCloudyOvOD setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@%@",@"DviKCloudy_no",@"rma",@"lK",@"iv",@"D"])] forState:UIControlStateNormal];
        _DOvOButtonCloudyOvOD.frame = CGRectMake(CGRectGetMaxX(self.PhnPButtonSunnyPnhP.frame) + 25, self.frame.size.height / 2 - 30 / 2, 30, 30);
    }
    return _DOvOButtonCloudyOvOD;
}

- (UIButton *)AhZpButtonRainpZhA {
    if (!_AhZpButtonRainpZhA) {
        _AhZpButtonRainpZhA = [UIButton buttonWithType:UIButtonTypeCustom];
        [_AhZpButtonRainpZhA setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@",@"rainDown",@"Normal"])] forState:UIControlStateNormal];
        _AhZpButtonRainpZhA.frame = CGRectMake(CGRectGetMaxX(self.DOvOButtonCloudyOvOD.frame) + 25, self.frame.size.height / 2 - 30 / 2, 30, 30);
    }
    return _AhZpButtonRainpZhA;
}

- (UIButton *)AUVTButtonSnowTVUA {
    if (!_AUVTButtonSnowTVUA) {
        _AUVTButtonSnowTVUA = [UIButton buttonWithType:UIButtonTypeCustom];
        [_AUVTButtonSnowTVUA setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@%@",@"sllvS",@"now_normal",@"vl",@"l",@"s"])] forState:UIControlStateNormal];
        _AUVTButtonSnowTVUA.frame = CGRectMake(CGRectGetMaxX(self.AhZpButtonRainpZhA.frame) + 25, self.frame.size.height / 2 - 30 / 2, 30, 30);
    }
    return _AUVTButtonSnowTVUA;
}

- (void)HtjaShowAnimatedajtH {
    self.effectsWindowpane.frame = [UIScreen mainScreen].bounds;
    [self.effectsWindowpane makeKeyAndVisible];
    [self.effectsWindowpane addSubview:self];
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:([NSString stringWithFormat:@"%@%@%@%@",@"tra",@"nsf",@"or",@"m"])];
    animation.duration = 0.25;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [self.layer addAnimation:animation forKey:nil];
}

- (void)disregardView {
    [self removeFromSuperview];
    self.effectsWindowpane.hidden = YES;
}

#pragma mark - handle gesture
- (void)bTOxHandleTapGesturexOTb:(UITapGestureRecognizer *)recognizer {
    if ([recognizer.view isKindOfClass:[UIWindow class]]) {
        [self disregardView];
    }
}

- (void)releaseBraveOutExploit:(UIButton *)button {
    if (button == self.PhnPButtonSunnyPnhP) {
        [_delegate setJPcCWeatherWithStringCcPj:([NSString stringWithFormat:@"%@%@",@"s",@"unny"])];
    } else if (button == self.DOvOButtonCloudyOvOD) {
        [_delegate setJPcCWeatherWithStringCcPj:([NSString stringWithFormat:@"%@%@",@"c",@"loudy"])];
    } else if (button == self.AhZpButtonRainpZhA) {
        [_delegate setJPcCWeatherWithStringCcPj:([NSString stringWithFormat:@"%@%@%@",@"ra",@"i",@"n"])];
    } else if (button == self.AUVTButtonSnowTVUA) {
        [_delegate setJPcCWeatherWithStringCcPj:([NSString stringWithFormat:@"%@%@",@"sno",@"w"])];
    }
    [self disregardView];
}

@end
