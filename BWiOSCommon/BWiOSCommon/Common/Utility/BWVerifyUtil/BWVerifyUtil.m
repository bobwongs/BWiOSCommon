//
//  BWVerifyUtil.m
//  BWiOSCommon
//
//  Created by BobWong on 16/12/26.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BWVerifyUtil.h"

@implementation BWVerifyUtil

+ (BOOL)validateUserName:(NSString *)userName {
    // 2~15位数
    if (userName.length < 2 || userName.length > 15) {
        return NO;
    }
    
    return [self validateUserNameInputString:userName];
}

+ (BOOL)validateUserNameInputString:(NSString *)userName {
    // 中英文、数字、-、_
    NSString *regex =[NSString stringWithFormat:@"^[a-zA-Z0-9\u4e00-\u9fa5-_]+$"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:userName];
}

@end
