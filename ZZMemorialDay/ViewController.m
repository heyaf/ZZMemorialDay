//
//  ViewController.m
//  ZZMemorialDay
//
//  Created by mac on 2022/1/20.
//

#import "ViewController.h"
#import "DWDiaryTableViewCell.h"
#import "DWDiaryCalendarScrollView.h"
#import "DWDiaryTypingCalendarView.h"
#import "DWDiaryTypingView.h"
#import "DWDiaryDismissKeyboardButton.h"
#import "DWDiaryContentView.h"
#import "Constants.h"

//#import "DWPasswordViewController.h"
#import "DWSettingViewController.h"

#import "AppDelegate.h"

typedef enum : NSUInteger {
    CONTROLLER_MODE_BROWSE,
    CONTROLLER_MODE_CALENDAR,
    CONTROLLER_MODE_TYPING,
} DWControllerMode;
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, DWDiaryTypingCalendarDelegate, DWDiaryTypingDelegate, DWDiaryContentViewDelegate, DWSettingViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *arrayModel;
@property (strong, nonatomic) NSMutableArray *arrayModelDay;

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *navigationBar;
@property (strong, nonatomic) UISegmentedControl *segment;
@property (strong, nonatomic) UIButton *buttonSetting;
@property (strong, nonatomic) UILabel *labelTheme;
@property (strong, nonatomic) DWDiaryCalendarScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *arrayTodayDics;

@property (strong, nonatomic) DWDiaryTypingCalendarView *pickerView;
@property (strong, nonatomic) DWDiaryTypingView *typingView;
@property (strong, nonatomic) DWDiaryDismissKeyboardButton *disKeyboardButton;

@property (strong, nonatomic) DWDiaryContentView *contentView;
@property (strong, nonatomic) NSIndexPath *currentIndexPath;

@property (assign, nonatomic) DWControllerMode controllerMode;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
