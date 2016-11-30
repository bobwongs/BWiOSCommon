//
//  UITextField+BWExtension.h
//  BWTools
//
//  Created by Bob Wong on 16/3/14.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (BWExtension)

#pragma mark - Create textfield

+ (UITextField *)textFieldBorderStyleNoneClearButtonModeWhileEditingWithPlaceHolder:(NSString *)placeholder;

#pragma mark - Limit textfield input

/**
 Limit textfield inputed text length
 */
- (void)limitTextLength:(int)length;

/**
 Money textfield input limit
 Corrent format: 12.00, left two number after the dot, and the begin character can't be ".", and the input only allow 0-9 and "."
 */
+ (BOOL)moneyTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end
