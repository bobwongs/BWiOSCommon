//
//  UILabel+BWExtension.m
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "UILabel+BWExtension.h"

@implementation UILabel (BWExtension)

#pragma mark - Create label

+ (UILabel *)bw_labelSingleLineLeftAlignmentWithText:(NSString *)text {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.numberOfLines = 1;
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

+ (UILabel *)bw_labelSingleLineRightAlignmentWithText:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.numberOfLines = 1;
    label.textAlignment = NSTextAlignmentRight;
    return label;
}

+ (UILabel *)bw_labelSingleLineLeftAlignmentFontSize15ColorBlackWithText:(NSString *)text {
    UILabel *label = [UILabel bw_labelSingleLineLeftAlignmentWithText:text];
    label.font = [UIFont systemFontOfSize:15.0];
    label.textColor = [UIColor blackColor];
    return label;
}

+ (UILabel *)bw_labelSingleLineLeftAlignmentFontSize15Color333333WithText:(NSString *)text {
    UILabel *label = [UILabel bw_labelSingleLineLeftAlignmentWithText:text];
    label.font = [UIFont systemFontOfSize:15.0];
    label.textColor = [self colorWithHexString:@"333333"];
    return label;
}

+ (UILabel *)bw_labelSingleLineLeftAlignmentFontSize15Color666666WithText:(NSString *)text {
    UILabel *label = [UILabel bw_labelSingleLineLeftAlignmentWithText:text];
    label.font = [UIFont systemFontOfSize:15.0];
    label.textColor = [self colorWithHexString:@"666666"];
    return label;
}

#pragma mark - Customize label style

- (void)bw_setTextPrefixWithStar {
    NSString *stringStared = [NSString stringWithFormat:@"*%@", self.text];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:stringStared];
    UIFont *fontText = self.font;
    UIColor *colorText = self.textColor;
    NSDictionary *dictAttrStarText = @{
                                       NSFontAttributeName: fontText,
                                       NSForegroundColorAttributeName: [UIColor redColor]  // Set the star color
                                       };
    NSDictionary *dictAttrMainText = @{
                                       NSFontAttributeName: fontText,
                                       NSForegroundColorAttributeName: colorText
                                       };
    
    [attributedString setAttributes:dictAttrStarText range:NSMakeRange(0, 1)];
    [attributedString setAttributes:dictAttrMainText range:NSMakeRange(1, stringStared.length - 2)];
    self.attributedText = attributedString;
}

- (void)bw_setTextSuffixWithStar {
    NSString *stringStared = [NSString stringWithFormat:@"%@*", self.text];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:stringStared];
    UIFont *fontText = self.font;
    UIColor *colorText = self.textColor;
    NSDictionary *dictAttrMainText = @{
                                       NSFontAttributeName: fontText,
                                       NSForegroundColorAttributeName: colorText
                                       };
    NSDictionary *dictAttrStarText = @{
                                       NSFontAttributeName: fontText,
                                       NSForegroundColorAttributeName: [UIColor redColor]  // Set the star color
                                       };
    
    [attributedString setAttributes:dictAttrMainText range:NSMakeRange(0, stringStared.length - 1)];
    [attributedString setAttributes:dictAttrStarText range:NSMakeRange(stringStared.length - 1, 1)];
    self.attributedText = attributedString;
}

- (void)bw_setLabelTitleWithInputedTitle:(NSString *)titleInputed
                            defaultTitle:(NSString *)titleDefault {
    BOOL isValidString = (titleInputed && titleInputed.length > 0);
    
    NSString *title = isValidString ? titleInputed : titleDefault;
    self.text = title;
    
    UIColor *colorTitle = (isValidString && ![titleInputed isEqualToString:titleDefault]) ? [UIColor blackColor] : [UIColor grayColor];
    self.textColor = colorTitle;
}

