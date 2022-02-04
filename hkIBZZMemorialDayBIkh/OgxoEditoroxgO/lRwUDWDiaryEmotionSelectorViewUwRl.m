//
//  DWDiaryEmotionSelectorView.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/13.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "lRwUDWDiaryEmotionSelectorViewUwRl.h"
static const NSString * RuyWArrayImageViewWyuR = @"labelHebdomad";//ZZProductmark


typedef void (^CurrentIndexPathComplete) (void);//ZZProductmark

typedef void (^ButtonSunnyBlock) (void);//ZZProductmark

@interface lRwUDWDiaryEmotionSelectorViewUwRl()

@property (strong, nonatomic) UIWindow *effectsWindowpane;

@property (strong, nonatomic) UIButton *fqTiButtonHappyiTqf;
@property (strong, nonatomic) UIButton *unbuttonPattern;
@property (strong, nonatomic) UIButton *QYjAButtonSadAjYQ;

@property(nonatomic,strong) NSString *alphaWindowpane;//ZZProductmark

@property(nonatomic,copy) ButtonSunnyBlock chBYIsEmptyYBhC;//ZZProductmark

@property(nonatomic,copy) CurrentIndexPathComplete zKjNButtonSettingNjKz;//ZZProductmark

@end

@implementation lRwUDWDiaryEmotionSelectorViewUwRl

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.fqTiButtonHappyiTqf];
        [self addSubview:self.unbuttonPattern];
        [self addSubview:self.QYjAButtonSadAjYQ];
        
        [self.fqTiButtonHappyiTqf addTarget:self action:@selector(zybgButtonEmotionTapgbyz:) forControlEvents:UIControlEventTouchUpInside];
        [self.unbuttonPattern addTarget:self action:@selector(zybgButtonEmotionTapgbyz:) forControlEvents:UIControlEventTouchUpInside];
        [self.QYjAButtonSadAjYQ addTarget:self action:@selector(zybgButtonEmotionTapgbyz:) forControlEvents:UIControlEventTouchUpInside];
        
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

- (UIButton *)fqTiButtonHappyiTqf {
    if (!_fqTiButtonHappyiTqf) {
        _fqTiButtonHappyiTqf = [UIButton buttonWithType:UIButtonTypeCustom];
        [_fqTiButtonHappyiTqf setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@",@"wellChosenP",@"atter",@"n"])] forState:UIControlStateNormal];
        _fqTiButtonHappyiTqf.frame = CGRectMake(25, self.frame.size.height / 2 - 30 / 2, 30, 30);
    }
    return _fqTiButtonHappyiTqf;
}

- (UIButton *)unbuttonPattern {
    if (!_unbuttonPattern) {
        _unbuttonPattern = [UIButton buttonWithType:UIButtonTypeCustom];
        [_unbuttonPattern setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@",@"NL",@"hb",@"No",@"rmal",@"_no",@"rm",@"alb",@"h",@"L",@"N"])] forState:UIControlStateNormal];
        _unbuttonPattern.frame = CGRectMake(CGRectGetMaxX(self.fqTiButtonHappyiTqf.frame) + 25, self.frame.size.height / 2 - 30 / 2, 30, 30);
    }
    return _unbuttonPattern;
}

- (UIButton *)QYjAButtonSadAjYQ {
    if (!_QYjAButtonSadAjYQ) {
        _QYjAButtonSadAjYQ = [UIButton buttonWithType:UIButtonTypeCustom];
        [_QYjAButtonSadAjYQ setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@%@",@"lamen",@"t",@"ableAbnorm",@"a",@"l"])] forState:UIControlStateNormal];
        _QYjAButtonSadAjYQ.frame = CGRectMake(CGRectGetMaxX(self.unbuttonPattern.frame) + 25, self.frame.size.height / 2 - 30 / 2, 30, 30);
    }
    return _QYjAButtonSadAjYQ;
}

- (void)HtjaShowAnimatedajtH {
    self.effectsWindowpane.frame = [UIScreen mainScreen].bounds;
    [self.effectsWindowpane makeKeyAndVisible];
    [self.effectsWindowpane addSubview:self];
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:([NSString stringWithFormat:@"%@%@",@"transfo",@"rm"])];
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

- (void)zybgButtonEmotionTapgbyz:(UIButton *)button {
    if (button == self.fqTiButtonHappyiTqf) {
        [_delegate setPersonAnotherStrand:([NSString stringWithFormat:@"%@%@%@",@"ha",@"pp",@"y"])];
    } else if (button == self.unbuttonPattern) {
        [_delegate setPersonAnotherStrand:([NSString stringWithFormat:@"%@%@%@",@"norm",@"a",@"l"])];
    } else if (button == self.QYjAButtonSadAjYQ) {
        [_delegate setPersonAnotherStrand:([NSString stringWithFormat:@"%@%@",@"sa",@"d"])];
    }
    [self disregardView];
}

@end
