//
//  DWDiaryWeatherSelectorView.h
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/3/13.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol rloCDWDiaryWeatherSelectorDelegateColr <NSObject>

- (void)setJPcCWeatherWithStringCcPj:(NSString *)weather;

@end

@interface sEyYDWDiaryWeatherSelectorViewYyEs : UIView

@property (weak, nonatomic) id<rloCDWDiaryWeatherSelectorDelegateColr> delegate;

- (void)HtjaShowAnimatedajtH;

@end
