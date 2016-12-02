//
//  BWDataCommon.m
//  BWDataCommon
//
//  Created by Bob Wong on 16/3/2.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "BWDataCommon.h"
#include <sys/sysctl.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import <CoreText/CoreText.h>
#import <CoreGraphics/CoreGraphics.h>


@implementation BWDataCommon

#pragma mark - Device Information

+ (NSString *)modelId
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    
    return platform;
}

+ (NSString *)deviceName
{
    NSString *modelId = [self modelId];
    
    // The ever mysterious iFPGA
    if ([modelId isEqualToString:@"iFPGA"])        return @"iFPGA";
    
    // iPhone
    if ([modelId isEqualToString:@"iPhone1,1"])    return @"iPhone";
    if ([modelId isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([modelId hasPrefix:@"iPhone2"])            return @"iPhone 3GS";
    if ([modelId hasPrefix:@"iPhone3"])            return @"iPhone 4";
    if ([modelId hasPrefix:@"iPhone4"])            return @"iPhone 4s";
    
    if ([modelId isEqualToString:@"iPhone5,1"] ||
        [modelId isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    
    if ([modelId isEqualToString:@"iPhone5,3"] ||
        [modelId isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
    
    if ([modelId hasPrefix:@"iPhone6"])            return @"iPhone 5s";
    if ([modelId hasPrefix:@"iPhone6"])            return @"iPhone 5s";
    
    if ([modelId isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([modelId isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([modelId isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([modelId isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    // iPod
    if ([modelId hasPrefix:@"iPod1"])              return @"iPod touch";
    if ([modelId hasPrefix:@"iPod2"])              return @"iPod touch 2";
    if ([modelId hasPrefix:@"iPod3"])              return @"iPod touch 3";
    if ([modelId hasPrefix:@"iPod4"])              return @"iPod touch 4";
    if ([modelId hasPrefix:@"iPod5"])              return @"iPod touch 5";
    
    // iPad
    if ([modelId hasPrefix:@"iPad1"])              return @"iPad";
    if ([modelId isEqualToString:@"iPad2,1"] ||
        [modelId isEqualToString:@"iPad2,2"] ||
        [modelId isEqualToString:@"iPad2,3"] ||
        [modelId isEqualToString:@"iPad2,4"])      return @"iPad 2";
    
    if ([modelId isEqualToString:@"iPad3,1"] ||
        [modelId isEqualToString:@"iPad3,2"] ||
        [modelId isEqualToString:@"iPad3,3"])      return @"iPad 3";
    
    if ([modelId isEqualToString:@"iPad3,4"] ||
        [modelId isEqualToString:@"iPad3,5"] ||
        [modelId isEqualToString:@"iPad3,6"])      return @"iPad 4";
    
    if ([modelId isEqualToString:@"iPad2,5"] ||
        [modelId isEqualToString:@"iPad2,6"] ||
        [modelId isEqualToString:@"iPad2,7"])      return @"iPad mini";
    
    if ([modelId isEqualToString:@"iPad4,1"] ||
        [modelId isEqualToString:@"iPad4,2"] ||
        [modelId isEqualToString:@"iPad4,3"])      return @"iPad Air";
    
    if ([modelId isEqualToString:@"iPad5,1"] ||
        [modelId isEqualToString:@"iPad5,2"] ||
        [modelId isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    
    if ([modelId isEqualToString:@"iPad4,4"] ||
        [modelId isEqualToString:@"iPad4,5"] ||
        [modelId isEqualToString:@"iPad4,6"])      return @"iPad Mini";
    
    // Apple TV
    if ([modelId hasPrefix:@"AppleTV1"])           return @"Apple TV 1";
    if ([modelId hasPrefix:@"AppleTV2"])           return @"Apple TV 2";
    if ([modelId hasPrefix:@"AppleTV3"])           return @"Apple TV 3";
    
    if ([modelId hasPrefix:@"iPhone"])             return @"Unknown iPhone";
    if ([modelId hasPrefix:@"iPod"])               return @"Unknown iPod";
    if ([modelId hasPrefix:@"iPad"])               return @"Unknown iPad";
    if ([modelId hasPrefix:@"AppleTV"])            return @"Unknown Apple TV";
    
    // Simulator thanks Jordan Breeding
    if ([modelId hasSuffix:@"86"] || [modelId isEqual:@"x86_64"])
    {
        BOOL smallerScreen = [[UIScreen mainScreen] bounds].size.width < 768;
        return smallerScreen ? @"iPhone Simulator" : @"iPad Simulator";
    }
    
    return @"Unknown iOS device";
}


#pragma mark - Regular Expression Verify

+ (BOOL)isValidEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)isValidURL:(NSString *)url
{
    if (url==nil) return NO;
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    
    return [urlTest evaluateWithObject:url];
}

+ (BOOL)isValidMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,181,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,181,183,189
     22         */
    NSString * CT = @"^1((33|53|8[0139])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isCTMobileNumber:(NSString *)mobileNum
{
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,181,189
     22         */
    NSString * CT = @"^1((33|53|8[019])[0-9]|349)\\d{7}$";
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if ([regextestct evaluateWithObject:mobileNum] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isNumberAll:(NSString *)mobileNum
{
    NSString *num = [NSString stringWithFormat:@"^\\d{%lu}$", (unsigned long)[mobileNum length]];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", num];
    if ([regextestct evaluateWithObject:mobileNum] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isIDNumberValid:(NSString*)idnumber
{
    if ([idnumber length] != 15 &&
        [idnumber length] != 18)
    {
        return NO;
    }
    
    NSLog(@"%@",idnumber);
    int provCode = [[idnumber substringToIndex:2] intValue];
    if ( provCode < 11  ||
        (provCode > 15	&&	provCode < 21)	||
        (provCode > 23	&&	provCode < 31)	||
        (provCode > 37	&&	provCode < 41)	||
        (provCode > 46	&&	provCode < 50)	||
        (provCode > 54	&&	provCode < 61)	||
        (provCode > 65)	)
    {
        // 行政区码错误
        NSLog(@"province code error");
        return NO;
    }
    
    NSInteger len = [idnumber length];
    NSInteger year = 0;
    NSInteger month = 0;
    NSInteger day = 0;
    if (len == 15)
    {
        year = [[idnumber substringWithRange:NSMakeRange(6, 2)] intValue];
        if (year > 20)
        {
            year = 1900 + year;
        }
        else
        {
            year = 2000 + year;
        }
        
        month = [[idnumber substringWithRange:NSMakeRange(8, 2)] intValue];
        day = [[idnumber substringWithRange:NSMakeRange(10, 2)] intValue];
    }
    else if (len == 18)
    {
        year = [[idnumber substringWithRange:NSMakeRange(6, 4)] intValue];
        month = [[idnumber substringWithRange:NSMakeRange(10, 2)] intValue];
        day = [[idnumber substringWithRange:NSMakeRange(12, 2)] intValue];
    }
    if (year < 1900 ||
        year > 2200)
    {
        // 年份错误
        NSLog(@"year error");
        return NO;
    }
    
    if (month < 1 ||
        month > 12)
    {
        // 月份错误
        NSLog(@"month error");
        return NO;
    }
    
    if (day < 1 ||
        day > 31)
    {
        // 日期错误
        NSLog(@"day error");
        return NO;
    }
    
    // 检查最后一位
    NSRange xrange = [idnumber rangeOfString:@"x"];
    NSRange Xrange = [idnumber rangeOfString:@"X"];
    if ((xrange.length == 1 && xrange.location != len - 1)	||
        (Xrange.length == 1 && Xrange.location != len - 1))
    {
        NSLog(@"x position error");
        return NO;
    }
    
    if (len == 15)
    {
        return YES;
    }
    
    int Wi[17] = {7, 9, 10, 5, 8 ,4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};
    int lastBit[11] = {1, 0, 'x', 9, 8, 7, 6, 5, 4, 3, 2};
    int sum = 0;
    NSMutableString * idnum18 = [[NSMutableString alloc] initWithString:idnumber];
    
    for (int i = 0; i < 17; i++)
    {
        int nVal = [[idnum18 substringWithRange:NSMakeRange(i, 1)] intValue];
        sum += nVal*Wi[i];
    }
    
    int ret = sum%11;
    NSLog(@"ret=%d",ret);
    if ((ret == 2 && [[[idnum18 substringWithRange:NSMakeRange(17, 1)] lowercaseString] isEqualToString:@"x"])	||
        lastBit[ret] == [[idnum18 substringWithRange:NSMakeRange(17, 1)] intValue])
    {
        //		[idnum18 release];
        return YES;
    }
    else
    {
        // 校验码错误
        NSLog(@"verify code error");
        //		[idnum18 release];
        return NO;
    }
    
    //	[idnum18 release];
    return NO;
}

#pragma mark - File System

+ (NSString*)getDocumentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    return documentsDirectory;
}

+ (NSString*)getDocumentFolderByName:(NSString *)foldername
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask,
                                                         YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if ([foldername length])
    {
        documentsDirectory = [documentsDirectory stringByAppendingPathComponent:foldername];
    }
    
    NSFileManager* fileMgr = [NSFileManager defaultManager];
    BOOL isDir = YES;
    if (![fileMgr fileExistsAtPath:documentsDirectory isDirectory:&isDir])
    {
        [fileMgr createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return documentsDirectory;
}

+ (NSString *)getDocumentsPath:(NSString *)title
{
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathname = [path objectAtIndex:0];
    
    return [pathname stringByAppendingPathComponent:title];
}


#pragma mark - Time and Date

+ (NSInteger)getDayCountBetween:(NSDate *)star
                            end:(NSDate *)end
{
    NSTimeInterval timeBetween =[end timeIntervalSinceDate:star];
    int days= ((int)timeBetween)/(3600*24);
    
    return days;
}

+ (NSDate *)getCurrentDate
{
    NSDate *date = [NSDate date];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: date];
    
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    return localeDate;
}

+ (CGSize)measureFrame: (CGRect)rc
                  text:(NSAttributedString*)text
{
    if (!text	||
        [text length] <= 0)
    {
        return CGSizeMake(rc.size.width, 0);
    }
    return CGSizeMake(0,0);
}

+ (NSString *)dataByShareTime:(NSString *)sharetime
                   DateOrTime:(KLDateType)dtType
{
    
    if (sharetime && sharetime.length > 0) {
        
        NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
        [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
        [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
        NSDate* inputDate = [inputFormatter dateFromString:sharetime];
        //    NSLog(@"date=%@",inputDate);
        
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setLocale:[NSLocale currentLocale]];
        if (dtType == KLDate) {
            [outputFormatter setDateFormat:@"yyyy年MM月dd日"];
        }
        else if (dtType == KLDateTime){
            [outputFormatter setDateFormat:@"HH:mm:ss"];
        }
        NSString *str = [outputFormatter stringFromDate:inputDate];
        //    NSLog(@"testDate:%@", str);
        return str;
    }
    else
    {
        return @"";
    }
}

+ (NSString *)currentTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    
    return dateTime;
}

+ (int)timeInterval:(NSString *)startTime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date1 = [formatter dateFromString:startTime];
    NSDate *date2 = [NSDate date];
    NSTimeInterval aTimer = [date2 timeIntervalSinceDate:date1];
    return (int)aTimer;
}

+ (int)currentMonthLeave
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:[NSDate date]];
    NSInteger curDay = [components day];  // 当前的号数
    int leaveDay = 30 - (int)curDay + 1;//+1当天也算
    leaveDay = leaveDay < 0 ? 0 : leaveDay;
    
    return leaveDay;
}


#pragma mark - Encrypt and Decrypt

+ (NSString *)MD5:(NSMutableString *)str
{
    if (str == nil || [str length] <= 0) {
        return nil;
    }
    
    const char *cStr = [str UTF8String];
    unsigned char result[32];
    
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


#pragma mark - Data

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil)
    {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:jsonData
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        
        return nil;
    }
    return dic;
}


+ (NSString *)dictionaryToJson:(NSDictionary *)dict
{
    if (!dict)
        return @"";
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSString*)encodedURLParameterString:(NSString* )text
{
    if (!text || text.length <= 0)
    {
        return @"";
    }
    NSString *result = (__bridge_transfer NSString*)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                            (__bridge CFStringRef)text,
                                                                                            NULL,
                                                                                            CFSTR(":/=,!$&'()*+;[]@#?^%\"`<>{}\\|~ "),
                                                                                            kCFStringEncodingUTF8);
    return result;
}

+ (id)objectOrNilForKey:(id)aKey
         fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    if ([object isKindOfClass:[NSString class]] && [object isEqualToString:@"null"]) {
        object = nil;
    }
    return [object isEqual:[NSNull null]] ? nil : object;
}

+(NSMutableDictionary*)removeNullForNSStringFromData:(NSDictionary*)dicData
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:dicData];
    
    for(NSString *key in [dic allKeys])
    {
        if([dic[key] isKindOfClass:[NSDictionary class]])
        {
            dic[key] = [[self class] removeNullForNSStringFromData:dic[key]];
        }else if([dic[key] isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arrr = [[NSMutableArray alloc]init];
            for(id dicSub in dic[key])
            {
                if([dicSub isKindOfClass:[NSDictionary class]])
                    [arrr addObject:[[self class] removeNullForNSStringFromData:dicSub]];
                else
                    [arrr addObject:dicSub];
                
            }
            dic[key] = arrr;
        }else if ([dic[key] isKindOfClass:[NSString class]] && [dic[key] isEqualToString:@"null"]) {
            dic[key] = @"";
        }
    }
    
    
    return dic;
}

+ (double)division:(double)fistNum
            second:(double)second
{
    if(second == 0)
        return 0;
    return fistNum/second;
}

+ (NSNumber*)numCeilFloat:(double)dNum
{
    dNum = ceil(dNum*100.0)/100.0;  //向上取整
    //    dNum = trunc(dNum*100.0)/100.0; //向下取整
    //    dNum = round(dNum*100.0)/100.0; //四舍五入
    NSNumber *numFromDoub = [NSNumber numberWithFloat:dNum];
    return numFromDoub;
}

+(NSMutableAttributedString *)setColorFontForKeyWord:(NSString *)text
                                            KeyArray:(NSArray *)keyWordArray
                                            WithFont:(UIFont *)font
                                               Color:(UIColor *)keyWordColor
                                           otherFont:(UIFont *)otherFont
                                          otherColor:(UIColor *)otherColor
{
    NSMutableArray *rangeArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < [keyWordArray count]; i++) {
        NSString *keyString = [keyWordArray objectAtIndex:i];//关键词
        NSArray *array = [text componentsSeparatedByString:keyString];//字符串分割
        
        if([array count] > 1){//说明找到关键词
            NSUInteger length = keyString.length;//关键词长度
            int location = 0;//关键词起始位置
            for(int k=0; k<[array count]-1; k++){//数组的最后一个内容不需要计算
                NSString *temp = [array objectAtIndex:k];
                location += temp.length;//每个数组内的内容长度
                
                NSRange range = NSMakeRange(location, length);
                NSValue *value = [NSValue valueWithRange:range];
                [rangeArray addObject:value];
                
                location += length;//补充被分割掉的关键词长度
            }
        }
    }
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:text];
    
    UIFont *font2 = otherFont?otherFont:[UIFont systemFontOfSize:14];
    CTFontRef ctFont1 = CTFontCreateWithName((__bridge CFStringRef)font2.fontName, font2.pointSize,NULL);
    [attString addAttribute:(NSString *)(kCTFontAttributeName) value:(__bridge id)ctFont1 range:NSMakeRange(0, attString.length)];
    if (otherColor)
    {
        [attString addAttribute:(NSString *)(kCTForegroundColorAttributeName) value:(id)otherColor.CGColor range:NSMakeRange(0, attString.length)];
    }
    
    CFRelease(ctFont1);
    
    for (NSValue *value in rangeArray) {
        
        NSRange keyRange = [value rangeValue];
        if (keyWordColor)
        {
            [attString addAttribute:(NSString *)(kCTForegroundColorAttributeName) value:(id)keyWordColor.CGColor range:keyRange];
            
        }
        if (font)
        {
            CTFontRef ctFont1 = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize,NULL);
            [attString addAttribute:(NSString *)(kCTFontAttributeName) value:(__bridge id)ctFont1 range:keyRange];
            CFRelease(ctFont1);
            
        }
        
    }
    
    return attString;
}

+ (NSString *)phoneFormat:(NSString*)phoneNum
                    split:(NSString*)split
{
    NSInteger length = [phoneNum length];
    NSString *headStr,*modelStr,*footStr;
    if(length >= 3)
    {
        NSRange range1 = NSMakeRange(0, 3);
        headStr = [phoneNum substringWithRange:range1];
    }else
        headStr = phoneNum;
    
    if(length >= 7)
    {
        NSRange range2 = NSMakeRange(3, 4);
        modelStr = [phoneNum substringWithRange:range2];
    }else if(length >= 4)
    {
        modelStr = [phoneNum substringFromIndex:3];
    }else
        modelStr = @"";
    
    if(length >= 11)
    {
        NSRange range3 = NSMakeRange(7, length-7);
        footStr = [phoneNum substringWithRange:range3];
    }else if(length >= 8)
    {
        footStr = [phoneNum substringFromIndex:7];
    }else
        footStr = @"";
    
    NSMutableString *phoneStr = [[NSMutableString alloc]init];
    if([headStr length] > 0)
        [phoneStr appendString:headStr];
    if([modelStr length] > 0)
    {
        [phoneStr appendString:split];
        [phoneStr appendString:modelStr];
    }
    if([footStr length]>0)
    {
        [phoneStr appendString:split];
        [phoneStr appendString:footStr];
    }
    
    return phoneStr;
}

+ (NSMutableArray *)sortedArrayUsingComparator:(NSArray *)soreArray
                                       SoreKey:(NSString *)key
{
    if(!soreArray || soreArray.count <= 0)
        return [NSMutableArray array];
    
    
    NSMutableArray *sortedArray = nil;
    NSArray *sort = [soreArray sortedArrayUsingComparator: ^(NSDictionary *dict1, NSDictionary *dict2){
        
        if (dict1[key] && [dict1[key] respondsToSelector:@selector(integerValue)] && dict2[key] && [dict2[key] respondsToSelector:@selector(integerValue)]) {
            
            NSInteger num1 = [dict1[key] integerValue];
            NSInteger num2 = [dict2[key] integerValue];
            
            if(num1 > num2 ){
                return NSOrderedDescending;
            }
            if(num1 < num2){
                return NSOrderedAscending;
            }
            return NSOrderedSame;
        }
        return NSOrderedSame;
    }];
    
    sortedArray = [[NSMutableArray alloc] initWithArray:sort];
    return sortedArray;
}

static const float EPSN = 0.00001;
+ (BOOL)isFloatA:(float)floatA
   equalToFloatB:(float)floatB
{
    if (floatA>=floatB- EPSN && floatA <= floatB+ EPSN) {
        return YES;
    }
    return NO;
}

@end
