//
//  UIButton+BWExtension.h
//  BWTools
//
//  Created by BobWong on 16/7/28.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BWExtension)

#pragma mark - Create custom style button

// Create a button with an image only

+ (UIButton *)buttonWithImage:(UIImage *)image;  ///< Normal state image
/**
 Normal and highlighted image
 */
+ (UIButton *)buttonWithNormalImage:(UIImage *)normalImage
                   highlightedImage:(UIImage *)highlightedImage;

+ (UIButton *)bw_buttonWithTitle:(NSString *)titleBtn
                      titleColor:(UIColor *)colorTitle
                       titleFont:(UIFont *)fontTitle
            backgroundImageColor:(UIColor *)colorBg;

/**
 * 创建标题在左边，箭头在右边的Button
 */
+ (UIButton *)bw_buttonLeftTitleAndRightArrowWithTitle:(NSString *)title;

/**
 * 创建Button，左边Title，右边Image
 */
+ (UIButton *)bw_buttonWithLeftTitle:(NSString *)title
                          rightImage:(UIImage *)image;
@property (nonatomic, strong) UILabel *labelTitle;  //!< 按钮标题Label

+ (UIButton *)bw_buttonWithTitle:(NSString *)titleButton
             titleAndBorderColor:(UIColor *)colorTitleAndBorder;  //!< 创建带有描边的Button，描边颜色和Title的颜色一样
+ (UIButton *)bw_buttonWithTitle:(NSString *)titleButton
                      titleColor:(UIColor *)colorTitle
                       titleFont:(UIFont *)fontTitle;  //!< 创建Button，设置Title的文本、颜色、字体
+ (UIButton *)bw_buttonTitleUnderLineWithTitle:(NSString *)titleButton
                                    titleColor:(UIColor *)colorTitle
                                     titleFont:(UIFont *)fontTitle;

- (UIButton *)bw_initWithContactNumber:(NSString *)contactNumber;  //!< 创建拨打电话按钮
- (void)bw_setButtonTitleWithContactNumber:(NSString *)contactNumber;  //!< 修改拨打电话按钮文本
- (void)bw_setButtonTitleUnderLineWithTitle:(NSString *)titleButton
                                 titleColor:(UIColor *)colorTitle
                                  titleFont:(UIFont *)fontTitle;  //!< 给按钮文本加上下划线
- (void)bw_setButtonWithInputedTitle:(NSString *)titleInputed
                        defaultTitle:(NSString *)titleDefault;  //!< 给按钮设置文本，titleInputed不为空则显示titleInputed，为空则显示titleDefault

/**
 * 创建Button，Title + Image
 */
+ (UIButton *)bw_buttonWithTitle:(NSString *)title
                       titleFont:(UIFont *)fontTitle
                      titleColor:(UIColor *)colorTitle
                     normalImage:(UIImage *)imageNormal
                highlightedImage:(UIImage *)imageHighlighted;

@end
