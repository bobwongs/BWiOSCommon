//
//  UIImage+BWExtension.m
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "UIImage+BWExtension.h"

@implementation UIImage (BWExtension)

+ (UIImage *)imageWithColor:(UIColor*)color
                      width:(CGFloat)width
                     height:(CGFloat)height {
    CGRect rect = CGRectMake(0.0, 0.0, width, height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
