//
//  DWSettingStore.h
//  ZZMemorialDay
//
//  Created by mac on 2022/1/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NfMTDWSettingStoreTMfN : NSObject
@property (assign, nonatomic) BOOL isLocked;

+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
