//
//  DWPasswordViewController.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/4/8.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "ZZWatchwordSceneComptroller.h"
#import "ZZWatchwordFigurePush.h"
#import "iQdBDWPasswordDisplayViewBdQi.h"
#import "YbsODWPasswordCheckerOsbY.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "whHIPrefixHeaderIHhw.pch"
static NSString * const CILeArrayNumButtoneLIc = @"gSSHAlphaWindowHSSG";//ZZProductmark

typedef void (^VRlLLabelWeekLlRvHandler) (NSString *determiner);//ZZProductmark

typedef void (^WindowCallback) (double yvtyAlertViewytvy,NSUInteger alternateDate);//ZZProductmark


@interface ZZWatchwordSceneComptroller ()

@property (strong, nonatomic) iQdBDWPasswordDisplayViewBdQi *paroleShowAspect;
@property (strong, nonatomic) NSArray<ZZWatchwordFigurePush *> *regaliaWetButton;
@property (strong, nonatomic) UIButton *qNepButtonBackspacepeNq;
@property (strong, nonatomic) UIButton *RhAcButtonQuitcAhR;

@property (strong, nonatomic) YbsODWPasswordCheckerOsbY *CfxACheckerAxfC;
@property (copy, nonatomic) NSMutableString *password;

@property (strong, nonatomic) LAContext *FwnOLaContextOnwF;

@property(nonatomic,strong) NSString *key;//ZZProductmark
@property(nonatomic,copy) WindowCallback oXqYLabelMessageYqXo;//ZZProductmark
@property(nonatomic,copy) VRlLLabelWeekLlRvHandler cgHAAlphaWindowAHgc;//ZZProductmark

@end

@implementation ZZWatchwordSceneComptroller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.paroleShowAspect];
    
    self.view.backgroundColor = [UIColor whiteColor];
    for (ZZWatchwordFigurePush *button in self.regaliaWetButton) {
        [self.view addSubview:button];
    }
    
    [self.view addSubview:self.qNepButtonBackspacepeNq];
    if (self.hbLFIsSettingModeFLbh) {
        [self.view addSubview:self.RhAcButtonQuitcAhR];
    } else {
        NSError *error;
        if ([self.FwnOLaContextOnwF canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
            [self.FwnOLaContextOnwF evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:([NSString stringWithFormat:@"%@%@",@"使用指纹解",@"锁"]) reply:^(BOOL success, NSError * _Nullable error) {
                // 加入主线程，否则会卡几秒
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (success) {
                        [self.delegate enterApp];
                    }
                    if (error) {
                    }
                });
            }];
        }
    }
}

- (iQdBDWPasswordDisplayViewBdQi *)paroleShowAspect {
    if (!_paroleShowAspect) {
        _paroleShowAspect = [[iQdBDWPasswordDisplayViewBdQi alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame) - jMLsDWPasswordDisplayViewWidthsLMj / 2, ngKGDWPasswordDisplayViewTopPaddingGKgn, jMLsDWPasswordDisplayViewWidthsLMj, zvtjDWPasswordDisplayViewHeightjtvz)];
    }
    return _paroleShowAspect;
}

- (NSArray *)regaliaWetButton {
    if (!_regaliaWetButton) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:10];
        for (int i = 1; i <= 9; i++) {
            CGFloat marginW = (mjoXDWScreenWidthXojm-tpuLDWPasswordNumButtonWidthLupt*3)/4;
            ZZWatchwordFigurePush *button = [[ZZWatchwordFigurePush alloc] initWithFrame:CGRectMake(marginW + (marginW + tpuLDWPasswordNumButtonWidthLupt) * ((i - 1) % 3), ZZPasswordMartialWhirligigEmbellish + (ZZPasswordChineseReleaseLeeway + tpuLDWPasswordNumButtonWidthLupt) * ((i - 1) / 3), tpuLDWPasswordNumButtonWidthLupt, tpuLDWPasswordNumButtonWidthLupt) number:i];
            button.tag = i;
            [button addTarget:self action:@selector(buttonComeRap:) forControlEvents:UIControlEventTouchUpInside];
            [array addObject:button];
        }
        ZZWatchwordFigurePush *button = [[ZZWatchwordFigurePush alloc] initWithFrame:CGRectMake(wofFDWPasswordNumButtonLeftPaddingFfow + (ZZPasswordChineseReleaseLeeway + tpuLDWPasswordNumButtonWidthLupt), ZZPasswordMartialWhirligigEmbellish + (ZZPasswordChineseReleaseLeeway + tpuLDWPasswordNumButtonWidthLupt) * 3, tpuLDWPasswordNumButtonWidthLupt, tpuLDWPasswordNumButtonWidthLupt) number:0];
        button.tag = 0;
        [button addTarget:self action:@selector(buttonComeRap:) forControlEvents:UIControlEventTouchUpInside];
        [array addObject:button];
        _regaliaWetButton = [[NSArray alloc] initWithArray:[array copy]];
    }
    return _regaliaWetButton;
}

