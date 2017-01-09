//
//  BWCustomPickerView.m
//  BMWash
//
//  Created by BobWong on 16/12/20.
//  Copyright © 2016年 月亮小屋（中国）有限公司. All rights reserved.
//

#import "BWCustomPickerView.h"
#import "UIButton+BWExtension.h"

@interface BWCustomPickerView () <UIPickerViewDataSource, UIPickerViewDelegate>

/*
 UI
 */
@property (nonatomic, strong) UIView *viewBg;  ///< 阴影
@property (nonatomic, strong) UIView *viewContainer;  ///< 容器
@property (nonatomic, strong) UIView *viewTop;  ///< 顶部背景
@property (nonatomic, strong) UIButton *btnCancel;  ///< 取消
@property (nonatomic, strong) UIButton *btnConfirm;  ///< 确认
@property (nonatomic, strong) UIPickerView *pickerView;  ///< Picker

/*
 Data
 */
@property (nonatomic, copy) void(^blockSelected)(NSInteger);  ///< 选中
@property (nonatomic, copy) void(^blockConfirm)(NSInteger);  ///< 确定
@property (nonatomic, copy) dispatch_block_t blockCancel;  ///< 取消

@property (nonatomic, assign) NSInteger selectedIndex;  ///< 选中Index

@end

@implementation BWCustomPickerView

#pragma mark - Initialization

+ (instancetype)customPickerViewWithDataSource:(NSArray *)dataSource
                                 selectedBlock:(void (^)(NSInteger))selectedBlock
                                  confirmBlock:(void (^)(NSInteger))confirmBlock
                                   cancelBlock:(dispatch_block_t)cancelBlock {
    BWCustomPickerView *viewPicker = [BWCustomPickerView new];
    viewPicker.blockSelected = selectedBlock;
    viewPicker.blockConfirm = confirmBlock;
    viewPicker.blockCancel = cancelBlock;
    viewPicker.dataSource = dataSource;
    [viewPicker setUI];
    [viewPicker setConstraints];
    
    [viewPicker.pickerView selectRow:0 inComponent:0 animated:NO];  // 默认选择第一个
    return viewPicker;
}

#pragma mark - Public Method

- (void)show {
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    _selectedIndex = [_pickerView selectedRowInComponent:0];
    
    // 优化，待加显示和隐藏动画
}

- (void)reloadPickerView {
    [self.pickerView reloadAllComponents];
}

- (void)selectFirst {
    [self.pickerView selectRow:0 inComponent:0 animated:YES];  // 选择第一个
}

#pragma mark - Action

- (void)buttonCancelAct:(UIButton *)sender
{
    [self removeFromSuperview];
}

- (void)buttonConfirmAct:(UIButton *)sender
{
    if (self.blockConfirm) self.blockConfirm(_selectedIndex);
    
    [self removeFromSuperview];
}

#pragma mark - Pirvate Method

- (void)setUI
{
    _viewBg = [UIView new];
    _viewBg.backgroundColor = [UIColor blackColor];
    _viewBg.alpha = 0.4;
    
    _viewContainer = [UIView new];
    _viewContainer.backgroundColor = [UIColor whiteColor];
    
    _viewTop = [UIView new];
    _viewTop.backgroundColor = [UIColor whiteColor];
    
    _btnCancel = [UIButton bw_buttonWithTitle:@"取 消" titleColor:[UIColor grayColor] titleFont:[UIFont systemFontOfSize:14.0]];
    _btnCancel.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_btnCancel addTarget:self action:@selector(buttonCancelAct:) forControlEvents:UIControlEventTouchUpInside];
    _btnConfirm = [UIButton bw_buttonWithTitle:@"确 认" titleColor:[UIColor blueColor] titleFont:[UIFont systemFontOfSize:14.0]];
    _btnConfirm.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_btnConfirm addTarget:self action:@selector(buttonConfirmAct:) forControlEvents:UIControlEventTouchUpInside];
    
    _pickerView = [UIPickerView new];
    _pickerView.backgroundColor = [UIColor whiteColor];
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    
    [self addSubview:_viewBg];
    [self addSubview:_viewContainer];
    
    [_viewContainer addSubview:_viewTop];
    [_viewContainer addSubview:_btnCancel];
    [_viewContainer addSubview:_btnConfirm];
    [_viewContainer addSubview:_pickerView];
}

- (void)setConstraints
{
    self.frame = [UIScreen mainScreen].bounds;
    
    [_viewBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [_viewContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(44 + 180);
    }];
    
    [_viewTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    [_btnCancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.width.mas_equalTo(40);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    [_btnConfirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-16);
        make.width.mas_equalTo(40);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
    [_pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.viewTop.mas_bottom);
        make.bottom.mas_equalTo(0);
    }];
}

#pragma mark - Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _dataSource ? _dataSource.count : 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _dataSource[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // 滚动选中
    _selectedIndex = row;
    if (self.blockSelected) self.blockSelected(row);
}

@end
