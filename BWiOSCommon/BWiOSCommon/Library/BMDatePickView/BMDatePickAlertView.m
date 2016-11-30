//
//  BMDatePickAlertView.m
//  LDTour
//
//  Created by Daredos on 16/6/17.
//  Copyright © 2016年 Daredos. All rights reserved.
//

#import "BMDatePickAlertView.h"
#import "BMDateSettingView.h"

@interface NSDate (BMDatePickViewTool)

@property (assign, nonatomic, readonly) NSInteger year;
@property (assign, nonatomic, readonly) NSInteger month;
@property (assign, nonatomic, readonly) NSInteger day;
@property (assign, nonatomic, readonly) NSInteger hour;
@property (assign, nonatomic, readonly) NSInteger minute;
@property (assign, nonatomic, readonly) NSInteger second;
@property (strong, nonatomic, readonly) NSDateComponents   *dateComponents;
+ (NSDate *)dateWithYear:(NSInteger)year mon:(NSInteger)mon day:(NSInteger)day h:(NSInteger)h m:(NSInteger)m s:(NSInteger)s;

@end

@implementation NSDate (BMDatePickViewTool)

- (NSInteger)year   {
    
    return self.dateComponents.year;
}

- (NSInteger)month  {
    
    return self.dateComponents.month;
    
}
- (NSInteger)day    {
    
    return self.dateComponents.day;
}

- (NSInteger)hour   {
    
    return self.dateComponents.hour;
}

- (NSInteger)minute {
    
    return self.dateComponents.minute;
}

- (NSInteger)second {
    
    return self.dateComponents.second;
}

- (NSDateComponents *)dateComponents {
    
    NSCalendar *calendar0 = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    comps = [calendar0 components:unitFlags fromDate:self];
    return comps;
}

+ (NSDate *)dateWithYear:(NSInteger)year mon:(NSInteger)mon day:(NSInteger)day h:(NSInteger)h m:(NSInteger)m s:(NSInteger)s {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *str = [NSString stringWithFormat:@"%.4ld-%.2ld-%.2ld--%.2ld:%.2ld:%.2ld",year,mon,day,h,m,s];
    [dateFormatter setDateFormat:@"yyyy-MM-dd--HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:str];
    if (date) {
        return date;
    }
    return [NSDate date];
}

@end

#define __sc_w__        [UIScreen mainScreen].bounds.size.width
#define __sc_h__        [UIScreen mainScreen].bounds.size.height
#define __height__      216.0f
#define __start_year__  2010

@interface BMDatePickAlertView () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) UIPickerView       *pickerView;
@property (assign, nonatomic) BMDatePickViewMode pickerMode;
@property (assign, nonatomic) NSInteger yearRang;
@property (strong, nonatomic) NSDate *pickDate;

@property (strong, nonatomic) NSDate *minimumPickDate;
@property (strong, nonatomic) NSDate *maximumPickDate;

@property (strong, nonatomic) UIDatePicker      *datePicker;
@property (strong, nonatomic) BMDateSettingView *dateSettingView;
@property (copy, nonatomic) ChangeBlock         changeBlock;
@property (copy, nonatomic) ConfirmBlock        confirmBlock;

@end

@implementation BMDatePickAlertView

#pragma mark -
#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackgroundClickDiss)]];
    }
    return self;
}

#pragma mark - getters setters

- (BMDateSettingView *)dateSettingView {
    
    if (!_dateSettingView) {
        _dateSettingView = [BMDateSettingView BMDateSettingViewWithFrame:CGRectMake(0, __sc_h__-__height__-40, __sc_w__, 40) confirmBlock:^{
            self.confirmBlock ? self.confirmBlock(self, self.datePicker.date) : nil;
        } cancelBlock:^{
            self.cancelBlock ? self.cancelBlock() : nil;
            [self tapBackgroundClick];
        }];
    }
    return _dateSettingView;
}

- (void)setDate:(NSDate *)date {
    
    self.datePicker.date = date;
}

