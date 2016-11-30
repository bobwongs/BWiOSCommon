//
//  UIButton+BWExtension.h
//  BWTools
//
//  Created by BobWong on 16/7/28.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BWExtension)

/*
  创建一个只带有Image的Button
 */
+ (UIButton *)buttonWithImage:(UIImage *)image;  ///< 仅仅设置Normal图片
+ (UIButton *)buttonWithNormalImage:(UIImage *)normalImage
                   highlightedImage:(UIImage *)highlightedImage;  ///< 设置了NormalImage和HighlightedImage的Button

/**
 * 创建标题在左边，箭头在右边的Button
 */
+ (UIButton *)bm_buttonLeftTitleAndRightArrowWithTitle:(NSString *)title;

/**
 * 创建Button，左边Title，右边Image
 */
+ (UIButton *)bm_buttonWithLeftTitle:(NSString *)title
                          rightImage:(UIImage *)image;
@property (nonatomic, strong) UILabel *labelTitle;  //!< 按钮标题Label

+ (UIButton *)bm_buttonWithTitle:(NSString *)titleButton
             titleAndBorderColor:(UIColor *)colorTitleAndBorder;  //!< 创建带有描边的Button，描边颜色和Title的颜色一样
+ (UIButton *)bm_buttonWithTitle:(NSString *)titleButton
                      titleColor:(UIColor *)colorTitle
                       titleFont:(UIFont *)fontTitle;  //!< 创建Button，设置Title的文本、颜色、字体

- (UIButton *)bm_initWithContactNumber:(NSString *)contactNumber;  //!< 创建拨打电话按钮
- (void)bm_setButtonTitleWithContactNumber:(NSString *)contactNumber;  //!< 修改拨打电话按钮文本
- (void)bm_setButtonTitleUnderLineWithTitle:(NSString *)titleButton
                                 titleColor:(UIColor *)colorTitle
                                  titleFont:(UIFont *)fontTitle;  //!< 给按钮文本加上下划线
- (void)bm_setButtonWithInputedTitle:(NSString *)titleInputed
                        defaultTitle:(NSString *)titleDefault;  //!< 给按钮设置文本，titleInputed不为空则显示titleInputed，为空则显示titleDefault

@end
