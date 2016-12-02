//
//  BWHudUtil.m
//  BWHudUtil
//
//  Created by BobWong on 15/7/29.
//  Copyright (c) 2015年 Bob Wong Studio. All rights reserved.
//

#import "BWHudUtil.h"
#import "MBProgressHUD.h"


#define TIME_INTERVAL 2.0  // 提示文本的显示时间
#define HUD_OPACITY 0.8  // 透明度


@interface BWHudUtil ()

@end

@implementation BWHudUtil

#pragma mark - Loading Indicator

+ (void)showDefaultLoadingInView:(UIView *)view
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"加载中...";
    hud.opacity = HUD_OPACITY;
}

+ (void)hideDefaultLoadingInView:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

#pragma mark - Alert Text

+ (void)showDefaultWithText:(NSString *)text
                     inView:(UIView *)view
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.opacity = HUD_OPACITY;
    [hud hide:YES afterDelay:TIME_INTERVAL];
}

+ (void)showDefaultWithText:(NSString *)text
                 detailText:(NSString *)detailText
                     inView:(UIView *)view
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.detailsLabelText = detailText;
    hud.opacity = HUD_OPACITY;
    [hud hide:YES afterDelay:TIME_INTERVAL];
}

#pragma mark - Custom Alert View

+ (void)showCompletedInView:(UIView *)view
{
    UIView * customView = [[UIView alloc] init];
    customView.frame = CGRectMake(0, 0, 100, 100);
    
    UIImageView * iconIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alert_completed"]];
    iconIV.center = CGPointMake(CGRectGetWidth(customView.frame) / 2, CGRectGetHeight(customView.frame) / 2);
    [customView addSubview:iconIV];
    
    [[self class] showCustomView:customView text:@"完成" inView:view];
}

+ (void)showErrorInView:(UIView *)view
{
    UIView * customView = [[UIView alloc] init];
    customView.frame = CGRectMake(0, 0, 100, 100);
    
    UIImageView * iconIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alert_error"]];
    iconIV.center = CGPointMake(CGRectGetWidth(customView.frame) / 2, CGRectGetHeight(customView.frame) / 2);
    [customView addSubview:iconIV];
    
    [[self class] showCustomView:customView text:@"错误" inView:view];
}

+ (void)showCustomView:(UIView *)customView
                  text:(NSString *)text
                inView:(UIView *)view
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = customView;
    hud.labelText = text;
    hud.opacity = HUD_OPACITY;
    [hud hide:YES afterDelay:TIME_INTERVAL];
}

#pragma mark - UIAlertView

+ (void)showAlertViewWithTitle:(NSString *)title
                       message:(NSString *)message
                         style:(UIAlertViewStyle)style
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSArray *)otherButtonTitles
                      tapBlock:(UIAlertViewCompletionBlock)tapBlock
{
    [UIAlertView showWithTitle:title message:message style:style cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles tapBlock:tapBlock];
}

+ (void)showAlertViewDefaultStyleWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelButtonTitle
                         otherButtonTitles:(NSArray *)otherButtonTitles
                                  tapBlock:(UIAlertViewCompletionBlock)tapBlock
{
    [UIAlertView showWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles tapBlock:tapBlock];
}

@end
