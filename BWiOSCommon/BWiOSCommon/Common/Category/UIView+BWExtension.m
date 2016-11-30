//
//  UIView+BWExtension.m
//  BWTools
//
//  Created by Bob Wong on 16/2/19.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "UIView+BWExtension.h"

@implementation UIView (BWExtension)

#pragma mark - Frame这一部分可以使用YY的扩展比较好

- (void)bw_reframeX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    
    self.frame = frame;
}

- (void)bw_reframeY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    
    self.frame = frame;
}

- (void)bw_reframeWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    
    self.frame = frame;
}

- (void)bw_reframeHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    
    self.frame = frame;
}

#pragma mark - Line View

+ (UIView *)lineViewDefaultColor
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor grayColor];  // 设置线色
    return view;
}

@end
