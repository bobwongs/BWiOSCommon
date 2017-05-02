//
//  UIViewController+BWExtension.h
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BWExtension)

- (void)bw_setNavigationVCTabBarItemBadge:(NSInteger)badgeNum;  ///< Set the badge of self's navigationVC
- (void)bw_setVCTabBarItemBadge:(NSInteger)badgeNum;  ///< Set the badge of self

/**
 Set the view show or hidden by setting the constraints
 */
- (void)bw_updateConstraintsToHideView:(UIView *)view
                                isShow:(BOOL)isShow
                                height:(CGFloat)height;

@end