- (NSDate *)date {
    
    return self.datePicker.date;
}

- (UIPickerView *)pickerView {
    
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, __sc_h__-__height__, __sc_w__, __height__)];
        _pickerView.delegate   = self;
        _pickerView.dataSource = self;
        _pickerView.backgroundColor = [UIColor whiteColor];
    }
    return _pickerView;
}

- (void)setPickDate:(NSDate *)pickDate {
    
    pickDate = pickDate ? pickDate : [NSDate date];
    
    _pickDate = pickDate;
    
    NSInteger year = pickDate.year - __start_year__ < 0 ? 0 : pickDate.year - __start_year__ - 1;
    
    switch (self.pickerMode) {
        case 0:
        {
            [self.pickerView selectRow:year             inComponent:0 animated:YES];
        }
            break;
        case 1:
        {
            [self.pickerView selectRow:year             inComponent:0 animated:YES];
            [self.pickerView selectRow:pickDate.month-1 inComponent:1 animated:YES];
        }
            break;
        case 2:
        {
            [self.pickerView selectRow:year             inComponent:0 animated:YES];
            [self.pickerView selectRow:pickDate.month-1 inComponent:1 animated:YES];
            [self.pickerView selectRow:pickDate.day-1   inComponent:2 animated:YES];
        }
            break;
        case 3:
        {
            [self.pickerView selectRow:year             inComponent:0 animated:YES];
            [self.pickerView selectRow:pickDate.month-1 inComponent:1 animated:YES];
            [self.pickerView selectRow:pickDate.day-1   inComponent:2 animated:YES];
            [self.pickerView selectRow:pickDate.hour    inComponent:3 animated:YES];
        }
            break;
        case 4:
        {
            [self.pickerView selectRow:year             inComponent:0 animated:YES];
            [self.pickerView selectRow:pickDate.month-1 inComponent:1 animated:YES];
            [self.pickerView selectRow:pickDate.day-1   inComponent:2 animated:YES];
            [self.pickerView selectRow:pickDate.hour    inComponent:3 animated:YES];
            [self.pickerView selectRow:pickDate.minute  inComponent:4 animated:YES];
        }
            break;
        case 5:
        {
            [self.pickerView selectRow:year             inComponent:0 animated:YES];
            [self.pickerView selectRow:pickDate.month-1 inComponent:1 animated:YES];
            [self.pickerView selectRow:pickDate.day-1   inComponent:2 animated:YES];
            [self.pickerView selectRow:pickDate.hour    inComponent:3 animated:YES];
            [self.pickerView selectRow:pickDate.minute  inComponent:4 animated:YES];
            [self.pickerView selectRow:pickDate.second  inComponent:5 animated:YES];
        }
            break;
        default:
            break;
    }
}

- (NSInteger)yearRang {
    if (_yearRang == 0) {
        _yearRang = 2050 - __start_year__;
    }
    return _yearRang;
}

- (UIDatePicker *)datePicker {
    
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, __sc_h__-__height__, __sc_w__, __height__)];
        _datePicker.backgroundColor = [UIColor whiteColor];
    }
    return _datePicker;
}

