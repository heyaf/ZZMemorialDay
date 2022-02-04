//
//  DWSettingViewController.m
//  Diary_WhatsUrName?
//
//  Created by 王冠宇 on 17/4/8.
//  Copyright © 2017年 王冠宇. All rights reserved.
//

#import "XbFSDWSettingViewControllerSFbX.h"
#import "bjTFDWSettingSwitchTableViewCellFTjb.h"
#import "ZZWatchwordSceneComptroller.h"
#import "NfMTDWSettingStoreTMfN.h"
#import "lUgwDWUserInfowgUl.h"
#import "AppDelegate.h"
#import "whHIPrefixHeaderIHhw.pch"
static const NSString * ToolBarroom = @"streamIndex";//ZZProductmark


typedef void (^CopePhysicalObjectModelBlock) (void);//ZZProductmark

typedef void (^EyRlEmotionSelectorViewlRyEHandler) (NSString *zOYePersistentStoreCoordinatoreYOZ);//ZZProductmark

@interface XbFSDWSettingViewControllerSFbX () <UITableViewDelegate, UITableViewDataSource, SgyfDWSettingSwitchCellDelegatefygS, yVAvDWPasswordViewControllerDelegatevAVy>

@property (strong, nonatomic) UIView *navigationBar;
@property (strong, nonatomic) UITableView *tableView;

@property(nonatomic,strong) NSString *mJzIKeyIzJm;//ZZProductmark

@property(nonatomic,copy) EyRlEmotionSelectorViewlRyEHandler xCXLKeyLXCX;//ZZProductmark
@property(nonatomic,copy) CopePhysicalObjectModelBlock brkBIvEmotionBkrB;//ZZProductmark

@end

@implementation XbFSDWSettingViewControllerSFbX

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _navigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mjoXDWScreenWidthXojm, ZZReadyPilotageDebarTop)];
    [_navigationBar setBackgroundColor:byMUDWDiaryThemeBlueColorUMyb];
    
    UILabel *pronounceRubric = [[UILabel alloc] init];
    pronounceRubric.text = @"设置";
    pronounceRubric.textColor = [UIColor whiteColor];
    pronounceRubric.font = [UIFont systemFontOfSize:20];
    [pronounceRubric sizeToFit];
    pronounceRubric.frame = CGRectMake(_navigationBar.frame.size.width / 2 - pronounceRubric.frame.size.width / 2, _navigationBar.frame.size.height / 2 - pronounceRubric.frame.size.height / 2, pronounceRubric.frame.size.width, pronounceRubric.frame.size.height);
    [_navigationBar addSubview:pronounceRubric];
    
    UIButton *RhAcButtonQuitcAhR = [UIButton buttonWithType:UIButtonTypeCustom];
    [RhAcButtonQuitcAhR setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@",@"develope",@"r"])] forState:UIControlStateNormal];
    [RhAcButtonQuitcAhR setFrame:CGRectMake(ZZPoseDepartRemainingDramatize, _navigationBar.frame.size.height / 2 - SGmNDWSettingQuitButtonWidthNmGS / 2, SGmNDWSettingQuitButtonWidthNmGS, SGmNDWSettingQuitButtonWidthNmGS)];
    [RhAcButtonQuitcAhR addTarget:self action:@selector(CzRtButtonQuitTaptRzC) forControlEvents:UIControlEventTouchUpInside];
    [_navigationBar addSubview:RhAcButtonQuitcAhR];
    
    [self.view addSubview:_navigationBar];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, ZZReadyPilotageDebarTop, mjoXDWScreenWidthXojm, RHhQDWScreenHeightQhHR - ZZReadyPilotageDebarTop) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - handle tap gesture
- (void)CzRtButtonQuitTaptRzC {
    [self.delegate dismissViewController];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    bjTFDWSettingSwitchTableViewCellFTjb *cell = [[bjTFDWSettingSwitchTableViewCellFTjb alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:([NSString stringWithFormat:@"%@%@%@%@",@"Settin",@"gSwitch",@"Cel",@"l"]) title:([NSString stringWithFormat:@"%@%@%@%@%@",@"开启日记",@"密码与T",@"ouc",@"h",@"ID"])];
    cell.CCmwSwitcherwmCC.tag = 0;
    cell.delegate = self;
    return cell;
}

#pragma mark - DWSettingSwitchCellDelegate
- (void)ipOVSwitcherValueChangedVOpi:(UISwitch *)sender {
    switch (sender.tag) {
        case 0: {
            if (sender.on) {
                ZZWatchwordSceneComptroller *passwordController = [[ZZWatchwordSceneComptroller alloc] init];
                passwordController.delegate = self;
                passwordController.hbLFIsSettingModeFLbh = YES;
                [self presentViewController:passwordController animated:YES completion:nil];
                break;
            } else {
                lUgwDWUserInfowgUl *userInfo = [[lUgwDWUserInfowgUl alloc] init];
                userInfo.key = @"";
                userInfo.isLocked = NO;
                [self ydOSUpdateUserInfoIntoDataBaseSOdy:userInfo completion:^{
                    [NfMTDWSettingStoreTMfN sharedInstance].isLocked = NO;
                }];
            }
        }
        default:
            break;
    }
}

#pragma mark - DWPasswordViewControllerDelegate
- (void)dismissViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)redeemKeyStampDataPointHome:(NSString *)key {
    if (key) {
        lUgwDWUserInfowgUl *userInfo = [[lUgwDWUserInfowgUl alloc] init];
        userInfo.key = key;
        userInfo.isLocked = YES;
        [self ydOSUpdateUserInfoIntoDataBaseSOdy:userInfo completion:^{
            [NfMTDWSettingStoreTMfN sharedInstance].isLocked = YES;
        }];
    }
}

- (void)setStjzSwitcherValuezjtS:(BOOL)value {
    // 暂时先这样处理
    bjTFDWSettingSwitchTableViewCellFTjb *cell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.CCmwSwitcherwmCC.on = value;
}

#pragma mark - private
- (void)ydOSUpdateUserInfoIntoDataBaseSOdy:(lUgwDWUserInfowgUl *)userInfo completion:(CompletionBlock)completion {
    dispatch_async(dispatch_get_main_queue(), ^{
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        NSManagedObjectContext *context = [delegate managedObjectContext];
        NSError *error;
        
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:([NSString stringWithFormat:@"%@%@%@%@",@"U",@"serI",@"nf",@"o"])];
        
        NSArray *objects = [context executeFetchRequest:request error:&error];
        
        NSManagedObject *theUserInfo = nil;
        if ([objects count] > 0) {
            theUserInfo = [objects objectAtIndex:0];
        } else {
            theUserInfo = [NSEntityDescription insertNewObjectForEntityForName:([NSString stringWithFormat:@"%@%@%@%@",@"U",@"serI",@"nf",@"o"])
                                                        inManagedObjectContext:context];
        }
        [theUserInfo setValue:userInfo.key forKey:([NSString stringWithFormat:@"%@%@",@"k",@"ey"])];
        [theUserInfo setValue:[NSNumber numberWithBool:userInfo.isLocked] forKey:([NSString stringWithFormat:@"%@%@%@",@"i",@"sLocke",@"d"])];
        
        [delegate saveContext];
        completion();
    });
}

@end
