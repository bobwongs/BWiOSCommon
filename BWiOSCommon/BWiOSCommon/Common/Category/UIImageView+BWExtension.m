//
//  UIImageView+BWExtension.m
//  BWTools
//
//  Created by BobWong on 16/7/28.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "UIImageView+BWExtension.h"

@implementation UIImageView (BWExtension)

#pragma mark - Line

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

#pragma mark - Utility ImageView

+ (UIImageView *)imageViewRightArrow {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow_right"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    return imageView;
}

@end
