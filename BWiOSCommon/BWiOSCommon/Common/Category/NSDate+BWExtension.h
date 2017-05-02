//
//  NSDate+BWExtension.h
//  BWiOSCommon
//
//  Created by BobWong on 16/12/1.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BWExtension)

+ (NSString *)bw_getDateStringFromTimeStamp:(long long)timeStamp withDateFormat:(NSString *)dateFormat;

@end
