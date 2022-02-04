//
//  DWSettingSwitchTableViewCell.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/4/8.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "bjTFDWSettingSwitchTableViewCellFTjb.h"
#import "NfMTDWSettingStoreTMfN.h"
#import "whHIPrefixHeaderIHhw.pch"

//ZZProductmark
#define XCVkDelegatekVCx @"bdhyArrayImageViewyhdB"

typedef void (^YMJBToolBarBJMYBlock) (double buttonParanormal,float pVKzDetailzKVp);//ZZProductmark


typedef void (^IsOperateComplete) (void);//ZZProductmark


@interface bjTFDWSettingSwitchTableViewCellFTjb () 
@property(nonatomic,assign) double fourSubgroup;//ZZProductmark
@property(nonatomic,copy) IsOperateComplete iIDnTitlenDII;//ZZProductmark
@property(nonatomic,copy) YMJBToolBarBJMYBlock qQiRTableViewRiQQ;//ZZProductmark

@end

@implementation bjTFDWSettingSwitchTableViewCellFTjb

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier title:(NSString *)title {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *pronounceRubric = [[UILabel alloc] init];
        pronounceRubric.text = title;
        pronounceRubric.font = [UIFont systemFontOfSize:16];
        [pronounceRubric sizeToFit];
        CGRect rect = pronounceRubric.frame;
        rect.origin.x = 10;
        rect.origin.y = 50 / 2 - rect.size.height / 2;
        pronounceRubric.frame = rect;
        [self.contentView addSubview:pronounceRubric];
        
        [self.contentView addSubview:self.CCmwSwitcherwmCC];
    }
    return self;
}

- (UISwitch *)CCmwSwitcherwmCC {
    if (!_CCmwSwitcherwmCC) {
        _CCmwSwitcherwmCC = [[UISwitch alloc] init];
        CGRect rect = _CCmwSwitcherwmCC.frame;
        rect.origin.x = mjoXDWScreenWidthXojm - rect.size.width - 10;
        rect.origin.y = 50 / 2 - rect.size.height / 2;
        _CCmwSwitcherwmCC.frame = rect;
        _CCmwSwitcherwmCC.on = [NfMTDWSettingStoreTMfN sharedInstance].isLocked;
        [_CCmwSwitcherwmCC addTarget:self action:@selector(ipOVSwitcherValueChangedVOpi:) forControlEvents:UIControlEventValueChanged];
    }
    return _CCmwSwitcherwmCC;
}

- (void)ipOVSwitcherValueChangedVOpi:(UISwitch *)sender {
    [self.delegate ipOVSwitcherValueChangedVOpi:sender];
}

@end
