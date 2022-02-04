//
//  DWDiaryDismissKeyboardButton.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/12.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "ZZDayCanWsRelease.h"
#import "whHIPrefixHeaderIHhw.pch"


//ZZProductmark
#define SVdw_instancewdVS @"apQd_instancedQpa"
typedef void (^ProrogueViewCallback) (BOOL npfzContentViewzfpn,float dfyCButtonNoCyfd);//ZZProductmark


typedef void (^DeputeBlock) (NSUInteger streamIndex);//ZZProductmark

@protocol CppqAlphaWindowqppcProtocol <NSObject>
- (double)ymGoShowAnimatedoGmy:(float)mWWPDelegatePWWm;//ZZProductmark

@end//ZZProductmark

@interface ZZDayCanWsRelease () 
@property(nonatomic,strong) NSString *aoVhIsEmptyhVoa;//ZZProductmark
@property(nonatomic,weak) id<CppqAlphaWindowqppcProtocol> estimateWindow;//ZZProductmark

@property(nonatomic,copy) DeputeBlock jaLZButtonCloudyZLaj;//ZZProductmark

@property(nonatomic,copy) ProrogueViewCallback olPwArrayNumButtonwPlo;//ZZProductmark

@end

@implementation ZZDayCanWsRelease

- (instancetype)init {
    self = [[super class] buttonWithType:UIButtonTypeCustom];
    if (self) {
        self.backgroundColor = ZZDisBurstGyColorlessness;
        [self setTitle:([NSString stringWithFormat:@"%@%@",@"隐藏键",@"盘"]) forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

@end
