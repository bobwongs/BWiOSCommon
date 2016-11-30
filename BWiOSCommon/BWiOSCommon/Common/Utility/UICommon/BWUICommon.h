//
//  BWUICommon.h
//  BWUICommon
//
//  Created by BobWong on 15/8/5.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface BWUICommon : NSObject

#pragma mark - Text

/**
 *  获取文本的宽度，单行文本
 *  @param text 文本
 *  @param font 文本的字体
 *  @return 宽度
 */
+ (CGFloat)widthForString:(NSString *)text
                     font:(UIFont *)font;

/**
 *  获取文本的高度，固定宽度
 *  @param text 文本
 *  @param font 文本的字体
 *  @param width 固定宽度
 *  @return 高度
 */
+ (CGFloat)heightForString:(NSString *)text
                      font:(UIFont *)font
                     width:(CGFloat)width;

#pragma mark - Image

/**
 *  创建图像，根据颜色值创建，图像大小为1*1
 *  @param color 颜色
 *  @return UIImage对象
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

#pragma mark - Color

/**
 *  创建UIColor对象，根据十六进制的颜色值
 *  @param colorString 颜色值（六位数字）
 *  @return UIColor对象
 */
+ (UIColor *)colorFromHexRGB:(NSString *)colorString;

@end
