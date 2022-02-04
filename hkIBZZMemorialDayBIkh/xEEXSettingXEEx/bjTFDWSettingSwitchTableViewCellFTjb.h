//
//  DWSettingSwitchTableViewCell.h
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/4/8.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SgyfDWSettingSwitchCellDelegatefygS <NSObject>

- (void)ipOVSwitcherValueChangedVOpi:(UISwitch *)sender;

@end

@interface bjTFDWSettingSwitchTableViewCellFTjb : UITableViewCell

@property (strong, nonatomic) UISwitch *CCmwSwitcherwmCC;
@property (weak, nonatomic) id<SgyfDWSettingSwitchCellDelegatefygS> delegate;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title;

@end
