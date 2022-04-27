//
//  ZZCalculatorViewController.m
//  ZZMemorialDay
//
//  Created by mac on 2022/4/27.
//

#import "ZZCalculatorViewController.h"
#import <SDWebImage/SDWebImage.h>
#import <BRPickerView.h>
#import "NSString+extention.h"
#import "QTDateCalculationHelper.h"

@interface ZZCalculatorViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *bgimageV;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel1;
@property (weak, nonatomic) IBOutlet UITextField *textF1;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel2;
@property (weak, nonatomic) IBOutlet UITextField *textF2;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel3;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel4;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel2;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel3;

@property (nonatomic,strong) NSString *timerStr1;
@property (nonatomic,strong) NSString *timerStr2;
@property (nonatomic,strong) NSString *timerStr3;
@property (nonatomic,strong) NSString *timerStr4;

@end

@implementation ZZCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _textF1.delegate = self;
    _textF2.delegate = self;
    _textF1.keyboardType = UIKeyboardTypeNumberPad;
    _textF2.keyboardType = UIKeyboardTypeNumberPad;
    
    [self setBGimage];
    
    self.bgimageV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenTF)];
    [self.bgimageV addGestureRecognizer:tag];
    self.timeLabel1.text = [NSString timeNowDate];
    self.timeLabel2.text = [NSString timeNowDate];
    self.timeLabel3.text = [NSString timeNowDate];
    self.timeLabel4.text = [NSString timeNowDate];

    self.timerStr1 = [NSString timeNowDate];
    self.timerStr2 = [NSString timeNowDate];
    self.timerStr3 = [NSString timeNowDate];
    self.timerStr4 = [NSString timeNowDate];

}
-(void)setBGimage{
    self.bgimageV.image = [UIImage imageNamed:@"bgImage"];
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"LocImage"];
    if ([str isEqualToString:@"1"]) {
        UIImage *getimage2 = [[SDImageCache sharedImageCache] imageFromCacheForKey:@"/Documents/pic.png"];
        _bgimageV.image = getimage2;
    }
}
- (IBAction)timeAction:(id)sender {
    
    BRDatePickerView *datePickerView = [[BRDatePickerView alloc]init];
    datePickerView.pickerMode = BRDatePickerModeYMD;
    datePickerView.title = @"选择日期";
    datePickerView.selectDate = [NSDate date];
    

    datePickerView.selectDate = [NSDate dateWithTimeIntervalSinceNow:0];
    datePickerView.isAutoSelect = NO;
    __weak typeof(self) weakself = self;
    datePickerView.resultBlock = ^(NSDate *selectDate, NSString *selectValue) {
        weakself.timerStr1 = selectValue;
        weakself.timeLabel1.text = selectValue;
        if (weakself.textF1.text.length>0) {
            NSString* format = @"yyyy-MM-dd";

            weakself.resultLabel.text = [QTDateCalculationHelper getTimeWithTimeString1:selectValue year:0 month:0 day:[weakself.textF1.text intValue] format:format];
        }

    };
    BRPickerStyle *customStyle = [[BRPickerStyle alloc]init];
    customStyle.pickerColor = [UIColor whiteColor];
    
    customStyle.topCornerRadius = 4;
    datePickerView.pickerStyle = customStyle;
    
    [datePickerView show];
}
- (IBAction)timeAction3:(id)sender {
    BRDatePickerView *datePickerView = [[BRDatePickerView alloc]init];
    datePickerView.pickerMode = BRDatePickerModeYMD;
    datePickerView.title = @"选择日期";
    datePickerView.selectDate = [NSDate date];
    

    datePickerView.selectDate = [NSDate dateWithTimeIntervalSinceNow:0];
    datePickerView.isAutoSelect = NO;
    __weak typeof(self) weakself = self;
    datePickerView.resultBlock = ^(NSDate *selectDate, NSString *selectValue) {
        weakself.timerStr3 = selectValue;
        weakself.timeLabel3.text = selectValue;

        NSString* format = @"yyyy-MM-dd";

        weakself.resultLabel3.text = [NSString stringWithFormat:@"%ld天",(long)[QTDateCalculationHelper getDaysAfterTime:weakself.timeLabel3.text beforeTime:weakself.timerStr4 format:format]];

    };
    BRPickerStyle *customStyle = [[BRPickerStyle alloc]init];
    customStyle.pickerColor = [UIColor whiteColor];
    
    customStyle.topCornerRadius = 4;
    datePickerView.pickerStyle = customStyle;
    
    [datePickerView show];
}
- (IBAction)timeAction4:(id)sender {
    BRDatePickerView *datePickerView = [[BRDatePickerView alloc]init];
    datePickerView.pickerMode = BRDatePickerModeYMD;
    datePickerView.title = @"选择日期";
    datePickerView.selectDate = [NSDate date];
    

    datePickerView.selectDate = [NSDate dateWithTimeIntervalSinceNow:0];
    datePickerView.isAutoSelect = NO;
    __weak typeof(self) weakself = self;
    datePickerView.resultBlock = ^(NSDate *selectDate, NSString *selectValue) {
        weakself.timerStr4 = selectValue;
        weakself.timeLabel4.text = selectValue;

        NSString* format = @"yyyy-MM-dd";

        weakself.resultLabel3.text = [NSString stringWithFormat:@"%ld天",(long)[QTDateCalculationHelper getDaysAfterTime:weakself.timeLabel3.text beforeTime:weakself.timerStr4 format:format]];

    };
    BRPickerStyle *customStyle = [[BRPickerStyle alloc]init];
    customStyle.pickerColor = [UIColor whiteColor];
    
    customStyle.topCornerRadius = 4;
    datePickerView.pickerStyle = customStyle;
    
    [datePickerView show];
}
- (IBAction)timeAction2:(id)sender {
    BRDatePickerView *datePickerView = [[BRDatePickerView alloc]init];
    datePickerView.pickerMode = BRDatePickerModeYMD;
    datePickerView.title = @"选择日期";
    datePickerView.selectDate = [NSDate date];
    

    datePickerView.selectDate = [NSDate dateWithTimeIntervalSinceNow:0];
    datePickerView.isAutoSelect = NO;
    __weak typeof(self) weakself = self;
    datePickerView.resultBlock = ^(NSDate *selectDate, NSString *selectValue) {
        weakself.timerStr2 = selectValue;
        weakself.timeLabel2.text = selectValue;
        if (weakself.textF2.text.length>0) {
            NSString* format = @"yyyy-MM-dd";

            weakself.resultLabel.text = [QTDateCalculationHelper getTimeWithTimeString:selectValue year:0 month:0 day:[weakself.textF2.text intValue] format:format];
        }

    };
    BRPickerStyle *customStyle = [[BRPickerStyle alloc]init];
    customStyle.pickerColor = [UIColor whiteColor];
    
    customStyle.topCornerRadius = 4;
    datePickerView.pickerStyle = customStyle;
    
    [datePickerView show];
}
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)hiddenTF{
    [_textF1 resignFirstResponder];
    [_textF2 resignFirstResponder];
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.text.length==0) {
        return;
    }
    if (textField ==_textF1) {
        NSString* format = @"yyyy-MM-dd";

        self.resultLabel.text = [QTDateCalculationHelper getTimeWithTimeString1:self.timerStr1 year:0 month:0 day:[self.textF1.text intValue] format:format];
    }
    if (textField ==_textF2) {
        NSString* format = @"yyyy-MM-dd";

        self.resultLabel2.text = [QTDateCalculationHelper getTimeWithTimeString:self.timerStr2 year:0 month:0 day:[self.textF2.text intValue] format:format];
    }
}

@end