- (UIButton *)qNepButtonBackspacepeNq {
    if (!_qNepButtonBackspacepeNq) {
        _qNepButtonBackspacepeNq = [UIButton buttonWithType:UIButtonTypeCustom];
        [_qNepButtonBackspacepeNq setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@%@",@"bac",@"kspa",@"c",@"e"])] forState:UIControlStateNormal];
        [_qNepButtonBackspacepeNq setFrame:CGRectMake(CGRectGetMidX(self.view.frame) - 34 / 2, CGRectGetMaxY([self.regaliaWetButton lastObject].frame) + ZZPasswordChineseReleaseLeeway, 34, 25)];
        [_qNepButtonBackspacepeNq addTarget:self action:@selector(SiyJButtonBackspaceTapJyiS) forControlEvents:UIControlEventTouchUpInside];
    }
    return _qNepButtonBackspacepeNq;
}

- (UIButton *)RhAcButtonQuitcAhR {
    if (!_RhAcButtonQuitcAhR) {
        _RhAcButtonQuitcAhR = [UIButton buttonWithType:UIButtonTypeCustom];
        [_RhAcButtonQuitcAhR setTitle:@"取消" forState:UIControlStateNormal];
        [_RhAcButtonQuitcAhR setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _RhAcButtonQuitcAhR.titleLabel.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@%@",@"Cour",@"ierNe",@"wPS",@"M",@"T"]) size:18];
        [_RhAcButtonQuitcAhR sizeToFit];
        [_RhAcButtonQuitcAhR setFrame:CGRectMake(CGRectGetMidX([self.regaliaWetButton objectAtIndex:8].frame) - _RhAcButtonQuitcAhR.frame.size.width / 2, self.qNepButtonBackspacepeNq.frame.origin.y, _RhAcButtonQuitcAhR.frame.size.width, _RhAcButtonQuitcAhR.frame.size.height)];
        [_RhAcButtonQuitcAhR addTarget:self action:@selector(CzRtButtonQuitTaptRzC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _RhAcButtonQuitcAhR;
}

- (YbsODWPasswordCheckerOsbY *)CfxACheckerAxfC {
    if (!_CfxACheckerAxfC) {
        _CfxACheckerAxfC = [[YbsODWPasswordCheckerOsbY alloc] init];
    }
    return _CfxACheckerAxfC;
}

- (NSMutableString *)password {
    if (!_password) {
        _password = [[NSMutableString alloc] initWithCapacity:4];
    }
    return _password;
}

- (LAContext *)FwnOLaContextOnwF {
    if (!_FwnOLaContextOnwF) {
        _FwnOLaContextOnwF = [[LAContext alloc] init];
    }
    return _FwnOLaContextOnwF;
}

#pragma mark - handle tap gesture
- (void)SiyJButtonBackspaceTapJyiS {
    if (!self.paroleShowAspect.isEmpty) {
        [self.paroleShowAspect RMsgMinusgsMR];
        if (self.password.length > 0) {
            [self.password deleteCharactersInRange:NSMakeRange(self.password.length - 1, 1)];
        }
    }
}

- (void)CzRtButtonQuitTaptRzC {
    [self.delegate dismissViewController];
    [self.delegate setStjzSwitcherValuezjtS:NO];
}

- (void)buttonComeRap:(ZZWatchwordFigurePush *)sender {
    if (!self.paroleShowAspect.AVMNIsFullNMVA) {
        [self.paroleShowAspect poEBPlusBEop];
        if (self.password.length < 4) {
            [self.password appendString:[NSString stringWithFormat:@"%ld", (long)sender.tag]];
        }
        if (self.password.length == 4) {
            if (self.hbLFIsSettingModeFLbh) {
                [self.delegate redeemKeyStampDataPointHome:self.password];
                [self.delegate dismissViewController];
            } else {
                if ([self.CfxACheckerAxfC moderateParole:self.password]) {
                    [self.delegate enterApp];
                } else {
                }
            }
        }
    }
}

@end
