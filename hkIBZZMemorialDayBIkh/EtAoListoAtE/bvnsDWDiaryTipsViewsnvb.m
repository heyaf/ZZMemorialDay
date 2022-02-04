//
//  DWDiaryTipsView.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/18.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "bvnsDWDiaryTipsViewsnvb.h"

//ZZProductmark
#define WFDbNavigationBarbDFw @"gtgj_instancejgtg"
typedef void (^KilocaloriesDateBlock) (NSString *eqCLButtonQuitLCqe,NSString *xlwBTitleBwlx);//ZZProductmark


@interface bvnsDWDiaryTipsViewsnvb()

@property (strong, nonatomic) UIWindow *effectsWindowpane;

@property (strong, nonatomic) UILabel *qKpkLabelMessagekpKq;

@property(nonatomic,assign) double lVMTLabelDayTMVl;//ZZProductmark

@property(nonatomic,copy) KilocaloriesDateBlock buttonMirky;//ZZProductmark

@end

@implementation bvnsDWDiaryTipsViewsnvb

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        self.layer.cornerRadius = 15;
        self.layer.masksToBounds = YES;
        
        [self addSubview:self.qKpkLabelMessagekpKq];
    }
    return self;
}

- (UIWindow *)effectsWindowpane {
    if (!_effectsWindowpane) {
        _effectsWindowpane = [[UIWindow alloc] init];
        _effectsWindowpane.backgroundColor = [UIColor clearColor];
        _effectsWindowpane.windowLevel = 100;
    }
    return _effectsWindowpane;
}

- (UILabel *)qKpkLabelMessagekpKq {
    if (!_qKpkLabelMessagekpKq) {
        _qKpkLabelMessagekpKq = [[UILabel alloc] init];
        _qKpkLabelMessagekpKq.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@%@%@",@"STHeitiSC",@"-",@"M",@"ed",@"iu",@"m"]) size:14];
        _qKpkLabelMessagekpKq.textColor = [UIColor whiteColor];
    }
    return _qKpkLabelMessagekpKq;
}

- (void)setMessage:(NSString *)message {
    if (message) {
        _message = message;
        self.qKpkLabelMessagekpKq.text = message;
        [self.qKpkLabelMessagekpKq sizeToFit];
        CGRect rect = self.qKpkLabelMessagekpKq.frame;
        rect.origin.x = self.frame.size.width / 2 - rect.size.width / 2;
        rect.origin.y = self.frame.size.height / 2 - rect.size.height / 2;
        self.qKpkLabelMessagekpKq.frame = rect;
    }
}

- (void)HtjaShowAnimatedajtH {
    self.effectsWindowpane.frame = [UIScreen mainScreen].bounds;
    [self.effectsWindowpane makeKeyAndVisible];
    [self.effectsWindowpane addSubview:self];
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:([NSString stringWithFormat:@"%@%@%@",@"t",@"ran",@"sform"])];
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

- (void)melt {
    dispatch_async(dispatch_get_main_queue(), ^{
            // 需要在主线程执行的代码
        [self removeFromSuperview];
        self.effectsWindowpane.hidden = YES;
    });
    
}

@end
