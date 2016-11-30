//
//  UILabel+BWExtension.h
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (BWExtension)

/*
 Creation
 */
+ (UILabel *)bw_labelSingleLineLeftAlignmentWithDefaultText:(NSString *)text;  //!< 创建，单行，左对齐的UILabel
+ (UILabel *)bw_labelSingleLineRightAlignmentWithDefaultText:(NSString *)text;  //!< 创建，单行，右对齐的UILabel

/*
 Customize label style
 */
- (void)bw_setTextPrefixWithStar;  //!< 设置文本有红色的*作为前缀
- (void)bw_setTextSuffixWithStar;  //!< 设置文本有红色的*作为后缀

- (void)bw_setLabelTitleWithInputedTitle:(NSString *)titleInputed
                            defaultTitle:(NSString *)titleDefault;  // 给label设置文本，titleInputed不为空则显示titleInputed，为空则显示titleDefault，文本颜色也会有对应的变化，示例：扫码按钮中的label

@end
