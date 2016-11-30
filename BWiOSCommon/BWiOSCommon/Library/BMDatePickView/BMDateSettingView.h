//
//  BMDateSettingView.h
//  BMDatePickViewDemo
//
//  Created by Daredos on 16/6/16.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMDateSettingView : UIView

+ (instancetype)BMDateSettingViewWithFrame:(CGRect)frame
                              confirmBlock:(dispatch_block_t)confirmBlock
                               cancelBlock:(dispatch_block_t)cancelBlock;
@end
