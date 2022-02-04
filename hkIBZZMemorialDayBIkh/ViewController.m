//
//  ViewController.m
//  ZZMemorialDay
//
//  Created by mac on 2022/1/20.
//

#import "ViewController.h"
#import "JiCBDWDiaryTableViewCellBCiJ.h"
#import "SpDaDWDiaryCalendarScrollViewaDpS.h"
#import "ERAJDWDiaryTypingCalendarViewJARE.h"
#import "aaklDWDiaryTypingViewlkaa.h"
#import "ZZDayCanWsRelease.h"
#import "UlSsDWDiaryContentViewsSlU.h"
#import "whHIPrefixHeaderIHhw.pch"
//#import "DWPasswordViewController.h"
#import "XbFSDWSettingViewControllerSFbX.h"

#import "AppDelegate.h"

typedef enum : NSUInteger {
    CONTROLLER_MODE_BROWSE,
    CONTROLLER_MODE_CALENDAR,
    CONTROLLER_MODE_TYPING,
} DWControllerMode;
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, xSPmDWDiaryTypingCalendarDelegatemPSx, ZZDayTypeDesignate, JMiuDWDiaryContentViewDelegateuiMJ, HsvgDWSettingViewControllerDelegategvsH>

@property (strong, nonatomic) NSMutableArray *arrayModel;
@property (strong, nonatomic) NSMutableArray *arrayModelDay;

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *navigationBar;
@property (strong, nonatomic) UISegmentedControl *segment;
@property (strong, nonatomic) UIButton *buttonSetting;
@property (strong, nonatomic) UILabel *labelTheme;
@property (strong, nonatomic) SpDaDWDiaryCalendarScrollViewaDpS *scrollView;
@property (strong, nonatomic) NSMutableArray *arrayTodayDics;

@property (strong, nonatomic) ERAJDWDiaryTypingCalendarViewJARE *pickerView;
@property (strong, nonatomic) aaklDWDiaryTypingViewlkaa *typingView;
@property (strong, nonatomic) ZZDayCanWsRelease *disKeyboardButton;

@property (strong, nonatomic) UlSsDWDiaryContentViewsSlU *contentView;
@property (strong, nonatomic) NSIndexPath *currentIndexPath;

@property (assign, nonatomic) DWControllerMode controllerMode;

@end

@implementation ViewController{
}

+ (NSArray *)arrayMonth
{
    static NSArray *_month;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _month = @[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",([NSString stringWithFormat:@"%@%@%@",@"1",@"0",@"月"]),([NSString stringWithFormat:@"%@%@",@"1",@"1月"]),([NSString stringWithFormat:@"%@%@",@"1",@"2月"])];
    });
    return _month;
}

+ (NSArray *)arrayWeekDay
{
    static NSArray *_weekDay;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _weekDay = @[([NSString stringWithFormat:@"%@%@%@",@"星",@"期",@"日"]),([NSString stringWithFormat:@"%@%@",@"星",@"期一"]),([NSString stringWithFormat:@"%@%@%@",@"星",@"期",@"二"]),([NSString stringWithFormat:@"%@%@",@"星期",@"三"]),([NSString stringWithFormat:@"%@%@",@"星期",@"四"]),([NSString stringWithFormat:@"%@%@%@",@"星",@"期",@"五"]),([NSString stringWithFormat:@"%@%@",@"星期",@"六"])];
    });
    return _weekDay;
}

