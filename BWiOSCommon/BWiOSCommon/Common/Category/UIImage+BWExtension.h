//
//  UIImage+BWExtension.h
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BWExtension)

/**
 * Create UIImage instance with the color
 */
+ (UIImage *)imageWithColor:(UIColor*)color
                      width:(CGFloat)width
                     height:(CGFloat)height;

@end
