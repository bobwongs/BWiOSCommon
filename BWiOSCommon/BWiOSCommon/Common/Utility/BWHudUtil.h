//
//  BWHudUtil.h
//  BWHudUtil
//
//  Created by BobWong on 15/7/29.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIAlertView+Blocks.h"


@interface BWHudUtil : NSObject

#pragma mark - Loading Indicator

/**
 *  显示加载框默认样式
 *
 *  @param view 加载框的父视图
 */
+ (void)showDefaultLoadingInView:(UIView *)view;

/**
 *  隐藏加载框默认样式
 *
 *  @param view 加载框的父视图
 */
+ (void)hideDefaultLoadingInView:(UIView *)view;

#pragma mark - Warning Text

/**
 *  显示文本用默认样式
 *
 *  @param text 显示文本
 *  @param view 文本框的父视图
 */
+ (void)showDefaultWithText:(NSString *)text
                     inView:(UIView *)view;

/**
 *  文本显示，包含文本详情
 *
 *  @param text 显示文本
 *  @param detailText 详细文本
 *  @param view 文本框的父视图
 */
+ (void)showDefaultWithText:(NSString *)text
                 detailText:(NSString *)detailText
                     inView:(UIView *)view;

/**
 *  完成提示
 *
 *  @param view 提示框的父视图
 */
+ (void)showCompletedInView:(UIView *)view;

/**
 *  错误提示
 *
 *  @param view 提示框的父视图
 */
+ (void)showErrorInView:(UIView *)view;

/**
 *  自定义视图提示
 *
 *  @param customView 自定义视图
 *  @param text 提示文本
 *  @param view 提示框的父视图
 */
+ (void)showCustomView:(UIView *)customView
                  text:(NSString *)text
                inView:(UIView *)view;

#pragma mark - UIAlertView

/**
 *  显示UIAlertView用自定义样式
 *
 *  @param title 标题
 *  @param message 文本描述
 *  @param style 样式
 *  @param cancelButtonTitle 取消按钮文本
 *  @param otherButtonTitles 其他按钮文本
 *  @param tapBlock 回调Block
 */
+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                         style:(UIAlertViewStyle)style
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSArray *)otherButtonTitles
                      tapBlock:(UIAlertViewCompletionBlock)tapBlock;

/**
 *  显示UIAlertView用默认样式
 *
 *  @param title 标题
 *  @param message 文本描述
 *  @param cancelButtonTitle 取消按钮文本
 *  @param otherButtonTitles 其他按钮文本
 *  @param tapBlock 回调Block
 */
+ (void)showAlertViewDefaultStyleWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                         otherButtonTitles:(NSArray *)otherButtonTitles
                                  tapBlock:(UIAlertViewCompletionBlock)tapBlock;

@end