#pragma mark - 系统delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    switch (self.pickerMode) {
        case BMDatePickViewModeYear:
            return 1;
            break;
        case BMDatePickViewModeYearMonth:
            return 2;
            break;
        case BMDatePickViewModeYearMonthDay:
            return 3;
            break;
        case BMDatePickViewModeYearMonthDayHour:
            return 4;
            break;
        case BMDatePickViewModeYearMonthDayHourMinute:
            return 5;
            break;
        case BMDatePickViewModeYearMonthDayHourMinuteSecond:
            return 6;
            break;
        default:
            break;
    }
    return 0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    switch (component) {
        case 0:
            return self.yearRang;
            break;
        case 1:
            return 12;
            break;
        case 2:
        {
            NSInteger year = [pickerView selectedRowInComponent:0];
            NSInteger m = [pickerView selectedRowInComponent:1];
            if (m == 1) {
                return ((year%4==0)&&(year%100!=0))||(year%400==0) ? 29 : 28;
                break;
            }else if (   m ==  1-1
                      || m ==  3-1
                      || m ==  5-1
                      || m ==  7-1
                      || m ==  8-1
                      || m == 10-1
                      || m == 12-1) {
                return 31; // 日
            }
        }
            return 30; // 日
            break;
        case 3:
            return 24;
            break;
        case 4:
            return 60;
            break;
        case 5:
            return 60;
            break;
        default:
            break;
    }
    return 0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    
    NSInteger r = row;
    if (component  < 3) {
        r += 1;
    }
    
    NSMutableString *string = [NSMutableString stringWithFormat:@"%ld",r];
    
    if (component == 0) {
        
        string = [NSMutableString stringWithFormat:@"%ld",r + __start_year__];
    }
    
    if (component > 2) {
        
        string = [NSMutableString stringWithFormat:@"%.2ld",r];
    }
    CGFloat w = (self.pickerMode+1)*1.0;
    UILabel*label    = [[UILabel alloc]initWithFrame:CGRectMake(component*(__sc_w__/w), 0,__sc_w__/w, 30)];
    label.font       = [UIFont systemFontOfSize:13.0];
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = 1;
    switch (component) {
        case 0:
            [string appendString:@" 年"];
            break;
        case 1:
            [string appendString:@" 月"];
            break;
        case 2:
            [string appendString:@" 日"];
            break;
        case 3:
            [string appendString:@" 时"];
            break;
        case 4:
            [string appendString:@" 分"];
            break;
        case 5:
            [string appendString:@" 秒"];
            break;
        default:
            break;
    }
    label.text          = string;
    return label;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    // if 只有年 或者 年月 就不需要对 天数做特殊处理
    if (self.pickerMode == BMDatePickViewModeYear || self.pickerMode == BMDatePickViewModeYearMonth) {
        
        if ([self getDateReturn]) {
            if (_changeBlock) {
                [self changeButtonClick];
            }
        }
        return;
    }
    
    if ((component == 1)
        || (component == 0
            && [pickerView selectedRowInComponent:1] == 1)) {
            [pickerView reloadComponent:2];
        }
    
    if ([self getDateReturn]) {
        if (_changeBlock) {
            [self changeButtonClick];
        }
    }
}

#pragma mark - 自定义delegate
#pragma mark - 公有方法
/*!
 *  @brief 创建系统自带的有确定按钮的时间选择弹窗
 */
+ (instancetype)datePickViewWithConfirmForPickerMode:(UIDatePickerMode)pickerMode date:(NSDate *)date minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate confirmBlock:(ConfirmBlock)confirmBlock {
    
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    BMDatePickAlertView *datePickView = [[BMDatePickAlertView alloc] initWithFrame:win.bounds];
    datePickView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    datePickView.confirmBlock = confirmBlock;
    [datePickView addSubview:datePickView.datePicker];
    [datePickView addSubview:datePickView.dateSettingView];
    datePickView.datePicker.minimumDate     = minimumDate;
    datePickView.datePicker.maximumDate     = maximumDate;
    datePickView.datePicker.datePickerMode  = pickerMode;
    datePickView.alpha = 0.0f;
    [UIView animateWithDuration:0.3 animations:^{
        datePickView.alpha = 1.0f;
    }];
    return datePickView;
}

/*!
 *  @brief 创建自定义的有确定按钮的时间选择弹窗
 */
