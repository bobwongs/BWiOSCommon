//
//  UIImageView+BWExtension.h
//  BWTools
//
//  Created by BobWong on 16/7/28.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Provides extensions for `UIImageView`.
 */
@interface UIImageView (BWExtension)

#pragma mark - Line

+ (UIImageView *)imageViewDottedLine;  ///< 虚线ImageView
+ (UIImageView *)imageViewSolidLine;  ///< 实线ImageView

#pragma mark - Utility ImageView

+ (UIImageView *)imageViewRightArrow;  ///< 右箭头ImageView

@end
