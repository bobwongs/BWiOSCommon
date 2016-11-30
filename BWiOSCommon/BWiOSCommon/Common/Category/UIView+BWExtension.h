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

#pragma mark - Mine

/*
 Reframe
 */
- (void)bw_reframeX:(CGFloat)x;     ///< Reframe x.
- (void)bw_reframeY:(CGFloat)y;     ///< Reframe y.
- (void)bw_reframeWidth:(CGFloat)width;     ///< Reframe width.
- (void)bw_reframeHeight:(CGFloat)height;   ///< Reframe height.

/*
 Line
 */
+ (UIView *)lineViewDefaultColor;   ///< 创建默认线条颜色的View

@end