+ (instancetype)datePickViewWithCustomConfirmForPickerMode:(BMDatePickViewMode)pickerMode date:(NSDate *)date minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate confirmBlock:(ConfirmBlock)confirmBlock {
    
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    BMDatePickAlertView *datePickView = [[BMDatePickAlertView alloc] initWithFrame:win.bounds];
    datePickView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    datePickView.confirmBlock = confirmBlock;
    [datePickView addSubview:datePickView.pickerView];
    
    [datePickView addSubview:[BMDateSettingView BMDateSettingViewWithFrame:CGRectMake(0, __sc_h__-__height__-40, __sc_w__, 40) confirmBlock:^{
        if (datePickView.confirmBlock) {
            [datePickView conButtonClick];
        }
    } cancelBlock:^{
        datePickView.cancelBlock ? datePickView.cancelBlock() : nil;
        [datePickView tapBackgroundClick];
    }]];
    
    datePickView.maximumPickDate = maximumDate;
    datePickView.minimumPickDate = minimumDate;
    datePickView.pickerMode = pickerMode;
    datePickView.pickDate = date;
    datePickView.alpha = 0.0f;
    [UIView animateWithDuration:0.3 animations:^{
        datePickView.alpha = 1.0f;
    }];
    return datePickView;
}

/*!
 *  @brief 创建系统自带的实时交互时间选择弹窗
 */
+ (instancetype)datePickViewWithChangeForPickerMode:(UIDatePickerMode)pickerMode date:(NSDate *)date minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate changeBlock:(ChangeBlock)changeBlock {
    
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    BMDatePickAlertView *datePickView = [[BMDatePickAlertView alloc] initWithFrame:win.bounds];
    datePickView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    datePickView.changeBlock = changeBlock;
    [datePickView addSubview:datePickView.datePicker];
    datePickView.alpha = 0.0f;
    
    [UIView animateWithDuration:0.3 animations:^{
        datePickView.alpha = 1.0f;
    }];
    datePickView.datePicker.minimumDate     = minimumDate;
    datePickView.datePicker.maximumDate     = maximumDate;
    datePickView.datePicker.datePickerMode  = pickerMode;
    changeBlock ? changeBlock(datePickView, date ? date : [NSDate date]) : nil;
    [datePickView.datePicker addTarget:datePickView action:@selector(datePickChanged) forControlEvents:UIControlEventValueChanged];
    return datePickView;
}

/*!
 *  @brief 创建自定义的实时交互时间选择弹窗
 */
+ (instancetype)datePickViewWirhCustomChangeForPickerMode:(BMDatePickViewMode)pickerMode date:(NSDate *)date minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate changeBlock:(ChangeBlock)changeBlock {
    
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    BMDatePickAlertView *datePickView = [[BMDatePickAlertView alloc] initWithFrame:win.bounds];
    datePickView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    datePickView.changeBlock = changeBlock;
    [datePickView addSubview:datePickView.pickerView];
    datePickView.maximumPickDate = maximumDate;
    datePickView.minimumPickDate = minimumDate;
    datePickView.pickerMode = pickerMode;
    datePickView.pickDate = date;
    datePickView.alpha = 0.0f;
    [UIView animateWithDuration:0.3 animations:^{
        datePickView.alpha = 1.0f;
    }];
    changeBlock ? changeBlock(datePickView, date ? date : [NSDate date]) : nil;
    return datePickView;
}

- (void)show {
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
}

- (void)diss {
    [self tapBackgroundClick];
}
#pragma mark - 私有方法

- (void)datePickChanged {
    
    self.changeBlock ? self.changeBlock(self, self.datePicker.date) : nil;
}

#pragma mark - 事件响应

- (void)tapBackgroundClick {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)tapBackgroundClickDiss {
    
    self.cancelBlock ? self.cancelBlock() : nil;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}



- (void)conButtonClick {
    
    // 获取显示的时间信息
    NSInteger year = 1;
    NSInteger mon  = 1;
    NSInteger day  = 1;
    NSInteger h    = 0;
    NSInteger m    = 0;
    NSInteger s    = 0;
    switch (self.pickerMode) {
            
        case BMDatePickViewModeYearMonthDayHourMinuteSecond:
        {
            s =  [_pickerView selectedRowInComponent:5];
        }
        case BMDatePickViewModeYearMonthDayHourMinute:
        {
            m =  [_pickerView selectedRowInComponent:4];
        }
        case BMDatePickViewModeYearMonthDayHour:
        {
            h =  [_pickerView selectedRowInComponent:3];
        }
        case BMDatePickViewModeYearMonthDay:
        {
            day  = [_pickerView selectedRowInComponent:2] + 1;
        }
        case BMDatePickViewModeYearMonth:
        {
            mon  = [_pickerView selectedRowInComponent:1] + 1;
        }
        case BMDatePickViewModeYear:
        {
            year = [_pickerView selectedRowInComponent:0] + __start_year__ + 1;
        }
        default:
            break;
    }
    // 时间判断
    NSDate *date = [NSDate dateWithYear:year mon:mon day:day h:h m:m s:s];
    
    if (self.confirmBlock) {
        self.confirmBlock(self, date);
    }
}