- (void)bw_setHightlightText:(NSString *)text
                   textColor:(UIColor *)colorText
                    textFont:(UIFont *)fontText
                 description:(NSString *)description
            descriptionColor:(UIColor *)colorDesc
             descriptionFont:(UIFont *)fontDesc {
    NSString *stringAll = [NSString stringWithFormat:@"%@%@", description, text];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:stringAll];
    NSDictionary *dictAttrDescText = @{
                                       NSFontAttributeName: fontDesc,
                                       NSForegroundColorAttributeName: colorDesc
                                       };
    NSDictionary *dictAttrText = @{
                                   NSFontAttributeName: fontText,
                                   NSForegroundColorAttributeName: colorText
                                   };
    
    NSRange rangeDesc = [stringAll rangeOfString:description];
    NSRange rangeText = [stringAll rangeOfString:text];
    [attributedString setAttributes:dictAttrDescText range:rangeDesc];
    [attributedString setAttributes:dictAttrText range:rangeText];
    
    self.attributedText = attributedString;
}

- (void)bw_setAttributeLabelWithText:(NSString *)text
                         normalColor:(UIColor *)colorNormal
                          normalFont:(UIFont *)fontNormal
                     highlightedText:(NSString *)textHighlighted
                    highlightedColor:(UIColor *)colorHighlighted
                     highlightedFont:(UIFont *)fontHighlighted
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSDictionary *dictAttrNormal = @{
                                     NSFontAttributeName: fontNormal,
                                     NSForegroundColorAttributeName: colorNormal
                                     };
    NSDictionary *dictAttrHighlighted = @{
                                          NSFontAttributeName: fontHighlighted,
                                          NSForegroundColorAttributeName: colorHighlighted
                                          };
    
    NSRange rangeHighlighted = [text rangeOfString:textHighlighted];
    [attributedString setAttributes:dictAttrNormal range:NSMakeRange(0, text.length)];
    [attributedString setAttributes:dictAttrHighlighted range:rangeHighlighted];
    
    self.attributedText = attributedString;
}

- (void)bw_setAttributeLabelWithText:(NSString *)text rowSpace:(CGFloat)rowSpace {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:rowSpace];
    NSDictionary *dictAttr = @{
                               NSFontAttributeName: self.font,
                               NSForegroundColorAttributeName: self.textColor,
                               NSParagraphStyleAttributeName: style
                               };
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:text attributes:dictAttr];
    self.attributedText = attributedString;
}

- (void)bw_setAttributeLabelWithText:(NSString *)text
                       formatText:(NSString *)textFormat
                                font:(UIFont *)fontFormat
                           textColor:(UIColor *)colorFormat
{
    [self bw_setAttributeLabelWithText:text formatText:textFormat attributes:@{
                                                                               NSFontAttributeName: fontFormat,
                                                                               NSForegroundColorAttributeName: colorFormat,
                                                                               }];
}

- (void)bw_setAttributeLabelWithText:(NSString *)text
                          formatText:(NSString *)textFormat
                          attributes:(NSDictionary *)dictAttrFormat {
    if (![text containsString:textFormat]) return ;  // 是否包含格式化文本
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
    NSDictionary *dictAttrText = @{
                                   NSFontAttributeName: self.font,
                                   NSForegroundColorAttributeName: self.textColor
                                   };
    NSRange rangeFormat = [text rangeOfString:textFormat];
    [attrString setAttributes:dictAttrText range:NSMakeRange(0, text.length)];
    [attrString setAttributes:dictAttrFormat range:rangeFormat];
    
    self.attributedText = attrString;
}

#pragma mark - Tool

/**
 Color from hex
 */
+ (UIColor *)colorWithRGBHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

// Returns a UIColor by scanning the string for a hex number and passing that to +[UIColor colorWithRGBHex:]
// Skips any leading whitespace and ignores any trailing characters
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return nil;
    return [[self class] colorWithRGBHex:hexNum];
}

@end