+ (NSArray *)arrayFormatNumber {
    static NSArray *_formatNumber;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _formatNumber = @[@"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09"];
    });
    return _formatNumber;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@",@"ZCsEBgImageE",@"sC",@"Z"])]]];
    
    CGRect rect = self.view.bounds;
    
    _arrayModel = [[NSMutableArray alloc] init];
    [self updateTableViewDataSourceFromDataBase];
    
    _arrayModelDay = [[NSMutableArray alloc] init];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, ZZDaySailingStopPeak, rect.size.width, rect.size.height - CGRectGetHeight(_navigationBar.frame)) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _navigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, ZZDaySailingStopPeak)];
    _navigationBar.backgroundColor = [UIColor whiteColor];
    
    _segment = [[UISegmentedControl alloc] initWithItems:@[@"浏览", @"日历", @"撰写"]];
    _segment.tintColor = byMUDWDiaryThemeBlueColorUMyb;
    _segment.frame = CGRectMake(50, fueEDWDiarySegmentYEeuf, rect.size.width - 100, 25);
    [_segment addTarget:self action:@selector(didChangeValueOfSegmentControl:) forControlEvents:UIControlEventValueChanged];
    _segment.selectedSegmentIndex = 0;
    [_navigationBar addSubview:_segment];
    
    _labelTheme = [[UILabel alloc] init];
    _labelTheme.font = [UIFont fontWithName:([NSString stringWithFormat:@"%@%@%@%@%@",@"STHeiti",@"SC-",@"Med",@"iu",@"m"]) size:20];
    _labelTheme.textColor = byMUDWDiaryThemeBlueColorUMyb;
    _labelTheme.text = @"日记";
    [_labelTheme sizeToFit];
    CGRect labelRect = _labelTheme.frame;
    labelRect.origin.x = _navigationBar.frame.size.width / 2 - labelRect.size.width / 2;
    labelRect.origin.y = CGRectGetMaxY(_segment.frame) / 2 + ZZDaySailingStopPeak / 2 - 12;
    _labelTheme.frame = labelRect;
    [_navigationBar addSubview:_labelTheme];
    
    _buttonSetting = [[UIButton alloc] initWithFrame:CGRectMake(RJUCDWDiaryButtonSettingPaddingCUJR, CGRectGetMidY(_segment.frame) - ZZDayReleaseCountersinkBreadth / 2, ZZDayReleaseCountersinkBreadth, ZZDayReleaseCountersinkBreadth)];
    [_buttonSetting setImage:[UIImage imageNamed:([NSString stringWithFormat:@"%@%@%@",@"sett",@"in",@"g"])] forState:UIControlStateNormal];
    [_buttonSetting addTarget:self action:@selector(buttonSettingTap) forControlEvents:UIControlEventTouchUpInside];
    [_navigationBar addSubview:_buttonSetting];

    [self.view addSubview:_navigationBar];
    
    _scrollView = [[SpDaDWDiaryCalendarScrollViewaDpS alloc] initWithFrame:CGRectMake(0, ZZDaySailingStopPeak, rect.size.width, SkRSDWDiaryCalendarViewHeightSRkS)];
    _scrollView.delegate = self;
    _scrollView.KrfCArrayDayDicsCfrK = self.arrayTodayDics;
    _scrollView.znxbCurrentIndexbxnz = 2;
    [_scrollView setContentOffset:CGPointMake(mjoXDWScreenWidthXojm * 2, 0)];
    
    _pickerView = [[ERAJDWDiaryTypingCalendarViewJARE alloc] initWithFrame:CGRectMake(0, ZZDaySailingStopPeak, mjoXDWScreenWidthXojm, qGGLDWDiaryTypingCalendarHeightLGGq)];
    _pickerView.dicDate = self.arrayTodayDics[2];
    _pickerView.delegate = self;
    
    _typingView = [[aaklDWDiaryTypingViewlkaa alloc] initWithFrame:CGRectMake(0, ZZDaySailingStopPeak + qGGLDWDiaryTypingCalendarHeightLGGq, mjoXDWScreenWidthXojm, RHhQDWScreenHeightQhHR - CGRectGetMaxY(_pickerView.frame))];
    _typingView.delegate = self;
    
    _disKeyboardButton = [[ZZDayCanWsRelease alloc] init];
    [_disKeyboardButton setFrame:CGRectMake(mjoXDWScreenWidthXojm - ZZDisSwashUnbuttonWidth, fmCjDWDisKeyboardButtonHeightjCmf + fmCjDWDisKeyboardButtonHeightjCmf, ZZDisSwashUnbuttonWidth, fmCjDWDisKeyboardButtonHeightjCmf)];

    _controllerMode = CONTROLLER_MODE_BROWSE;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
    
    //注册通知,监听键盘弹出事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    //注册通知,监听键盘消失事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    [_disKeyboardButton addTarget:self action:@selector(dismissKeyboardTap) forControlEvents:UIControlEventTouchUpInside];
}

