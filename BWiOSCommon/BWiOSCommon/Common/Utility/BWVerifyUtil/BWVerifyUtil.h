//
//  BWVerifyUtil.h
//  BWiOSCommon
//
//  Created by BobWong on 16/12/26.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BWVerifyUtil : NSObject

+ (BOOL)validateUserName:(NSString *)userName;
+ (BOOL)validateUserNameInputString:(NSString *)userName;

@end
