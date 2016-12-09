//
//  UIView+BWExtension.h
//  BWTools
//
//  Created by Bob Wong on 16/2/19.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Provides extensions for `UIView`.
 */
@interface UIView (BWExtension)

#pragma mark - Reframe view

- (void)bw_reframeX:(CGFloat)x;     ///< Reframe x.
- (void)bw_reframeY:(CGFloat)y;     ///< Reframe y.
- (void)bw_reframeWidth:(CGFloat)width;     ///< Reframe width.
- (void)bw_reframeHeight:(CGFloat)height;   ///< Reframe height.

#pragma mark - Line

+ (UIView *)lineViewDefaultColor;   ///< Create a line with the default line color, here is [UIColor grayColor] as an example.
- (UIView *)bm_addLineInBottom;   ///< Add line at the bottom with the width equal to self
- (UIView *)bm_addLineInBottomWith10LeftOffset;  ///< Add line at the bottom with 10 offset in left

@end