- (NSMutableArray *)arrayTodayDics {
    if (!_arrayTodayDics) {
        _arrayTodayDics = [[NSMutableArray alloc] initWithCapacity:5];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSArray *MONTH = [[self class] arrayMonth];
        NSArray *WEEKDAY = [[self class] arrayWeekDay];
        
        for (int i = -2; i < 3; i++) {
            NSDateComponents *addingDateComponents = [[NSDateComponents alloc] init];
            [addingDateComponents setDay:i];
            NSDate *date = [calendar dateByAddingComponents:addingDateComponents toDate:[NSDate date] options:0];
            NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:date];
            [_arrayTodayDics insertObject:[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%ld年", components.year], ([NSString stringWithFormat:@"%@%@",@"yea",@"r"]), MONTH[components.month - 1], ([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"]), [NSString stringWithFormat:@"%ld", (long)components.day], ([NSString stringWithFormat:@"%@%@",@"d",@"ay"]), WEEKDAY[components.weekday - 1], ([NSString stringWithFormat:@"%@%@",@"wee",@"k"]), date, ([NSString stringWithFormat:@"%@%@",@"dat",@"e"]), nil] atIndex:i + 2];
        }
    }
    return _arrayTodayDics;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_segment.selectedSegmentIndex == 0) {
        return _arrayModel.count;
    } else {
        return _arrayModelDay.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JiCBDWDiaryTableViewCellBCiJ *cell = [tableView dequeueReusableCellWithIdentifier:([NSString stringWithFormat:@"%@%@",@"c",@"ell"])];
    if (!cell) {
        cell = [[JiCBDWDiaryTableViewCellBCiJ alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:([NSString stringWithFormat:@"%@%@",@"c",@"ell"])];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (_segment.selectedSegmentIndex == 0) {
        NSString *time = [self getTimeFromDate:[_arrayModel[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])]];
        cell.dicDate = [[NSDictionary alloc] initWithObjectsAndKeys:[_arrayModel[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"yea",@"r"])], ([NSString stringWithFormat:@"%@%@",@"yea",@"r"]), [_arrayModel[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"])], ([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"]),[_arrayModel[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"d",@"ay"])], ([NSString stringWithFormat:@"%@%@",@"d",@"ay"]), [_arrayModel[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"wee",@"k"])], ([NSString stringWithFormat:@"%@%@",@"wee",@"k"]), time, ([NSString stringWithFormat:@"%@%@%@",@"ti",@"m",@"e"]), [_arrayModel[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])], ([NSString stringWithFormat:@"%@%@",@"dat",@"e"]), nil];
        cell.title = [_arrayModel[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"tit",@"le"])];
        cell.detail = [_arrayModel[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"detai",@"l"])];
        cell.emotion = [_arrayModel[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"emot",@"ion"])];
        cell.weather = [_arrayModel[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"weathe",@"r"])];
    } else {
        NSString *time = [self getTimeFromDate:[_arrayModelDay[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])]];
        cell.dicDate = [[NSDictionary alloc] initWithObjectsAndKeys:[_arrayModelDay[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"yea",@"r"])], ([NSString stringWithFormat:@"%@%@",@"yea",@"r"]), [_arrayModelDay[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"])], ([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"]),[_arrayModelDay[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"d",@"ay"])], ([NSString stringWithFormat:@"%@%@",@"d",@"ay"]), [_arrayModelDay[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"wee",@"k"])], ([NSString stringWithFormat:@"%@%@",@"wee",@"k"]), time, ([NSString stringWithFormat:@"%@%@%@",@"ti",@"m",@"e"]), [_arrayModelDay[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])], ([NSString stringWithFormat:@"%@%@",@"dat",@"e"]), nil];
        cell.title = [_arrayModelDay[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"tit",@"le"])];
        cell.detail = [_arrayModelDay[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"detai",@"l"])];
        cell.emotion = [_arrayModelDay[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"emot",@"ion"])];
        cell.weather = [_arrayModelDay[indexPath.row] valueForKey:([NSString stringWithFormat:@"%@%@",@"weathe",@"r"])];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _contentView = [[UlSsDWDiaryContentViewsSlU alloc] initWithFrame:CGRectMake(10, 25, ZZDayContentedViewBreadth, ZZDaySubstanceCatchAcme)];
    _contentView.delegate = self;
    JiCBDWDiaryTableViewCellBCiJ *cell = [tableView cellForRowAtIndexPath:indexPath];
    _contentView.dicDate = cell.dicDate;
    _contentView.detail = cell.detail;
    [_contentView HtjaShowAnimatedajtH];
    _currentIndexPath = indexPath;
}

