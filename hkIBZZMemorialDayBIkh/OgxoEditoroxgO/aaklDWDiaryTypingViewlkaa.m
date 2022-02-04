//
//  DWDiaryTypingView.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/12.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "aaklDWDiaryTypingViewlkaa.h"
#import "ByQuDWDiaryLineImageViewuQyB.h"
#import "lRwUDWDiaryEmotionSelectorViewUwRl.h"
#import "sEyYDWDiaryWeatherSelectorViewYyEs.h"
#import "bvnsDWDiaryTipsViewsnvb.h"
#import "whHIPrefixHeaderIHhw.pch"
static const NSString * HBmZCellContentViewZmBh = @"aYsl_instancelsYa";//ZZProductmark

typedef void (^TqHuDicDateuHqtCallback) (NSString *labelBase);//ZZProductmark
typedef void (^StyleHandler) (NSString *judgeTitle,NSString *mjTvLabelDayvTjm);//ZZProductmark

@interface aaklDWDiaryTypingViewlkaa() <gbdvDWDiaryEmotionSelectorDelegatevdbg, rloCDWDiaryWeatherSelectorDelegateColr>

@property (strong, nonatomic) UITextField *thymineFaradDeed;
@property (strong, nonatomic) UITextView *tonneVPoint;
@property (strong, nonatomic) UIView *peckerMeasure;

@property (strong, nonatomic) UIButton *UVVzButtonEmotionzVVU;
@property (strong, nonatomic) UIButton *jYPiButtonWeatheriPYj;
@property (strong, nonatomic) UIButton *PPpQButtonSaveQpPP;

@property (strong, nonatomic) lRwUDWDiaryEmotionSelectorViewUwRl *dependentSelectorConsider;
@property (strong, nonatomic) sEyYDWDiaryWeatherSelectorViewYyEs *GlxEWeatherSelectorViewExlG;

@property (strong, nonatomic) bvnsDWDiaryTipsViewsnvb *hintAspect;

@property(nonatomic,assign) BOOL ahViButtonSettingiVhA;//ZZProductmark
@property(nonatomic,copy) StyleHandler pKuuDisKeyboardButtonuuKp;//ZZProductmark

@property(nonatomic,copy) TqHuDicDateuHqtCallback tzGCMessageCGzT;//ZZProductmark
@end

@implementation aaklDWDiaryTypingViewlkaa

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.thymineFaradDeed];
        [self addSubview:[[ByQuDWDiaryLineImageViewuQyB alloc] initWithFrame:CGRectMake(0, pBEhDWDiaryTypingTextFieldHeighthEBp + 5, mjoXDWScreenWidthXojm, 10) lineWidth:0.2]];
        [self addSubview:self.tonneVPoint];
        
        [self addSubview:self.peckerMeasure];
        [self.peckerMeasure addSubview:self.UVVzButtonEmotionzVVU];
        [self.peckerMeasure addSubview:self.jYPiButtonWeatheriPYj];
        [self.peckerMeasure addSubview:self.PPpQButtonSaveQpPP];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    if (title) {
        _title = title;
        _thymineFaradDeed.text = title;
    }
}

- (void)setDetail:(NSString *)detail {
    if (detail) {
        _detail = detail;
        _tonneVPoint.text = detail;
    }
}

