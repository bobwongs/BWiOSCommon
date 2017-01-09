//
//  BWCustomPickerView.h
//  BMWash
//
//  Created by BobWong on 16/12/20.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 自定义Picker View，当前只支持单个Components的
 */
@interface BWCustomPickerView : UIView

@property (nonatomic, strong) NSArray *dataSource;  // 一定是Title数组

+ (instancetype)customPickerViewWithDataSource:(NSArray *)dataSource
                                 selectedBlock:(void (^)(NSInteger))selectedBlock
                                   confirmBlock:(void (^)(NSInteger))confirmBlock
                                   cancelBlock:(dispatch_block_t)cancelBlock;
- (void)show;
- (void)reloadPickerView;
- (void)selectFirst;

@end