- (void)didChangeValueOfSegmentControl:(UISegmentedControl *)segment {
    switch (segment.selectedSegmentIndex) {
        case 0: {
            if (_controllerMode == CONTROLLER_MODE_BROWSE) {
                break;
            } else if (_controllerMode == CONTROLLER_MODE_CALENDAR) {
                [_scrollView removeFromSuperview];
                CGRect rect = _tableView.frame;
                rect.origin.y = ZZDaySailingStopPeak;
                rect.size.height = self.view.bounds.size.height - CGRectGetMaxY(_navigationBar.frame);
                _tableView.frame = rect;
                [_navigationBar addSubview:_labelTheme];
            } else if (_controllerMode == CONTROLLER_MODE_TYPING) {
                [_pickerView removeFromSuperview];
                [_typingView removeFromSuperview];
                CGRect rect = _tableView.frame;
                rect.origin.y = ZZDaySailingStopPeak;
                rect.size.height = self.view.bounds.size.height - CGRectGetMaxY(_navigationBar.frame);
                _tableView.frame = rect;
                [self.view addSubview:_tableView];
                [_navigationBar addSubview:_labelTheme];
            }
            _controllerMode = CONTROLLER_MODE_BROWSE;
            [self updateTableViewDataSourceFromDataBase];
            break;
        }
        case 1: {
            if (_controllerMode == CONTROLLER_MODE_BROWSE) {
                [_labelTheme removeFromSuperview];
                CGRect rect = _tableView.frame;
                rect.origin.y = ZZDaySailingStopPeak + SkRSDWDiaryCalendarViewHeightSRkS;
                rect.size.height = self.view.bounds.size.height - CGRectGetMaxY(_scrollView.frame);
                _tableView.frame = rect;
                [self.view addSubview:_scrollView];
                [self updateTableViewDataSourceFromDataBase];
            } else if (_controllerMode == CONTROLLER_MODE_CALENDAR) {
                break;
            } else if (_controllerMode == CONTROLLER_MODE_TYPING) {
                [_pickerView removeFromSuperview];
                [_typingView removeFromSuperview];
                [self.view addSubview:_scrollView];
                CGRect rect = _tableView.frame;
                rect.origin.y = ZZDaySailingStopPeak + SkRSDWDiaryCalendarViewHeightSRkS;
                rect.size.height = self.view.bounds.size.height - CGRectGetMaxY(_scrollView.frame);
                _tableView.frame = rect;
                [self.view addSubview:_tableView];
            }
            _controllerMode = CONTROLLER_MODE_CALENDAR;
            [self updateArrayModelDayWithDicDate:_scrollView.KrfCArrayDayDicsCfrK[_scrollView.znxbCurrentIndexbxnz]];
            [_tableView reloadData];
            break;
        }
        case 2: {
            if (_controllerMode == CONTROLLER_MODE_BROWSE) {
                [_tableView removeFromSuperview];
                [_labelTheme removeFromSuperview];
                [self.view addSubview:_pickerView];
                [self.view addSubview:_typingView];
            } else if (_controllerMode == CONTROLLER_MODE_CALENDAR) {
                [_scrollView removeFromSuperview];
                [_tableView removeFromSuperview];
                [self.view addSubview:_pickerView];
                [self.view addSubview:_typingView];
            } else if (_controllerMode == CONTROLLER_MODE_TYPING) {
                break;
            }
            _controllerMode = CONTROLLER_MODE_TYPING;
            [self updateTypingViewContentFromDataBaseWithDicDate:_pickerView.dicDate];
            break;
        }
        default:
            break;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidStop:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidStop:scrollView];
}

- (void)scrollViewDidStop:(UIScrollView *)scrollView {
    CGFloat scrollW = mjoXDWScreenWidthXojm;
    int page = (_scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    _scrollView.znxbCurrentIndexbxnz = page;
    if (page == 0) { // 先改变page == 3的View，后设置offset，再改变其他page的View
        NSMutableArray *array = [_scrollView.KrfCArrayDayDicsCfrK mutableCopy];
        [array replaceObjectAtIndex:3 withObject:[self getDayDicAfterDays:-3 fromDate:[_scrollView.KrfCArrayDayDicsCfrK[3] valueForKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])]]];
        _scrollView.KrfCArrayDayDicsCfrK = [array copy];
        
        [_scrollView setContentOffset:CGPointMake(scrollW * (_scrollView.KrfCArrayDayDicsCfrK.count - 2), 0)];
        _scrollView.znxbCurrentIndexbxnz = 3;
        
        array = [_scrollView.KrfCArrayDayDicsCfrK mutableCopy];
        for (int i = 0; i < _scrollView.KrfCArrayDayDicsCfrK.count; i++) {
            if (i == 3) {
                continue;
            }
            [array replaceObjectAtIndex:i withObject:[self getDayDicAfterDays:-3 fromDate:[_scrollView.KrfCArrayDayDicsCfrK[i] valueForKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])]]];
        }
        _scrollView.KrfCArrayDayDicsCfrK = [array copy];
    } else if (page == _scrollView.KrfCArrayDayDicsCfrK.count - 1) { //先改变page == 1的View，后设置offset，再改变其他page的View
        NSMutableArray *array = [_scrollView.KrfCArrayDayDicsCfrK mutableCopy];
        [array replaceObjectAtIndex:1 withObject:[self getDayDicAfterDays:3 fromDate:[_scrollView.KrfCArrayDayDicsCfrK[1] valueForKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])]]];
        _scrollView.KrfCArrayDayDicsCfrK = [array copy];
        
        [_scrollView setContentOffset:CGPointMake(scrollW, 0)];
        _scrollView.znxbCurrentIndexbxnz = 1;
        
        array = [_scrollView.KrfCArrayDayDicsCfrK mutableCopy];
        for (int i = 0; i < _scrollView.KrfCArrayDayDicsCfrK.count; i++) {
            if (i == 1) {
                continue;
            }
            [array replaceObjectAtIndex:i withObject:[self getDayDicAfterDays:3 fromDate:[_scrollView.KrfCArrayDayDicsCfrK[i] valueForKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])]]];
        }
        _scrollView.KrfCArrayDayDicsCfrK = [array copy];
    }
    [self updateArrayModelDayWithDicDate:_scrollView.KrfCArrayDayDicsCfrK[_scrollView.znxbCurrentIndexbxnz]];
    [_tableView reloadData];
}

