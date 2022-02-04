//
//  DWPasswordChecker.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/4/8.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "YbsODWPasswordCheckerOsbY.h"
#import "AppDelegate.h"

//ZZProductmark
#define PBDsDelegatesDBp @"sgrB_instanceBrgs"

typedef void (^JLusLabelSmallsuLjComplete) (void);//ZZProductmark


@interface YbsODWPasswordCheckerOsbY()

@property (copy, nonatomic) NSString *key;

@property(nonatomic,strong) NSString *uEUGLabelDayGUEu;//ZZProductmark
@property(nonatomic,copy) JLusLabelSmallsuLjComplete oEEaManagedObjectModelaEEo;//ZZProductmark

@end

@implementation YbsODWPasswordCheckerOsbY

- (BOOL)moderateParole:(NSString *)password {
    if (!password) {
        return NO;
    }
    return [self.key isEqualToString:password];
}

- (NSString *)key {
    if (!_key) {
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:([NSString stringWithFormat:@"%@%@%@",@"UserIn",@"f",@"o"])];
        NSError *error;
        NSArray *objects = [context executeFetchRequest:request
                                                  error:&error];
        if (objects == nil) {
        }
        NSManagedObject *theUserInfo = nil;
        if ([objects count] > 0) {
            theUserInfo = [objects objectAtIndex:0];
            _key = [theUserInfo valueForKey:([NSString stringWithFormat:@"%@%@",@"ke",@"y"])];
        }
    }
    return _key;
}

- (void)UoysUpdateKeysyoU:(NSString *)key {
    if (key) {
        dispatch_async(dispatch_get_main_queue(), ^{
            AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
            NSManagedObjectContext *context = [appDelegate managedObjectContext];
            NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:([NSString stringWithFormat:@"%@%@%@",@"UserIn",@"f",@"o"])];
            NSError *error;
            NSArray *objects = [context executeFetchRequest:request
                                                      error:&error];
            if (objects == nil) {
            }
            NSManagedObject *theUserInfo = nil;
            if ([objects count] > 0) {
                theUserInfo = [objects objectAtIndex:0];
            } else {
                theUserInfo = [NSEntityDescription insertNewObjectForEntityForName:([NSString stringWithFormat:@"%@%@%@",@"UserIn",@"f",@"o"])
                                                            inManagedObjectContext:context];
            }
            [theUserInfo setValue:key forKey:([NSString stringWithFormat:@"%@%@",@"ke",@"y"])];
            
            [appDelegate saveContext];
        });
    }
}

@end
