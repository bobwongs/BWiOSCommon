//
//  UILabel+BWExtension.h
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (BWExtension)

#pragma mark - Create label

+ (UILabel *)bw_labelSingleLineWithText:(NSString *)text;
+ (UILabel *)bw_labelSingleLineLeftAlignmentWithText:(NSString *)text;
+ (UILabel *)bw_labelSingleLineCenterAlignmentWithText:(NSString *)text;
+ (UILabel *)bw_labelSingleLineRightAlignmentWithText:(NSString *)text;

+ (UILabel *)bw_labelSingleLineLeftAlignmentWithFontSize:(CGFloat)fontSize color:(UIColor *)color text:(NSString *)text;

#pragma mark - Customize label style

- (void)bw_setTextPrefixWithStar;  ///< Set red "*" as prefix of the label text
- (void)bw_setTextSuffixWithStar;  ///< Set red "*" as suffix of the label text

/**
 Set text in label, if titleInputed is empty, show the titleDefault, and the label color is also change
 */
- (void)bw_setLabelTitleWithInputedTitle:(NSString *)titleInputed
                            defaultTitle:(NSString *)titleDefault;

/**
 Set the description and the text in different style, such as "Money: 12.00", the style of "Money" and "12.00" is different
 */
- (void)bw_setHightlightText:(NSString *)text
                   textColor:(UIColor *)colorText
                    textFont:(UIFont *)fontText
                 description:(NSString *)description
            descriptionColor:(UIColor *)colorDesc
             descriptionFont:(UIFont *)fontDesc;

- (void)bw_setAttributeLabelWithText:(NSString *)text
                         normalColor:(UIColor *)colorNormal
                          normalFont:(UIFont *)fontNormal
                     highlightedText:(NSString *)textHighlighted
                    highlightedColor:(UIColor *)colorHighlighted
                     highlightedFont:(UIFont *)fontHighlighted;

/**
 Set the line space of the text in label, use the rich text
 */
- (void)bw_setAttributeLabelWithText:(NSString *)text
                            rowSpace:(CGFloat)rowSpace;

/**
 *  Set the format text
 */
- (void)bw_setAttributeLabelWithText:(NSString *)text
                          formatText:(NSString *)textFormat
                                font:(UIFont *)fontFormat
                           textColor:(UIColor *)colorFormat;

- (void)bw_setAttributeLabelWithText:(NSString *)text
                          formatText:(NSString *)textFormat
                          attributes:(NSDictionary *)dictAttrFormat;

@end