#pragma mark - private method
- (NSDictionary *)getDayDicAfterDays:(int)days fromDate:(NSDate *)date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSArray *MONTH = [[self class] arrayMonth];
    NSArray *WEEKDAY = [[self class] arrayWeekDay];
    NSDateComponents *addingDateComponents = [[NSDateComponents alloc] init];
    [addingDateComponents setDay:days];
    date = [calendar dateByAddingComponents:addingDateComponents toDate:date options:0];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:date];
    NSDictionary *dicDay = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%ld年", components.year], ([NSString stringWithFormat:@"%@%@",@"yea",@"r"]), MONTH[components.month - 1], ([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"]), [NSString stringWithFormat:@"%ld", (long)components.day], ([NSString stringWithFormat:@"%@%@",@"d",@"ay"]), WEEKDAY[components.weekday - 1], ([NSString stringWithFormat:@"%@%@",@"wee",@"k"]), date, ([NSString stringWithFormat:@"%@%@",@"dat",@"e"]), nil];
    return dicDay;
}

- (NSString *)getTimeFromDate:(NSDate *)date {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date];
    NSString *time = [NSString stringWithFormat:@"%ld:%ld", components.hour, components.minute];
    return time;
}

- (void)keyboardDidShow:(NSNotification *)notification {
    //获取键盘高度
    NSValue *keyboardObject = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect;
    [keyboardObject getValue:&keyboardRect];
    // 取得键盘的动画时间，这样可以在视图上移的时候更连贯
    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [_disKeyboardButton setFrame:CGRectMake(mjoXDWScreenWidthXojm - ZZDisSwashUnbuttonWidth, keyboardRect.origin.y - fmCjDWDisKeyboardButtonHeightjCmf, ZZDisSwashUnbuttonWidth, fmCjDWDisKeyboardButtonHeightjCmf)];
    [self.view addSubview:_disKeyboardButton];
    //调整放置有textView的view的位置
    //设置动画
    [UIView beginAnimations:nil context:nil];
    //定义动画时间
    [UIView setAnimationDuration:duration];
    [UIView setAnimationDelay:0];
    //设置view的frame，往上平移
    [_typingView setFrame:CGRectMake(0, RHhQDWScreenHeightQhHR - keyboardRect.size.height - uCtODWDiaryTypingViewHeightOtCu + wfrgDWDiaryTypingToolBarHeightgrfw, mjoXDWScreenWidthXojm, uCtODWDiaryTypingViewHeightOtCu)];
    [_pickerView setFrame:CGRectMake(0, 0, mjoXDWScreenWidthXojm, ifEcDWDiaryTypingCalenderSmallHeightcEfi)];
    [_pickerView BYJhTransformToSmallMoodhJYB];
    if (_typingView.frame.origin.y < _pickerView.frame.size.height) {
        CGFloat dalta = _pickerView.frame.size.height - _typingView.frame.origin.y;
        _typingView.frame = CGRectMake(0, ifEcDWDiaryTypingCalenderSmallHeightcEfi, mjoXDWScreenWidthXojm, uCtODWDiaryTypingViewHeightOtCu - dalta);
        [_typingView LnKdUpdateFrameWithDaltadKnL:dalta];
        
    }
    [_navigationBar setFrame:CGRectMake(0, -ZZDaySailingStopPeak, mjoXDWScreenWidthXojm, ZZDaySailingStopPeak)];
    //提交动画
    [UIView commitAnimations];
}

