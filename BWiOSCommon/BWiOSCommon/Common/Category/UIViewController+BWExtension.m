//
//  UIViewController+BWExtension.m
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "UIViewController+BWExtension.h"

@implementation UIViewController (BWExtension)

- (void)bw_setNavigationVCTabBarItemBadge:(NSInteger)badgeNum {
    NSString *badgeString = nil;  // If is nil, the badge will not show
    if (badgeNum >= 100) {
        badgeString = @"99+";
    }
    else if (badgeNum != 0) {
        badgeString = @(badgeNum).stringValue;
    }
    self.navigationController.tabBarItem.badgeValue = badgeString;
}

- (void)bw_setVCTabBarItemBadge:(NSInteger)badgeNum {
    NSString *badgeString = nil;
    if (badgeNum >= 100) {
        badgeString = @"99+";
    }
    else if (badgeNum != 0) {
        badgeString = @(badgeNum).stringValue;
    }
    self.tabBarItem.badgeValue = badgeString;
}

- (void)bw_updateConstraintsToHideView:(UIView *)view
                                isShow:(BOOL)isShow
                                height:(CGFloat)height {
//    if (isShow) {
//        [view mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(height);
//        }];
//    } else {
//        [view mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(0);
//        }];
//    }
}

@end
