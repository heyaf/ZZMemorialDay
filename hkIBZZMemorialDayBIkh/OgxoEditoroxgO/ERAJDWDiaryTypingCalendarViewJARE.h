//
//  DWDiaryTypingCalendarView.h
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/12.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol xSPmDWDiaryTypingCalendarDelegatemPSx <NSObject>

- (void)leftButtonPressed;
- (void)rightButtonPressed;

@end

@interface ERAJDWDiaryTypingCalendarViewJARE : UIView

@property (strong, nonatomic) NSDictionary *dicDate;
@property (weak, nonatomic) id<xSPmDWDiaryTypingCalendarDelegatemPSx> delegate;

- (void)BYJhTransformToSmallMoodhJYB;
- (void)metamorphosePrintedAbnormalMode;

@end
