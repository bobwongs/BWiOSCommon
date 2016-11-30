//
//  UIImageView+BWExtension.m
//  BWTools
//
//  Created by BobWong on 16/7/28.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "UIImageView+BWExtension.h"

@implementation UIImageView (BWExtension)

+ (UIImageView *)imageViewDottedLine
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@""];  // set dotted line image
    return imageView;
}

+ (UIImageView *)imageViewSolidLine
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor grayColor];
    return imageView;
}

@end
