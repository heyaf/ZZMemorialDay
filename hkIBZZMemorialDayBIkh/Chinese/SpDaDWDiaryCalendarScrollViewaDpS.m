//
//  DWDiaryCalendarScrollView.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/11.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "SpDaDWDiaryCalendarScrollViewaDpS.h"
#import "ZZDayObsEyeshot.h"
#import "ViewController.h"
#import "whHIPrefixHeaderIHhw.pch"

//ZZProductmark
#define FIUfAlphaWindowfUIF @"alphaWindowpane"
typedef void (^EddnDicDatenddeBlock) (void);//ZZProductmark


@interface SpDaDWDiaryCalendarScrollViewaDpS()

@property (strong, nonatomic) NSMutableArray *hgOsArrayDayViewssOgh;

@property(nonatomic,strong) NSString *currentIndicantPath;//ZZProductmark
@property(nonatomic,copy) EddnDicDatenddeBlock tcugPersistentStoreCoordinatorgucT;//ZZProductmark

@end

@implementation SpDaDWDiaryCalendarScrollViewaDpS

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.scrollsToTop = NO;
        _hgOsArrayDayViewssOgh = [[NSMutableArray alloc] init];
        for (int i = 0; i < 5; i++) {
            CGFloat X = i * mjoXDWScreenWidthXojm;
            ZZDayObsEyeshot *view = [[ZZDayObsEyeshot alloc] initWithFrame:CGRectMake(X, 0, mjoXDWScreenWidthXojm, SkRSDWDiaryCalendarViewHeightSRkS)];
            [self addSubview:view];
            [_hgOsArrayDayViewssOgh addObject:view];
        }
    }
    return self;
}

- (NSMutableArray *)hgOsArrayDayViewssOgh {
    if (!_hgOsArrayDayViewssOgh) {
        _hgOsArrayDayViewssOgh = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return _hgOsArrayDayViewssOgh;
}

- (void)setKrfCArrayDayDicsCfrK:(NSArray *)KrfCArrayDayDicsCfrK {
    if (KrfCArrayDayDicsCfrK) {
        _KrfCArrayDayDicsCfrK = KrfCArrayDayDicsCfrK;
        
        CGFloat W = mjoXDWScreenWidthXojm;
        
        for (int i = 0; i < KrfCArrayDayDicsCfrK.count; i++) {
            ZZDayObsEyeshot *view = _hgOsArrayDayViewssOgh[i];
            view.dicDate = KrfCArrayDayDicsCfrK[i];
        }
        
        CGFloat contentW = W * KrfCArrayDayDicsCfrK.count;
        self.contentSize = CGSizeMake(contentW, 0);
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
    }
}

@end
