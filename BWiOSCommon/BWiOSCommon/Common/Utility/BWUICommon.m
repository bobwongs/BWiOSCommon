//
//  BWUICommon.m
//  BWUICommon
//
//  Created by BobWong on 15/8/5.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import "BWUICommon.h"


@implementation BWUICommon

#pragma mark - Text

+ (CGFloat)widthForString:(NSString *)text
                     font:(UIFont *)font
{
    CGSize size = CGSizeZero;
    
    if ([text respondsToSelector:@selector(sizeWithAttributes:)]) {
        // iOS 7.0 or later
        size = [text sizeWithAttributes:@{
                                          NSFontAttributeName : font
                                          }];
    } else {
        size = [text sizeWithFont:font];
    }
    
    return size.width;
}

+ (CGFloat)heightForString:(NSString *)text
                      font:(UIFont *)font
                     width:(CGFloat)width
{
    CGSize size = CGSizeZero;
    
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        // iOS 7.0 or later
        NSDictionary * attributes = @{
                                      NSFontAttributeName: font
                                     };
        
        size = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    } else {
        size = [text sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)];
    }
    
    return size.height;
}

// 待整合代码，取大于sizeToFit.width的最小整数
+ (CGFloat)width2ForString:(NSString*)value font:(UIFont*)font
{
    CGSize sizeToFit;
    if ([value respondsToSelector:@selector(sizeWithAttributes:)])
    {
        //iOS 7
        sizeToFit = [value sizeWithAttributes:@{NSFontAttributeName: font}];
    } else
    {
        sizeToFit = [value sizeWithFont:font];
    }
    
    return ceilf(sizeToFit.width);
}

#pragma mark - Image

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0, 0.0, 1.0, 1.0);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.frame.size,NO,2);
    //UIGraphicsBeginImageContext(view.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - Color

+ (UIColor *)colorFromHexRGB:(NSString *)colorString
{
    UIColor * result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != colorString)
    {
        NSScanner * scanner = [NSScanner scannerWithString:colorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    
    return result;
}

@end
