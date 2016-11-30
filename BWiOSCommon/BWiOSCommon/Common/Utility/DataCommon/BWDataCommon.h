//
//  BWDataCommon.h
//  BWDataCommon
//
//  Created by Bob Wong on 16/3/2.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, KLDateType)
{
    KLDate      = 0,  // 返回年月日
    KLDateTime  = 1,  // 返回详细时间
};


@interface BWDataCommon : NSObject

#pragma mark - Device Information

/**
 *  Device Model
 */
+ (NSString *)modelId;

/**
 *  Device Name
 */
+ (NSString *)deviceName;


#pragma mark - Regular Expression Verify

/**
 *  Verify email
 */
+ (BOOL)isValidEmail:(NSString *)email;

/**
 *  Verify URL
 */
+ (BOOL)isValidURL:(NSString *)url;

/**
 *  Verify Mobile
 */
+ (BOOL)isValidMobile:(NSString *)mobileNum;

/**
 *  Verify China Telecom mobile
 */
+ (BOOL)isCTMobileNumber:(NSString *)mobileNum;

/**
 *  Verify string is all Verify string
 */
+ (BOOL)isNumberAll:(NSString *)mobileNum;

/**
 *  Verify ID Num
 */
+ (BOOL)isIDNumberValid:(NSString*)idnumber;


#pragma mark - File System

/**
 *  Get Documents Path
 */
+ (NSString *)getDocumentPath;

/**
 *  Get Documents Path by Folder Name
 */
+ (NSString*)getDocumentFolderByName:(NSString *)foldername;

/**
 *  Documents path append param "title"
 */
+ (NSString *)getDocumentsPath:(NSString *)title;


#pragma mark - Time and Date

/**
 *  获取2个日期的相差的天数
 */
+ (NSInteger)getDayCountBetween:(NSDate *)star
                            end:(NSDate *)end;

/**
 *  Get Current Date
 */
+ (NSDate *)getCurrentDate;

// 获取2个日期的相差的天数
+ (CGSize) measureFrame:(CGRect)rc
                   text:(NSAttributedString*)text;

/**
 *  日期转换
 *
 *  @param sharetime 时间参数
 *  @param dtStr     date = 年月日 time = 详细时间
 */
+ (NSString *)dataByShareTime:(NSString *)sharetime
                   DateOrTime:(KLDateType)dtType;

//获取当前时间
+ (NSString *)currentTime;

//获取时间间隔，startTime到当前时间，返回秒
+ (int)timeInterval:(NSString *)startTime;

/**
 *  欢页本月剩余天数。按每月30天计算。
 *
 *  @return 剩余天数。
 */
+ (int)currentMonthLeave;


#pragma mark - Encrypt and Decrypt

//  MD5加密
+ (NSString *)MD5:(NSMutableString *)str;


#pragma mark - Data

/**
 *  把json字符串解释成字典
 *
 *  @param jsonString  json字符串
 *  @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+ (NSString *)dictionaryToJson:(NSDictionary *)dict;

// 中文编码
+ (NSString*)encodedURLParameterString:(NSString *)text;

/*
 @method 获取字典里面字符串为null的值赋值为nil
 @param  dict数据源
 @param  aKey待获取的key值
 */
+ (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

/*
 @method 去掉字典里面的NSString类型的null值
 @param  dicData数据源可能是数组也可能是字典
 */
+ (NSMutableDictionary*)removeNullForNSStringFromData:(NSDictionary*)dicData;

/**
 *  第一个数除以第二个数(主要判断分母为零的特殊情况)
 *
 *  @param fistNum 第一个数
 *  @param second  第二个数
 */
+ (double)division:(double)fistNum
            second:(double)second;

/**
 *  向上取整
 *
 *  @param fNum 要格式的数字
 *  @return NSNumber
 */
+ (NSNumber*)numCeilFloat:(double)dNum;

/*
 @method 修改字符串中关键字的颜色或者大小
 @param  text           包含关键字的字符串
 @param  keyWordArray   关键字数组
 @param  font           关键字字体
 @param  keyWordColor   关键字颜色
 @return 返回NSAttributedString 类型的字体
 */
+ (NSMutableAttributedString *)setColorFontForKeyWord:(NSString *)text
                                            KeyArray:(NSArray *)keyWordArray
                                            WithFont:(UIFont *)font
                                               Color:(UIColor *)keyWordColor
                                           otherFont:(UIFont *)otherFont
                                          otherColor:(UIColor *)otherColor;

/**
 *  格式化手机号
 *
 *  @param phoneNum 手机号
 *  @param split    占位符
 *
 *  @return 格式化后的手机
 */
+ (NSString *)phoneFormat:(NSString*)phoneNum
                    split:(NSString*)split;


/**
 *  @param soreArray  对数组进行排序
 *  @param key          需要排序的key(必须是可以转整形)
 *  return 排序后的数组
 */
+ (NSMutableArray *)sortedArrayUsingComparator:(NSArray *)soreArray
                                       SoreKey:(NSString *)key;


/**
 *  浮点比较
 *
 *  @param floatA 数字A
 *  @param floatB 数字B
 *
 *  @return BOOL
 */
+ (BOOL)isFloatA:(float)floatA
   equalToFloatB:(float)floatB;

@end
