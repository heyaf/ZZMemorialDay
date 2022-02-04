//
//  AppDelegate.m
//  ZZMemorialDay
//
//  Created by mac on 2022/1/20.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NfMTDWSettingStoreTMfN.h"
#import "ZZWatchwordSceneComptroller.h"

@interface AppDelegate ()<yVAvDWPasswordViewControllerDelegatevAVy>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self loadUserInfoFromDataBase];
    
    if ([NfMTDWSettingStoreTMfN sharedInstance].isLocked) {
        ZZWatchwordSceneComptroller *passwordController = [[ZZWatchwordSceneComptroller alloc] init];
        passwordController.hbLFIsSettingModeFLbh = NO;
        passwordController.delegate = self;
        self.window.rootViewController = passwordController;
    } else {
        UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
        self.window.rootViewController = navigation;
        navigation.navigationBar.translucent = NO;
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    if ([NfMTDWSettingStoreTMfN sharedInstance].isLocked) {
        ZZWatchwordSceneComptroller *passwordController = [[ZZWatchwordSceneComptroller alloc] init];
        passwordController.hbLFIsSettingModeFLbh = NO;
        passwordController.delegate = self;
        self.window.rootViewController = passwordController;
    } else {
        UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
        self.window.rootViewController = navigation;
        navigation.navigationBar.translucent = NO;
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "BUPT.Daily" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:([NSString stringWithFormat:@"%@%@%@%@",@"Dia",@"ry_Whats",@"UrName",@"_"]) withExtension:([NSString stringWithFormat:@"%@%@%@",@"m",@"om",@"d"])];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:([NSString stringWithFormat:@"%@%@%@",@"Diary_WhatsUrNa",@"me?.sqlit",@"e"])];
    NSError *error = nil;
    NSString *failureReason = ([NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",@"There was an ",@"error creating or loading th",@"e a",@"pplication's saved d",@"a",@"t",@"a",@"."]);
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = ([NSString stringWithFormat:@"%@%@%@%@%@%@",@"Failed to initiali",@"ze the applicatio",@"n's saved ",@"d",@"at",@"a"]);
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:([NSString stringWithFormat:@"%@%@%@%@%@%@",@"YOU",@"R_ERROR",@"_DOM",@"A",@"I",@"N"]) code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}


#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            abort();
        }
    }
}

#pragma mark - private
- (void)loadUserInfoFromDataBase {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSError *error;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:([NSString stringWithFormat:@"%@%@",@"UserInf",@"o"])];
    
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    NSManagedObject *theUserInfo = nil;
    if ([objects count] > 0) {
        theUserInfo = [objects objectAtIndex:0];
        [NfMTDWSettingStoreTMfN sharedInstance].isLocked = ((NSNumber *)[theUserInfo valueForKey:([NSString stringWithFormat:@"%@%@%@",@"i",@"sLocke",@"d"])]).integerValue;
    } else {
        [NfMTDWSettingStoreTMfN sharedInstance].isLocked = NO;
    }
}

#pragma mark - DWPasswordViewControllerDelegate
- (void)enterApp {
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    self.window.rootViewController = navigation;
    navigation.navigationBar.translucent = NO;
}
@end
