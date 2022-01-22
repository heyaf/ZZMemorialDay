//
//  DWSettingStore.m
//  ZZMemorialDay
//
//  Created by mac on 2022/1/22.
//

#import "DWSettingStore.h"

@implementation DWSettingStore
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