- (void)changeButtonClick {
    
    // 获取显示的时间信息
    NSInteger year = 1;
    NSInteger mon  = 1;
    NSInteger day  = 1;
    NSInteger h    = 0;
    NSInteger m    = 0;
    NSInteger s    = 0;
    
    switch (self.pickerMode) {
            
        case BMDatePickViewModeYearMonthDayHourMinuteSecond:
        {
            s =  [_pickerView selectedRowInComponent:5];
        }
        case BMDatePickViewModeYearMonthDayHourMinute:
        {
            m =  [_pickerView selectedRowInComponent:4];
        }
        case BMDatePickViewModeYearMonthDayHour:
        {
            h =  [_pickerView selectedRowInComponent:3];
        }
        case BMDatePickViewModeYearMonthDay:
        {
            day  = [_pickerView selectedRowInComponent:2] + 1;
        }
        case BMDatePickViewModeYearMonth:
        {
            mon  = [_pickerView selectedRowInComponent:1] + 1;
        }
        case BMDatePickViewModeYear:
        {
            year = [_pickerView selectedRowInComponent:0] + __start_year__ + 1;
        }
        default:
            break;
    }
    // 时间判断
    NSDate *date = [NSDate dateWithYear:year mon:mon day:day h:h m:m s:s];
    
    if (self.changeBlock) {
        self.changeBlock(self, date);
    }
}

- (NSDate *)getCurrDate {
    
    // 获取显示的时间信息
    NSInteger year = 1;
    NSInteger mon  = 1;
    NSInteger day  = 1;
    NSInteger h    = 0;
    NSInteger m    = 0;
    NSInteger s    = 0;
    
    switch (self.pickerMode) {
            
        case BMDatePickViewModeYearMonthDayHourMinuteSecond:
        {
            s =  [_pickerView selectedRowInComponent:5];
        }
        case BMDatePickViewModeYearMonthDayHourMinute:
        {
            m =  [_pickerView selectedRowInComponent:4];
        }
        case BMDatePickViewModeYearMonthDayHour:
        {
            h =  [_pickerView selectedRowInComponent:3];
        }
        case BMDatePickViewModeYearMonthDay:
        {
            day  = [_pickerView selectedRowInComponent:2] + 1;
        }
        case BMDatePickViewModeYearMonth:
        {
            mon  = [_pickerView selectedRowInComponent:1] + 1;
        }
        case BMDatePickViewModeYear:
        {
            year = [_pickerView selectedRowInComponent:0] + __start_year__ + 1;
        }
        default:
            break;
    }
    // 时间判断
    NSDate *date = [NSDate dateWithYear:year mon:mon day:day h:h m:m s:s];
    return date;
}

- (BOOL)getDateReturn {
    
    NSDate *cuDate = [self getCurrDate];
    
    if (self.minimumPickDate && [cuDate compare:self.minimumPickDate] == NSOrderedAscending) {
        self.pickDate = self.minimumPickDate;
        if (_changeBlock) {
            _changeBlock(self,self.minimumPickDate);
        }
        return NO;
    }
    
    if (self.maximumPickDate && [cuDate compare:self.maximumPickDate] == NSOrderedDescending) {
        self.pickDate = self.maximumPickDate;
        if (_changeBlock) {
            _changeBlock(self,self.maximumPickDate);
        }
        return NO;
    }
    return YES;
}

@end
