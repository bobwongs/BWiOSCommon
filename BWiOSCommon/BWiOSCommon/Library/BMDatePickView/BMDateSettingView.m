//
//  BMDateSettingView.m
//  BMDatePickViewDemo
//
//  Created by Daredos on 16/6/16.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

#import "BMDateSettingView.h"
#import <objc/runtime.h>

@interface BMDateSettingView ()

@property (copy, nonatomic) dispatch_block_t confirmBlock;
@property (copy, nonatomic) dispatch_block_t cancelBlock;
@end

@implementation BMDateSettingView

- (IBAction)cancelButtonClick {
    
    self.cancelBlock ? self.cancelBlock() : nil;
}

- (IBAction)confirmButtonClick {

    self.confirmBlock ? self.confirmBlock() : nil;
}

#pragma mark -
#pragma mark - init
#pragma mark - 生命周期
#pragma mark - getters setters
#pragma mark - 系统delegate
#pragma mark - 自定义delegate
#pragma mark - 公有方法

+ (instancetype)BMDateSettingViewWithFrame:(CGRect)frame
                              confirmBlock:(dispatch_block_t)confirmBlock
                               cancelBlock:(dispatch_block_t)cancelBlock {
    
    BMDateSettingView *dateSettingView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    dateSettingView.frame = frame;
    dateSettingView.confirmBlock = confirmBlock;
    dateSettingView.cancelBlock = cancelBlock;
    return dateSettingView;
}
#pragma mark - 私有方法
#pragma mark - 事件响应
@end
