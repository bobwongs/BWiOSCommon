//
//  UITextField+BWExtension.h
//  BWTools
//
//  Created by Bob Wong on 16/3/14.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (BWExtension)

+ (UITextField *)textFieldDefaultStyleWithPlaceHolder:(NSString *)placeholder;  ///< 创建UITextField，默认样式

- (void)limitTextLength:(int)length;

@end
