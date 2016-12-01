//
//  NSDate+BWExtension.m
//  BWiOSCommon
//
//  Created by BobWong on 16/12/1.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "NSDate+BWExtension.h"

@implementation NSDate (BWExtension)

+ (NSString *)bm_getDateStringFromTimeStamp:(long long)timeStamp withDateFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp / 1000];
    NSString *time = [formatter stringFromDate:date];
    return time;
}

@end