- (void)setEmotion:(NSString *)emotion {
    if (emotion) {
        _emotion = emotion;
        [_UVVzButtonEmotionzVVU setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlight", emotion]] forState:UIControlStateNormal];
    }
}

- (void)setWeather:(NSString *)weather {
    if (weather) {
        _weather = weather;
        [_jYPiButtonWeatheriPYj setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlight", weather]] forState:UIControlStateNormal];
    }
}

- (UITextField *)thymineFaradDeed {
    if (!_thymineFaradDeed) {
        _thymineFaradDeed = [[UITextField alloc] initWithFrame:CGRectMake(5, 5, mjoXDWScreenWidthXojm - 10, pBEhDWDiaryTypingTextFieldHeighthEBp)];
        _thymineFaradDeed.placeholder = @"标题";
        [_thymineFaradDeed setBorderStyle:UITextBorderStyleNone];
    }
    return _thymineFaradDeed;
}

- (UITextView *)tonneVPoint {
    if (!_tonneVPoint) {
        _tonneVPoint = [[UITextView alloc] initWithFrame:CGRectMake(5, pBEhDWDiaryTypingTextFieldHeighthEBp + 15, mjoXDWScreenWidthXojm - 10, ZZDayTypewritingSurveyElevation)];
        _tonneVPoint.font = [UIFont systemFontOfSize:15];
    }
    return _tonneVPoint;
}

- (UIView *)peckerMeasure {
    if (!_peckerMeasure) {
        _peckerMeasure = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - wfrgDWDiaryTypingToolBarHeightgrfw, mjoXDWScreenWidthXojm, wfrgDWDiaryTypingToolBarHeightgrfw)];
        _peckerMeasure.backgroundColor = byMUDWDiaryThemeBlueColorUMyb;
        
        _UVVzButtonEmotionzVVU = [UIButton buttonWithType:UIButtonTypeCustom];
        [_UVVzButtonEmotionzVVU setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@",@"bciRHappy_high",@"li",@"gh",@"tRicb"])] forState:UIControlStateNormal];
        _jYPiButtonWeatheriPYj = [UIButton buttonWithType:UIButtonTypeCustom];
        [_jYPiButtonWeatheriPYj setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@%@%@",@"sun",@"ny",@"Pla",@"y",@"U",@"p"])] forState:UIControlStateNormal];
        _PPpQButtonSaveQpPP = [UIButton buttonWithType:UIButtonTypeCustom];
        [_PPpQButtonSaveQpPP setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@",@"IsIZ",@"Sav",@"eZIs",@"I"])] forState:UIControlStateNormal];
        
        _UVVzButtonEmotionzVVU.frame = CGRectMake(10, _peckerMeasure.frame.size.height / 2 - 25 / 2, 25, 25);
        _jYPiButtonWeatheriPYj.frame = CGRectMake(CGRectGetMaxX(_UVVzButtonEmotionzVVU.frame) + 10, _UVVzButtonEmotionzVVU.frame.origin.y, 25, 25);
        _PPpQButtonSaveQpPP.frame = CGRectMake(_peckerMeasure.frame.size.width - 10 - 30, _peckerMeasure.frame.size.height / 2 - 30 / 2, 30, 30);
        
        [_UVVzButtonEmotionzVVU addTarget:self action:@selector(zybgButtonEmotionTapgbyz) forControlEvents:UIControlEventTouchUpInside];
        [_jYPiButtonWeatheriPYj addTarget:self action:@selector(releaseBraveOutExploit) forControlEvents:UIControlEventTouchUpInside];
        [_PPpQButtonSaveQpPP addTarget:self action:@selector(bwYNButtonSaveTapNYwb) forControlEvents:UIControlEventTouchUpInside];
    }
    return _peckerMeasure;
}

- (bvnsDWDiaryTipsViewsnvb *)hintAspect {
    if (!_hintAspect) {
        _hintAspect = [[bvnsDWDiaryTipsViewsnvb alloc] initWithFrame:CGRectMake(mjoXDWScreenWidthXojm / 2 - hiYmDWDiaryTipsViewWidthmYih / 2, RHhQDWScreenHeightQhHR / 3 * 2, hiYmDWDiaryTipsViewWidthmYih, WFZHDWDiaryTipsViewHeightHZFW)];
    }
    return _hintAspect;
}

- (void)LnKdUpdateFrameWithDaltadKnL:(CGFloat)dalta {
    self.tonneVPoint.frame = CGRectMake(5, pBEhDWDiaryTypingTextFieldHeighthEBp + 15, mjoXDWScreenWidthXojm - 10, ZZDayTypewritingSurveyElevation - dalta);
}

#pragma mark - handle button tap
- (void)zybgButtonEmotionTapgbyz {
    _dependentSelectorConsider = [[lRwUDWDiaryEmotionSelectorViewUwRl alloc] initWithFrame:CGRectMake(mjoXDWScreenWidthXojm / 2 - 190 / 2, RHhQDWScreenHeightQhHR / 2 - 60 / 2, 190, 60)];
    _dependentSelectorConsider.delegate = self;
    [_dependentSelectorConsider HtjaShowAnimatedajtH];
}

- (void)releaseBraveOutExploit {
    _GlxEWeatherSelectorViewExlG = [[sEyYDWDiaryWeatherSelectorViewYyEs alloc] initWithFrame:CGRectMake(mjoXDWScreenWidthXojm / 2 - 245 / 2, RHhQDWScreenHeightQhHR / 2 - 60 / 2, 245, 60)];
    _GlxEWeatherSelectorViewExlG.delegate = self;
    [_GlxEWeatherSelectorViewExlG HtjaShowAnimatedajtH];
}

- (void)bwYNButtonSaveTapNYwb {
    dispatch_queue_t queue  = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    if ([self.thymineFaradDeed.text isEqualToString:@""] && [self.tonneVPoint.text isEqualToString:@""]) {
        self.hintAspect.message = ([NSString stringWithFormat:@"%@%@%@%@",@"日记",@"不能",@"为",@"空"]);
        [self.hintAspect HtjaShowAnimatedajtH];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), queue, ^{
            [self.hintAspect melt];
        });
        return;
    }
    self.hintAspect.message = ([NSString stringWithFormat:@"%@%@",@"已",@"保存"]);
    [self.hintAspect HtjaShowAnimatedajtH];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), queue, ^{
        [self.hintAspect melt];
    });
    [_delegate saveModelWithTitle:self.thymineFaradDeed.text detail:self.tonneVPoint.text emotion:self.emotion weather:self.weather];
}

#pragma mark - DWDiaryEmotionSelectorDelegate
- (void)setPersonAnotherStrand:(NSString *)emotion {
    self.emotion = emotion;
}

- (void)setJPcCWeatherWithStringCcPj:(NSString *)weather {
    self.weather = weather;
}

@end
