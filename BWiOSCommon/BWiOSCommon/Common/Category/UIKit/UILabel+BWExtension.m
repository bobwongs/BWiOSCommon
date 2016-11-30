//
//  UILabel+BWExtension.m
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "UILabel+BWExtension.h"

@implementation UILabel (BWExtension)

#pragma mark - Create Label

+ (UILabel *)bw_labelSingleLineLeftAlignmentWithDefaultText:(NSString *)text {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.numberOfLines = 1;
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

+ (UILabel *)bw_labelSingleLineRightAlignmentWithDefaultText:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.numberOfLines = 1;
    label.textAlignment = NSTextAlignmentRight;
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

@end
