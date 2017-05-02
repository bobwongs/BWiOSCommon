//
//  NSString+BWExtension.m
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "NSString+BWExtension.h"

@implementation NSString (BWExtension)

#pragma mark - String Drawing

+ (CGFloat)bw_heightForString:(NSString *)string
                      font:(UIFont *)font
                fixedWidth:(CGFloat)width {
    if (!string || string.length == 0) {
        return 0.0;
    }
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font
                                 };
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return ceilf(size.height);
}

- (CGFloat)bw_heightWithfont:(UIFont *)font
                  fixedWidth:(CGFloat)width {
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font
                                 };
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return ceilf(size.height);
}

+ (CGFloat)widthForString:(NSString*)string
                     font:(UIFont*)font
{
    CGSize sizeToFit = [string sizeWithAttributes:@{NSFontAttributeName: font}];
    return ceilf(sizeToFit.width);
}

- (CGFloat)bw_widthForFont:(UIFont *)font
{
    CGSize sizeToFit = [self sizeWithAttributes:@{NSFontAttributeName: font}];
    return ceilf(sizeToFit.width);
}

@end
