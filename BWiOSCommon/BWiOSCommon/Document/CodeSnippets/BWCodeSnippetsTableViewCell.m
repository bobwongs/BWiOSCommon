//
//  BWCodeSnippetsTableViewCell.m
//  BWiOSCommon
//
//  Created by BobWong on 16/12/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BWCodeSnippetsTableViewCell.h"

@implementation BWCodeSnippetsTableViewCell

#pragma mark - 生命周期

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // ---------- BWSetSelfWidthEqualToScreenWidthTemplate ----------
        CGRect frame = self.frame;
        frame.size.width = SCREEN_WIDTH;
        self.frame = frame;
        
        
        [self setUI];
        [self setConstraints];
    }
    return self;
}

#pragma mark - Getter and Setter

#pragma mark - 事件响应

#pragma mark - 共有方法

#pragma mark - 私有方法

- (void)setUI {
    <#Code#>
}

- (void)setConstraints {
    
    // ---------- BWMasonryTableContentViewTemplate ----------
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

@end
