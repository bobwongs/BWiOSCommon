//
//  BWImageAndTitleButton.h
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BWImageAndTitleButton : UIButton

@property (nonatomic, strong) UIImageView *ivIcon;  ///< 图标
@property (nonatomic, strong) UILabel *lbTitle;  ///< 标题
@property (nonatomic, strong) UIImageView *ivArrow;  ///< 箭头

@end