- (void)keyboardDidHidden:(NSNotification *)notification {
    // 取得键盘的动画时间，这样可以在视图上移的时候更连贯
    double duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [_disKeyboardButton removeFromSuperview];
    //调整放置有textView的view的位置
    //设置动画
    [UIView beginAnimations:nil context:nil];
    //定义动画时间
    [UIView setAnimationDuration:duration];
    [UIView setAnimationDelay:0];
    //设置view的frame，往上平移
    [_typingView setFrame:CGRectMake(0, ZZDaySailingStopPeak + qGGLDWDiaryTypingCalendarHeightLGGq, mjoXDWScreenWidthXojm, uCtODWDiaryTypingViewHeightOtCu)];
    [_pickerView setFrame:CGRectMake(0, ZZDaySailingStopPeak, mjoXDWScreenWidthXojm, qGGLDWDiaryTypingCalendarHeightLGGq)];
    [_pickerView metamorphosePrintedAbnormalMode];
    [_navigationBar setFrame:CGRectMake(0, 0, mjoXDWScreenWidthXojm, ZZDaySailingStopPeak)];
    //提交动画
    [UIView commitAnimations];
}

- (void)updateTableViewDataSourceFromDataBase {
    dispatch_async(dispatch_get_main_queue(), ^{
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:([NSString stringWithFormat:@"%@%@%@%@%@%@",@"D",@"i",@"ary",@"Mo",@"de",@"l"])];
        NSError *error;
        NSArray *objects = [context executeFetchRequest:request
                                                  error:&error];
        NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
        if (objects == nil) {
        }
        if (objects.count > 0) {
            [tmpArray removeAllObjects];
        }
        for (int i = 0; i < objects.count; i++) {
            [tmpArray addObject:[objects objectAtIndex:i]];
        }
        // sort
        NSComparator comparator = ^(id obj1, id obj2) {
            if ([[obj1 valueForKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])] compare:[obj2 valueForKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])]] == NSOrderedDescending) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            if ([[obj1 valueForKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])] compare:[obj2 valueForKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])]] == NSOrderedAscending) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            return (NSComparisonResult)NSOrderedSame;
        };
        _arrayModel = [[tmpArray sortedArrayUsingComparator:comparator] mutableCopy];
        
        [_tableView reloadData];
    });
}

- (void) updateArrayModelDayWithDicDate:(NSDictionary *)dicDate {
    [_arrayModelDay removeAllObjects];
    for (id model in _arrayModel) {
        if ([[model valueForKey:([NSString stringWithFormat:@"%@%@",@"yea",@"r"])] isEqualToString:dicDate[([NSString stringWithFormat:@"%@%@",@"yea",@"r"])]] && [[model valueForKey:([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"])] isEqualToString:dicDate[([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"])]] && [[model valueForKey:([NSString stringWithFormat:@"%@%@",@"d",@"ay"])] isEqualToString:dicDate[([NSString stringWithFormat:@"%@%@",@"d",@"ay"])]]) {
            [_arrayModelDay addObject:model];
        }
    }
}

- (void)updateTypingViewContentFromDataBaseWithDicDate:(NSDictionary *)dicDate {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *year = dicDate[([NSString stringWithFormat:@"%@%@",@"yea",@"r"])];
        NSString *month = dicDate[([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"])];
        NSString *day = dicDate[([NSString stringWithFormat:@"%@%@",@"d",@"ay"])];
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:([NSString stringWithFormat:@"%@%@%@%@%@%@",@"D",@"i",@"ary",@"Mo",@"de",@"l"])];
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K = %@ && %K = %@ && %K = %@", ([NSString stringWithFormat:@"%@%@",@"yea",@"r"]), year, ([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"]), month, ([NSString stringWithFormat:@"%@%@",@"d",@"ay"]), day];
        [request setPredicate:pred];
        NSError *error;
        NSArray *objects = [context executeFetchRequest:request
                                                  error:&error];
        if (objects == nil) {
        }
        if (objects.count == 0) {
            _typingView.title = @"";
            _typingView.detail = @"";
            _typingView.emotion = ([NSString stringWithFormat:@"%@%@",@"ha",@"ppy"]);
            _typingView.weather = ([NSString stringWithFormat:@"%@%@%@",@"su",@"nn",@"y"]);
        }
        
        for (int i = 0; i < objects.count; i++) {
            _typingView.title = [[objects objectAtIndex:i] valueForKey:([NSString stringWithFormat:@"%@%@",@"tit",@"le"])];
            _typingView.detail = [[objects objectAtIndex:i] valueForKey:([NSString stringWithFormat:@"%@%@",@"detai",@"l"])];
            _typingView.emotion = [[objects objectAtIndex:i] valueForKey:([NSString stringWithFormat:@"%@%@",@"emot",@"ion"])];
            _typingView.weather = [[objects objectAtIndex:i] valueForKey:([NSString stringWithFormat:@"%@%@",@"weathe",@"r"])];
        }
    });
}

