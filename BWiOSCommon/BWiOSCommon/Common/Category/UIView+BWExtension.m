//
//  UIView+BWExtension.m
//  BWTools
//
//  Created by Bob Wong on 16/2/19.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "UIView+BWExtension.h"

@implementation UIView (BWExtension)

#pragma mark - Reframe view

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

#pragma mark - Line

+ (UIView *)lineViewDefaultColor
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor grayColor];  // Set the line color
    return view;
}

- (UIView *)bm_addLineInBottom {
    UIView *viewLine = [UIView lineViewDefaultColor];
    [self addSubview:viewLine];
    
    // Wait to set constraints
    
//    [viewLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(0);
//        make.right.mas_equalTo(0);
//        make.bottom.mas_equalTo(0);
//        make.height.mas_equalTo(0.5);
//    }];
    
    return viewLine;
}

- (UIView *)bm_addLineInBottomWith10LeftOffset {
    UIView *viewLine = [UIView lineViewDefaultColor];
    [self addSubview:viewLine];
    
    // Wait to set constraints
    
//    [viewLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(10);
//        make.right.mas_equalTo(0);
//        make.bottom.mas_equalTo(0);
//        make.height.mas_equalTo(0.5);
//    }];
    
    return viewLine;
}

- (NSArray *)bw_addLinesAtTopAndBottom {
    UIView *viewTop = [[UIView alloc] init];
    viewTop.backgroundColor = [UIColor grayColor];
    [self addSubview:viewTop];
    
    UIView *viewBottom = [[UIView alloc] init];
    viewBottom.backgroundColor = [UIColor grayColor];
    [self addSubview:viewBottom];
    
    [viewTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    [viewBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    return @[viewTop, viewBottom];
}

@end
