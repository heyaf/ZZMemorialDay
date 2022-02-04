//
//  DWDiaryTypingView.h
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/12.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZZDayTypeDesignate <NSObject>

- (void)saveModelWithTitle:(NSString *)title detail:(NSString *)detail emotion:(NSString *)emotion weather:(NSString *)weather;

@end

@interface aaklDWDiaryTypingViewlkaa : UIView

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *detail;
@property (strong, nonatomic) NSString *emotion;
@property (strong, nonatomic) NSString *weather;

@property (weak, nonatomic) id<ZZDayTypeDesignate> delegate;

- (void)LnKdUpdateFrameWithDaltadKnL:(CGFloat)dalta;

@end