- (void)saveModelIntoDataBaseWithTitle:(NSString *)title detail:(NSString *)detail emotion:(NSString *)emotion weather:(NSString *)weather dicDate:(NSDictionary *)dicDate {
    dispatch_group_t dispatchGroup = dispatch_group_create();
    dispatch_group_async(dispatchGroup, dispatch_get_main_queue(), ^{
        NSString *year = dicDate[([NSString stringWithFormat:@"%@%@",@"yea",@"r"])];
        NSString *month = dicDate[([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"])];
        NSString *day = dicDate[([NSString stringWithFormat:@"%@%@",@"d",@"ay"])];
        NSString *week = dicDate[([NSString stringWithFormat:@"%@%@",@"wee",@"k"])];
        
        NSArray *FORMAT_NUMBER = [[self class] arrayFormatNumber];
        NSDate *currentDate = [NSDate date];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *components = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:currentDate];
        NSString *timeString = [NSString stringWithFormat:@"%@:%@:%@", (components.hour < 10 ? FORMAT_NUMBER[components.hour] : [NSString stringWithFormat:@"%ld", components.hour]), (components.minute < 10 ? FORMAT_NUMBER[components.minute] : [NSString stringWithFormat:@"%ld", components.minute]), (components.second < 10 ? FORMAT_NUMBER[components.second] : [NSString stringWithFormat:@"%ld", components.second])];
        NSString *yearString = [year stringByReplacingOccurrencesOfString:@"年" withString:@""];
        NSString *monthString = [((NSString *)[month stringByReplacingOccurrencesOfString:@"月" withString:@""]) integerValue] < 10 ? FORMAT_NUMBER[[((NSString *)[month stringByReplacingOccurrencesOfString:@"月" withString:@""]) integerValue]] : [month stringByReplacingOccurrencesOfString:@"月" withString:@""];
        NSString *dayString = [day integerValue] < 10 ? FORMAT_NUMBER[[day integerValue]] : day;
        NSString *dateString = [NSString stringWithFormat:@"%@-%@-%@ %@", yearString, monthString, dayString, timeString];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:([NSString stringWithFormat:@"%@%@%@%@%@%@",@"yyyy-MM",@"-dd",@" HH:m",@"m:",@"s",@"s"])];
        NSDate *date = [formatter dateFromString:dateString];
        
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        NSManagedObjectContext *context = [delegate managedObjectContext];
        NSError *error;
        
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:([NSString stringWithFormat:@"%@%@%@%@%@%@",@"D",@"i",@"ary",@"Mo",@"de",@"l"])];
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K = %@ && %K = %@ && %K = %@", ([NSString stringWithFormat:@"%@%@",@"yea",@"r"]), year, ([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"]), month, ([NSString stringWithFormat:@"%@%@",@"d",@"ay"]), day];
        [request setPredicate:pred];
        
        NSArray *objects = [context executeFetchRequest:request error:&error];
        
        NSManagedObject *theDiary = nil;
        if ([objects count] > 0) {
            theDiary = [objects objectAtIndex:0];
        } else {
            theDiary = [NSEntityDescription insertNewObjectForEntityForName:([NSString stringWithFormat:@"%@%@%@%@%@%@",@"D",@"i",@"ary",@"Mo",@"de",@"l"])
                                                     inManagedObjectContext:context];
        }
        
        [theDiary setValue:title forKey:([NSString stringWithFormat:@"%@%@",@"tit",@"le"])];
        [theDiary setValue:detail forKey:([NSString stringWithFormat:@"%@%@",@"detai",@"l"])];
        [theDiary setValue:date forKey:([NSString stringWithFormat:@"%@%@",@"dat",@"e"])];
        [theDiary setValue:year forKey:([NSString stringWithFormat:@"%@%@",@"yea",@"r"])];
        [theDiary setValue:month forKey:([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"])];
        [theDiary setValue:day forKey:([NSString stringWithFormat:@"%@%@",@"d",@"ay"])];
        [theDiary setValue:week forKey:([NSString stringWithFormat:@"%@%@",@"wee",@"k"])];
        [theDiary setValue:emotion forKey:([NSString stringWithFormat:@"%@%@",@"emot",@"ion"])];
        [theDiary setValue:weather forKey:([NSString stringWithFormat:@"%@%@",@"weathe",@"r"])];
        
        [delegate saveContext];
    });
    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^{
        [self updateTableViewDataSourceFromDataBase];
    });
}

