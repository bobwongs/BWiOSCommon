//
//  UITextField+BWExtension.m
//  BWTools
//
//  Created by Bob Wong on 16/3/14.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "UITextField+BWExtension.h"
#import <objc/runtime.h>


@implementation UITextField (BWExtension)

#pragma mark - Create textfield

+ (UITextField *)textFieldBorderStyleNoneClearButtonModeWhileEditingWithPlaceHolder:(NSString *)placeholder
{
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = placeholder;
    textField.borderStyle = UITextBorderStyleNone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;  // Set the clear button appear time
    return textField;
}

#pragma mark - Limit textfield input

static NSString *kLimitTextLengthKey = @"kLimitTextLengthKey";

- (void)limitTextLength:(int)length
{
    objc_setAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey), [NSNumber numberWithInt:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(textFieldTextLengthLimit:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldTextLengthLimit:(id)sender
{
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey));
    int length = [lengthNumber intValue];
    //下面是修改部分
    bool isChinese;//判断当前输入法是否是中文
    NSArray *currentar = [UITextInputMode activeInputModes];
    UITextInputMode *current = [currentar firstObject];
    //[[UITextInputMode currentInputMode] primaryLanguage]，废弃的方法
    if ([current.primaryLanguage isEqualToString: @"en-US"]) {
        isChinese = false;
    }
    else
    {
        isChinese = true;
    }
    
    if(sender == self) {
        // length是自己设置的位数
        NSString *str = [[self text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
        if (isChinese) { //中文输入法下
            UITextRange *selectedRange = [self markedTextRange];
            //获取高亮部分
            UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                if ( str.length>=length) {
                    NSString *strNew = [NSString stringWithString:str];
                    [self setText:[strNew substringToIndex:length]];
                }
            }
            else
            {
                // NSLog(@"输入的");
                
            }
        }else{
            if ([str length]>=length) {
                NSString *strNew = [NSString stringWithString:str];
                [self setText:[strNew substringToIndex:length]];
            }
        }
    }
}

+ (BOOL)moneyTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL hasDot = YES;
    if ([textField.text rangeOfString:@"."].location == NSNotFound) {
        hasDot = NO;
    }
    if ([string length] > 0)
    {
        unichar single = [string characterAtIndex:0];//当前输入的字符
        if ((single >= '0' && single <= '9') || single == '.')//数据格式正确
        {
            if([textField.text length] == 0){
                if(single == '.'){
                    // 第一个数字不能为小数点
                    return NO;
                }
            }
            if (single == '.')
            {
                if(!hasDot)  //text中还没有小数点
                {
                    hasDot=YES;
                    return YES;
                }
                else
                {
                    // 已经输入过小数点
                    return NO;
                }
            }
            else
            {
                if (hasDot)  //存在小数点
                {
                    // 判断小数点的位数
                    NSRange ran = [textField.text rangeOfString:@"."];
                    NSInteger tt = range.location - ran.location;
                    if (tt <= 2){
                        return YES;
                    } else {
                        // 最多输入两位小数
                        return NO;
                    }
                }
                else
                {
                    return YES;
                }
            }
        } else {
            // 输入的数据格式不正确
            return NO;
        }
    }
    
    return YES;
}

@end
