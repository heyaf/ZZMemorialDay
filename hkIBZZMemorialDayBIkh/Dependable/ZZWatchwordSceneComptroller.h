//
//  DWPasswordViewController.h
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/4/8.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol yVAvDWPasswordViewControllerDelegatevAVy <NSObject>

- (void)dismissViewController;
- (void)redeemKeyStampDataPointHome:(NSString *)key;
- (void)setStjzSwitcherValuezjtS:(BOOL)value;

- (void)enterApp;

@end

@interface ZZWatchwordSceneComptroller : UIViewController

@property (weak, nonatomic) id<yVAvDWPasswordViewControllerDelegatevAVy> delegate;
@property (assign, nonatomic) BOOL hbLFIsSettingModeFLbh;

@end
