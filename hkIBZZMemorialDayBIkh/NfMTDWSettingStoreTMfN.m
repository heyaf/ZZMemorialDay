//
//  DWSettingStore.m
//  ZZMemorialDay
//
//  Created by mac on 2022/1/22.
//

#import "NfMTDWSettingStoreTMfN.h"

//ZZProductmark
#define RngZIsLockedZgnr @"yZleButtonSadelZy"
typedef void (^WdkLDicDateLkdWBlock) (float window);//ZZProductmark

typedef void (^MQotTFTitletoQMHandler) (void);//ZZProductmark
@protocol LOUgTypingViewgUOLExtension <NSObject>
- (void)aZGjCompletionjGZa:(BOOL)mrPtTitletPrm;//ZZProductmark

@end//ZZProductmark


@interface NfMTDWSettingStoreTMfN () 
@property(nonatomic,assign) int yPrZManagedObjectContextZrPY;//ZZProductmark

@property(nonatomic,weak) id<LOUgTypingViewgUOLExtension> uiWmButtonNomWiu;//ZZProductmark

@property(nonatomic,copy) MQotTFTitletoQMHandler kDKPEmotionPKDK;//ZZProductmark

@property(nonatomic,copy) WdkLDicDateLkdWBlock wUifButtonEmotionfiUw;//ZZProductmark

@end

@implementation NfMTDWSettingStoreTMfN
static id _instance;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    @synchronized (self) {
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    }
    return _instance;
}

+ (instancetype)sharedInstance {
    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}

@end
