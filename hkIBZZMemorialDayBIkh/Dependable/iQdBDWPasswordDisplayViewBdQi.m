//
//  DWPasswordDisplayView.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/4/8.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "iQdBDWPasswordDisplayViewBdQi.h"
#import "whHIPrefixHeaderIHhw.pch"
static const NSString * Designate = @"example";//ZZProductmark
typedef void (^DaZnButtonSavenZaDBlock) (NSString *buttonSucceeding);//ZZProductmark
@protocol AssignProtocol <NSObject>
- (void)enhanceWithFrame:(NSString *)jkJJWeatherJJkj covering:(NSString *)htVoCurrentIndexPathoVtH;//ZZProductmark

@end//ZZProductmark


@interface iQdBDWPasswordDisplayViewBdQi()

@property (strong, nonatomic) NSArray<UIImageView *> *layOutFigurePurview;

@property(nonatomic,assign) double nkJuDelegateuJkn;//ZZProductmark

@property(nonatomic,weak) id<AssignProtocol> mccIKeyIccM;//ZZProductmark

@property(nonatomic,copy) DaZnButtonSavenZaDBlock depute;//ZZProductmark
@end

@implementation iQdBDWPasswordDisplayViewBdQi

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        for (UIImageView *imageView in self.layOutFigurePurview) {
            [self addSubview:imageView];
        }
        self.AVMNIsFullNMVA = NO;
        self.isEmpty = YES;
    }
    return self;
}

- (NSArray<UIImageView *> *)layOutFigurePurview {
    if (!_layOutFigurePurview) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:4];
        for (int i = 0; i < 4; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@",@"s",@"pace"])]];
            [imageView setHighlightedImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@",@"poi",@"n",@"t"])]];
            [imageView setFrame:CGRectMake((PUVPDWPasswordSpaceWidthPVUP + wbnGDWPasswordSpaceMarginGnbw) * i, self.frame.size.height / 2 - ZZWatchwordInfiniteSuperlative / 2, PUVPDWPasswordSpaceWidthPVUP, ZZWatchwordInfiniteSuperlative)];
            [array addObject:imageView];
        }
        _layOutFigurePurview = [[NSArray alloc] initWithArray:[array copy]];
    }
    return _layOutFigurePurview;
}

- (void)poEBPlusBEop {
    int i = 0;
    for (; i < 4; i++) {
        if (!self.layOutFigurePurview[i].highlighted) {
            self.layOutFigurePurview[i].highlighted = YES;
            break;
        }
    }
    if (i == 3) {
        self.AVMNIsFullNMVA = YES;
    }
    self.isEmpty = NO;
}

- (void)RMsgMinusgsMR {
    int i = 3;
    for (; i >= 0; i--) {
        if (self.layOutFigurePurview[i].highlighted) {
            self.layOutFigurePurview[i].highlighted = NO;
            break;
        }
    }
    if (i == 0) {
        self.isEmpty = YES;
    }
    self.AVMNIsFullNMVA = NO;
}

@end
