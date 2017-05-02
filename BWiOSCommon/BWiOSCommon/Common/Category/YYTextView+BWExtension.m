//
//  YYTextView+BWExtension.m
//  BWiOSCommon
//
//  Created by BobWong on 16/12/23.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "YYTextView+BWExtension.h"
#import <objc/runtime.h>

@implementation YYTextView (BWExtension)

#pragma mark - Swizzle Dealloc

+ (void)load {
    [super load];
    
    // is this the best solution?
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(swizzledDealloc)));
}

- (void)swizzledDealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    UILabel *label = objc_getAssociatedObject(self, @selector(placeholderLabel));
    if (label) {
            @try {
                [self removeObserver:self forKeyPath:@"text"];
            }
            @catch (NSException *exception) {
                // Do nothing
            }
    }
    [self swizzledDealloc];
}

#pragma mark - Class Methods
#pragma mark `defaultPlaceholderColor`

+ (UIColor *)defaultPlaceholderColor {
    static UIColor *color = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextField *textField = [[UITextField alloc] init];
        textField.placeholder = @" ";
        color = [textField valueForKeyPath:@"_placeholderLabel.textColor"];
    });
    return color;
}

#pragma mark - Properties
#pragma mark `placeholderLabel`

- (UILabel *)placeholderLabel {
    UILabel *label = objc_getAssociatedObject(self, @selector(placeholderLabel));
    if (!label) {
        label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = [self.class defaultPlaceholderColor];
        label.font = self.font;
        label.userInteractionEnabled = NO;
        objc_setAssociatedObject(self, @selector(placeholderLabel), label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    return label;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    [self updatePlaceholderLabel];
}

#pragma mark - Update

- (void)updatePlaceholderLabel {
    if (self.text.length) {
        self.placeholderLabel.hidden = YES;
        return;
    }
   
    self.placeholderLabel.hidden = NO;
}

@end
