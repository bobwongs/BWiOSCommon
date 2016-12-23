//
//  NSString+BWExtension.h
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BWExtension)

/**
 Get the string height with the font, constraint the width, Class Method
 */
+ (CGFloat)bw_heightForString:(NSString *)text
                      font:(UIFont *)font
                fixedWidth:(CGFloat)width;

/**
 Get the string height with the font, constraint the width, Instance Method
 */
- (CGFloat)bw_heightWithfont:(UIFont *)font
               fixedWidth:(CGFloat)width;

/**
 Get the string with the font
 */
+ (CGFloat)widthForString:(NSString*)string
                     font:(UIFont*)font;
- (CGFloat)bw_widthForFont:(UIFont *)font;

@end
