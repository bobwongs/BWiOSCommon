//
//  UIButton+BWExtension.m
//  BWTools
//
//  Created by BobWong on 16/7/28.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "UIButton+BWExtension.h"
#import <objc/runtime.h>

@implementation UIButton (BWExtension)

+ (UIButton *)buttonWithImage:(UIImage *)image
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    return button;
}

+ (UIButton *)buttonWithNormalImage:(UIImage *)normalImage highlightedImage:(UIImage *)highlightedImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    return button;
}

+ (UIButton *)bw_buttonWithTitle:(NSString *)titleBtn
                      titleColor:(UIColor *)colorTitle
                       titleFont:(UIFont *)fontTitle
            backgroundImageColor:(UIColor *)colorBg {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:titleBtn forState:UIControlStateNormal];
    [button setTitleColor:colorTitle forState:UIControlStateNormal];
    button.titleLabel.font = fontTitle;
    [button setBackgroundImage:[[self class] imageWithColor:colorBg width:1.0 height:1.0] forState:UIControlStateNormal];
    return button;
}

+ (UIButton *)bw_buttonLeftTitleAndRightArrowWithTitle:(NSString *)title
{
    return [UIButton bw_buttonWithLeftTitle:title rightImage:[UIImage imageNamed:@"icon_right_arrow"]];
}

+ (UIButton *)bw_buttonWithLeftTitle:(NSString *)title
                          rightImage:(UIImage *)image
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UILabel *labelTitle = [[UILabel alloc] init];
    button.labelTitle = labelTitle;
    labelTitle.text = title;
    labelTitle.numberOfLines = 1;
    labelTitle.textAlignment = NSTextAlignmentRight;
    labelTitle.font = [UIFont systemFontOfSize:13.0];
    labelTitle.textColor = [UIColor blackColor];
    [button addSubview:labelTitle];
    
    UIImageView *imageViewArrow = [[UIImageView alloc] init];
    imageViewArrow.image = image;
    imageViewArrow.contentMode = UIViewContentModeScaleAspectFit;
    [button addSubview:imageViewArrow];
    
//    [imageViewArrow mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(0);
//        make.width.mas_equalTo(8);
//        make.centerY.mas_equalTo(button.mas_centerY);
//        make.height.mas_equalTo(13);
//    }];
//    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(imageViewArrow.mas_left).offset(-8);
//        make.left.mas_equalTo(button.mas_left);
//        make.top.bottom.mas_equalTo(0);
//    }];
    
    return button;
}

+ (UIButton *)bw_buttonTitleUnderLineWithTitle:(NSString *)titleButton
                                    titleColor:(UIColor *)colorTitle
                                     titleFont:(UIFont *)fontTitle
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:titleButton];
    NSDictionary *dictAttr = @{
                               NSFontAttributeName: fontTitle,
                               NSForegroundColorAttributeName: colorTitle,
                               NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]
                               };
    [attributedString setAttributes:dictAttr range:NSMakeRange(0, attributedString.length)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setAttributedTitle:attributedString forState:UIControlStateNormal];
    return button;
}

static const char keyLabelTitle = '\0';
- (void)setLabelTitle:(UILabel *)labelTitle
{
    objc_setAssociatedObject(self, &keyLabelTitle, labelTitle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)labelTitle
{
    return objc_getAssociatedObject(self, &keyLabelTitle);
}


+ (UIButton *)bw_buttonWithTitle:(NSString *)titleButton
             titleAndBorderColor:(UIColor *)colorTitleAndBorder
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:titleButton forState:UIControlStateNormal];
    [button setTitleColor:colorTitleAndBorder forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    
    button.layer.cornerRadius = 3.0;
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = colorTitleAndBorder.CGColor;
    
    return button;
}

+ (UIButton *)bw_buttonWithTitle:(NSString *)titleButton
                      titleColor:(UIColor *)colorTitle
                       titleFont:(UIFont *)fontTitle
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:titleButton forState:UIControlStateNormal];
    [button setTitleColor:colorTitle forState:UIControlStateNormal];
    button.titleLabel.font = fontTitle;
    
    return button;
}

- (UIButton *)bw_initWithContactNumber:(NSString *)contactNumber
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:self action:@selector(buttonActionDialNumber:) forControlEvents:UIControlEventTouchUpInside];
    
    [button bw_setButtonTitleWithContactNumber:contactNumber];
    
    return button;
}

- (void)bw_setButtonTitleWithContactNumber:(NSString *)contactNumber
{
    if (!contactNumber || [contactNumber isEqualToString:self.titleLabel.text]) {
        return ;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:contactNumber];
    NSDictionary *dictAttr = @{
                               NSFontAttributeName: [UIFont systemFontOfSize:13.0],
                               NSForegroundColorAttributeName: [UIColor colorWithRed:0 green:0.478 blue:1 alpha:1],
                               NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]
                               };
    [attributedString setAttributes:dictAttr range:NSMakeRange(0, attributedString.length)];
    [self setAttributedTitle:attributedString forState:UIControlStateNormal];
}

- (void)bw_setButtonTitleUnderLineWithTitle:(NSString *)titleButton
                                 titleColor:(UIColor *)colorTitle
                                  titleFont:(UIFont *)fontTitle
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:titleButton];
    NSDictionary *dictAttr = @{
                               NSFontAttributeName: fontTitle,
                               NSForegroundColorAttributeName: colorTitle,
                               NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]
                               };
    [attributedString setAttributes:dictAttr range:NSMakeRange(0, attributedString.length)];
    [self setAttributedTitle:attributedString forState:UIControlStateNormal];
}

- (void)buttonActionDialNumber:(UIButton *)sender
{
//    NSString *phoneNumber = sender.titleLabel.text;
//    if (!phoneNumber) {
//        return;
//    }
//    //获取手机运营商
//    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
//    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
//    NSString *isoCountryCode = [carrier mobileCountryCode];
//    if (isoCountryCode.length >0) {
//        //打电话
//        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phoneNumber];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
//    }else{
//        [SVProgressHUD showErrorWithStatus:@"未安装SIM卡"];
//    }
}

- (void)bw_setButtonWithInputedTitle:(NSString *)titleInputed
                        defaultTitle:(NSString *)titleDefault
{
    NSString *titleButton = titleInputed ? titleInputed : titleDefault;
    [self setTitle:titleButton forState:UIControlStateNormal];
    
    UIColor *colorTitle = (titleInputed && ![titleInputed isEqualToString:titleDefault]) ? [UIColor blackColor] : [UIColor grayColor];
    [self setTitleColor:colorTitle forState:UIControlStateNormal];
}

+ (UIButton *)bw_buttonWithTitle:(NSString *)title
                       titleFont:(UIFont *)fontTitle
                      titleColor:(UIColor *)colorTitle
                     normalImage:(UIImage *)imageNormal
                highlightedImage:(UIImage *)imageHighlighted {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:colorTitle forState:UIControlStateNormal];
    button.titleLabel.font = fontTitle;
    [button setImage:imageNormal forState:UIControlStateNormal];
    if (imageHighlighted) [button setImage:imageHighlighted forState:UIControlStateHighlighted];
    return button;
}

#pragma mark - Tool

+ (UIImage *)imageWithColor:(UIColor*)color
                      width:(CGFloat)width
                     height:(CGFloat)height {
    CGRect rect = CGRectMake(0.0, 0.0, width, height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
