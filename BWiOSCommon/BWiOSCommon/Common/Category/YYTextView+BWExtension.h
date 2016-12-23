//
//  YYTextView+BWExtension.h
//  BWiOSCommon
//
//  Created by BobWong on 16/12/23.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <YYText/YYText.h>

@interface YYTextView (BWExtension)

@property (nonatomic, readonly) UILabel *placeholderLabel;  //!< 提示文本Label

+ (UIColor *)defaultPlaceholderColor;  //!< 获得默认提示文本的颜色

@end
