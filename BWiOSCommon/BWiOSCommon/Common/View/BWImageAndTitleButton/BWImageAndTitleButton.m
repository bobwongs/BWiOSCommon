//
//  BWImageAndTitleButton.m
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BWImageAndTitleButton.h"

@implementation BWImageAndTitleButton

#pragma mark - View Cylce

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
        [self setConstraints];
    }
    
    return self;
}

#pragma mark - Pirvate Method

- (void)setUI
{
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.ivIcon];
    [self addSubview:self.lbTitle];
    [self addSubview:self.ivArrow];
}

- (void)setConstraints
{
//    [self.ivIcon mas_makeConstraints:^(MASConstraintMaker *make) {
//        @strongify(self);
//        make.left.mas_equalTo(10);
//        make.width.mas_equalTo(20);
//        make.centerY.mas_equalTo(self.mas_centerY);
//        make.height.mas_equalTo(20);
//    }];
//    [self.lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        @strongify(self);
//        make.left.mas_equalTo(self.ivIcon.mas_right).offset(10);
//        make.right.mas_equalTo(self.ivArrow).offset(-10);
//        make.centerY.mas_equalTo(self.mas_centerY);
//    }];
//    [self.ivArrow mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(-10);
//        make.width.mas_equalTo(7);
//        make.centerY.mas_equalTo(self.mas_centerY);
//        make.height.mas_equalTo(12);
//    }];
}

#pragma mark - Getter and Setter

- (UIImageView *)ivIcon {
    if (!_ivIcon) {
        _ivIcon = [[UIImageView alloc] init];
        _ivIcon.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _ivIcon;
}

- (UILabel *)lbTitle {
    if (!_lbTitle) {
        _lbTitle = [[UILabel alloc] init];
        _lbTitle.textAlignment = NSTextAlignmentLeft;
        _lbTitle.font = [UIFont systemFontOfSize:15.0];
        _lbTitle.textColor = [UIColor blackColor];
    }
    return _lbTitle;
}

- (UIImageView *)ivArrow {
    if (!_ivArrow) {
        _ivArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_mcd_arrow_right"]];
        _ivArrow.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _ivArrow;
}

@end
