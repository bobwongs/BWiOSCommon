//
//  BMDatePickAlertView.h
//  LDTour
//
//  Created by Daredos on 16/6/17.
//  Copyright © 2016年 Daredos. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BMDatePickAlertView;

/*!
 *  @brief  实时交互block
 *
 *  @param datePickView 弹窗对象
 *  @param date         选中的时间
 */
typedef void(^ChangeBlock) (BMDatePickAlertView *datePickView, NSDate *date);

/*!
 *  @brief 确定按钮点击的block
 *
 *  @param datePickView 弹窗对象
 *  @param date         选中的时间
 */
typedef void(^ConfirmBlock)(BMDatePickAlertView *datePickView, NSDate *date);

/*!
 *  @brief 自定义的时间选择控件类型
 */
typedef NS_ENUM(NSInteger, BMDatePickViewMode) {
    /*!
     *  只有年
     */
    BMDatePickViewModeYear = 0,
    /*!
     *  只有年月
     */
    BMDatePickViewModeYearMonth = 1,
    /*!
     *  只有年月日
     */
    BMDatePickViewModeYearMonthDay,
    
    /*!
     *  有 年月日时
     */
    BMDatePickViewModeYearMonthDayHour,
    /*!
     *  有 年月日 时分
     */
    BMDatePickViewModeYearMonthDayHourMinute,
    /*!
     *   有 年月日 时分秒
     */
    BMDatePickViewModeYearMonthDayHourMinuteSecond,
};

/*!
 *  @brief BM 时间选择器
 */
@interface BMDatePickAlertView : UIView

/*!
 *  @brief 显示的时间
 */
@property (strong, nonatomic) NSDate *date;

/*!
 *  @brief 取消按钮点击回调block || 背景点击的回调block
 */
@property (copy, nonatomic) dispatch_block_t cancelBlock;

/*!
 *  @brief 系统 & 有按钮   [推荐使用]
 *
 *  @param pickerMode   显示的类型 (参考UIDatePickerMode的类型)
 *  @param date         默认显示的时间
 *  @param minimumDate  可以选择的最小时间
 *  @param maximumDate  可以选择的最大时间
 *  @param confirmBlock 确定按钮点击的回调block
 */
+ (instancetype)datePickViewWithConfirmForPickerMode:(UIDatePickerMode)pickerMode
                                                date:(NSDate *)date
                                         minimumDate:(NSDate *)minimumDate
                                         maximumDate:(NSDate *)maximumDate
                                        confirmBlock:(ConfirmBlock)confirmBlock;

/*!
 *  @brief 自定义 & 有按钮
 *
 *  @param pickerMode   显示的类型
 *  @param date         默认显示的时间
 *  @param minimumDate  可以选择的最小时间
 *  @param maximumDate  可以选择的最大时间
 *  @param confirmBlock 确定按钮点击的回调block
 */
+ (instancetype)datePickViewWithCustomConfirmForPickerMode:(BMDatePickViewMode)pickerMode
                                                      date:(NSDate *)date
                                               minimumDate:(NSDate *)minimumDate
                                               maximumDate:(NSDate *)maximumDate
                                              confirmBlock:(ConfirmBlock)confirmBlock;

/*!
 *  @brief 系统 & 实时交互   [推荐使用]
 *
 *  @param pickerMode  显示的类型 (参考UIDatePickerMode的类型)
 *  @param date        默认显示的时间
 *  @param minimumDate 可以选择的最小时间
 *  @param maximumDate 可以选择的最大时间
 *  @param changeBlock 选择的时间变化时的回调block
 */
+ (instancetype)datePickViewWithChangeForPickerMode:(UIDatePickerMode)pickerMode
                                               date:(NSDate *)date
                                        minimumDate:(NSDate *)minimumDate
                                        maximumDate:(NSDate *)maximumDate
                                        changeBlock:(ChangeBlock)changeBlock;

/*!
 *  @brief 自定义 & 实时交互
 *
 *  @param pickerMode  显示的类型
 *  @param date        默认显示的时间
 *  @param minimumDate 可以选择的最小时间
 *  @param maximumDate 可以选择的最大时间
 *  @param changeBlock 选择的时间变化时的回调block
 */
+ (instancetype)datePickViewWirhCustomChangeForPickerMode:(BMDatePickViewMode)pickerMode
                                                     date:(NSDate *)date
                                              minimumDate:(NSDate *)minimumDate
                                              maximumDate:(NSDate *)maximumDate
                                              changeBlock:(ChangeBlock)changeBlock;
/*!
 *  @brief 显示 时间选择器
 */
- (void)show;

/*!
 *  @brief 手动隐藏 时间选择器
 */
- (void)diss;

@end
