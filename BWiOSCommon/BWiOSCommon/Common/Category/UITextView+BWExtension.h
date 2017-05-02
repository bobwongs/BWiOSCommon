//
//  UITextView+BWExtension.h
//  BWiOSCommon
//
//  Created by BobWong on 16/12/16.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (BWExtension)

#pragma mark - Limit Input Text Length

+ (BOOL)bw_textView:(UITextView *)textView limitedLength:(NSUInteger)limitedLength shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;

#pragma mark - Place Holder

@property (nonatomic, readonly) UILabel *placeholderLabel;  //!< 提示文本Label

@property (nonatomic, strong) NSString *placeholder;  //!< 提示文本
@property (nonatomic, strong) UIColor *placeholderColor;  //!< 提示文本颜色

+ (UIColor *)defaultPlaceholderColor;  //!< 获得默认提示文本的颜色

@end