- (void)deleteDiaryModelInDateBaseWithDicDate:(NSDictionary *)dicDate {
    NSString *year = dicDate[([NSString stringWithFormat:@"%@%@",@"yea",@"r"])];
    NSString *month = dicDate[([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"])];
    NSString *day = dicDate[([NSString stringWithFormat:@"%@%@",@"d",@"ay"])];
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSError *error;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:([NSString stringWithFormat:@"%@%@%@%@%@%@",@"D",@"i",@"ary",@"Mo",@"de",@"l"])];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K = %@ && %K = %@ && %K = %@", ([NSString stringWithFormat:@"%@%@",@"yea",@"r"]), year, ([NSString stringWithFormat:@"%@%@%@",@"mon",@"t",@"h"]), month, ([NSString stringWithFormat:@"%@%@",@"d",@"ay"]), day];
    [request setPredicate:pred];
    
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    NSManagedObject *theDiary = nil;
    if ([objects count] > 0) {
        theDiary = [objects objectAtIndex:0];
    }
    [context deleteObject:theDiary];
    [delegate saveContext];
}

- (void)dismissKeyboardTap {
    [_typingView endEditing:YES];
}

#pragma mark - handle tap gesture
- (void)buttonSettingTap {
    XbFSDWSettingViewControllerSFbX *controller = [[XbFSDWSettingViewControllerSFbX alloc] init];
    controller.delegate = self;
    [self.navigationController presentViewController:controller animated:YES completion:nil];
}

#pragma mark - DWDiaryTypingCalendarDelegate
- (void)leftButtonPressed {
    _pickerView.dicDate = [self getDayDicAfterDays:-1 fromDate:_pickerView.dicDate[([NSString stringWithFormat:@"%@%@",@"dat",@"e"])]];
    [self updateTypingViewContentFromDataBaseWithDicDate:_pickerView.dicDate];
}

- (void)rightButtonPressed {
    _pickerView.dicDate = [self getDayDicAfterDays:1 fromDate:_pickerView.dicDate[([NSString stringWithFormat:@"%@%@",@"dat",@"e"])]];
    [self updateTypingViewContentFromDataBaseWithDicDate:_pickerView.dicDate];
}

#pragma mark - DWDiaryTypingDelegate
- (void)saveModelWithTitle:(NSString *)title detail:(NSString *)detail emotion:(NSString *)emotion weather:(NSString *)weather {
    [self saveModelIntoDataBaseWithTitle:title detail:detail emotion:emotion weather:weather dicDate:_pickerView.dicDate];
}

#pragma mark - DWDiaryContentViewDelegate
- (void)openTypingViewWithDicDate:(NSDictionary *)dicDate {
    _pickerView.dicDate = dicDate;
    [_segment setSelectedSegmentIndex:2];
    [self didChangeValueOfSegmentControl:_segment];
    [self updateTypingViewContentFromDataBaseWithDicDate:dicDate];
}

- (void)deleteDiaryWithDicDate:(NSDictionary *)dicDate {
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [self deleteDiaryModelInDateBaseWithDicDate:dicDate];
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self updateTableViewDataSourceFromDataBase];
        if (_controllerMode == CONTROLLER_MODE_CALENDAR) {
            [self updateArrayModelDayWithDicDate:_scrollView.KrfCArrayDayDicsCfrK[_scrollView.znxbCurrentIndexbxnz]];
        }
    });
}

- (void)updateContentViewWithOffset:(NSInteger)offset {
    if (_contentView) {
        if (_currentIndexPath.row + offset >= 0 && _currentIndexPath.row + offset < _arrayModel.count) {
            _currentIndexPath = [NSIndexPath indexPathForRow:_currentIndexPath.row + offset inSection:0];
            JiCBDWDiaryTableViewCellBCiJ *cell = [_tableView cellForRowAtIndexPath:_currentIndexPath];
            _contentView.dicDate = cell.dicDate;
            _contentView.detail = cell.detail;
        }
    }
}

#pragma mark - DWSettingViewControllerDelegate
- (void)dismissViewController {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
