//
//  BWHomeVC.m
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BWHomeVC.h"
#import "NSString+YYAdd.h"
#import "UIScrollView+YYAdd.h"
#import "YYTextView.h"
#import "IQKeyboardManager.h"
#import "IQUIView+IQKeyboardToolbar.h"
#import "IQBarButtonItem.h"
#import "IQToolbar.h"
#import "YYTextView+BWExtension.h"
#import "IQTitleBarButtonItem.h"

#define kUITextView

@interface BWHomeVC () <UITableViewDataSource, UITableViewDelegate, UITextViewDelegate, YYTextViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation BWHomeVC

- (void)buttonAct:(UIButton *)sender
{
    
}

//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
//    return [UITextView bw_textView:textView limitedLength:5 shouldChangeTextInRange:range replacementText:text];
//}

#ifdef kUITextView

- (void)textViewDidChange:(UITextView *)textView {
    //    textView.textContainerInset = UIEdgeInsetsMake(8, 0, 8, 0);
    
    CGFloat h = textView.contentSize.height + 8 * 2;
    
    [UIView animateWithDuration:.25 animations:^{
        [textView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(h);
        }];
        
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        if (finished) {
            [self.scrollView scrollToBottomAnimated:NO];
        }
    }];
    
    NSLog(@"h_single is %f", h);
}

#else

- (void)textViewDidChange:(YYTextView *)textView {
    //    textView.textContainerInset = UIEdgeInsetsMake(8, 0, 8, 0);
    
    CGFloat h = textView.contentSize.height;
    
    [UIView animateWithDuration:.25 animations:^{
        [textView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(h);
        }];
        
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];

    }];
    
    NSLog(@"h_single is %f", h);
}

#endif

- (void)buttonDoneAct:(UIButton *)sender
{
    [self.view endEditing:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [UITextField bw_userNameTextField:textField shouldChangeCharactersInRange:range replacementString:string];
}

- (void)didChange:(NSNotification *)notification {
    UITextField *textfield = notification.object;
}

- (void)textViewDidChangeNotification:(NSNotification *)notification {
    UITextView *textView = notification.object;
    NSLog(@"textViewDidChangeNotification");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Home";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;

    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].canAdjustTextView = YES;
    
    
//    UITextField *textField = [[UITextField alloc] init];
//    textField.delegate = self;
//    textField.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:textField];
//    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(30);
//        make.right.mas_equalTo(-30);
//        make.bottom.mas_equalTo(0);
//        make.height.mas_equalTo(50);
//    }];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
//    return;
    
    
    UIFont *font = [UIFont systemFontOfSize:14.0];
    CGFloat h_single = [@"好" heightForFont:font width:100.0];
    NSLog(@"h_single is %f", h_single);
    
    
    UIScrollView *viewContainer = [[UIScrollView alloc] init];
    self.scrollView = viewContainer;
    viewContainer.backgroundColor = [UIColor grayColor];
    [self.view addSubview:viewContainer];
    
#ifndef kUITextView
    YYTextView *textView = [[YYTextView alloc] init];
    textView.delegate = self;
    textView.font = font;
    textView.backgroundColor = [UIColor greenColor];
    [viewContainer addSubview:textView];
    textView.placeholderFont = font;
    textView.placeholderLabel.text = @"请输入";
    textView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);

    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(150);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(ceil(h_single));
    }];
    
    [viewContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(100);
        make.bottom.mas_equalTo(textView).offset(20);
    }];
    
    // 自定义IQKeyboard的Done Button按钮样式的ToolBar
    IQTitleBarButtonItem *itemTitle = [[IQTitleBarButtonItem alloc] initWithTitle:textView.placeholderLabel.text];
    IQBarButtonItem *doneButton =[[IQBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(buttonDoneAct:)];
    IQBarButtonItem *itemFlexible = [[IQBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    IQToolbar *toolbar = [[IQToolbar alloc] init];
    toolbar.items = @[itemTitle, itemFlexible, doneButton];
    textView.inputAccessoryView = toolbar;
    
#else
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChangeNotification:) name:UITextViewTextDidChangeNotification object:nil];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.delegate = self;
    textView.font = [UIFont systemFontOfSize:15];
    textView.layer.borderColor  = [UIColor colorWithHexString:@"f9f9f9"].CGColor;
    textView.layer.borderWidth = 0.5;
    //    textView.scrollsToTop = NO;
    textView.backgroundColor = [UIColor greenColor];
    [viewContainer addSubview:textView];
    textView.placeholder = @"评论";
    textView.placeholderLabel.font = font;
    textView.placeholderLabel.textColor = [UIColor blueColor];
//    textView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    CGFloat height = 34;
    CGFloat h_2 = textView.contentSize.height;
    NSLog(@"h_2 is %f", h_2);
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - 20 * 2);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(h_single + 8 * 2);
    }];
    
    [viewContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        
        make.right.mas_equalTo(textView.mas_right);
        make.bottom.mas_equalTo(textView).offset(20);
    }];
    
#endif
    
/* ===========================
    UIFont *font = [UIFont systemFontOfSize:17.0];
    CGFloat h_single = [@"好" heightForFont:font width:100.0];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.delegate = self;
    textView.text = @"我是第一行我是第一行";
    textView.font = font;
    textView.backgroundColor = [UIColor greenColor];
    textView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-60);
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(h_single);
    }];
    
    NSLog(@"contentSize is %f, %f", textView.contentSize.width, textView.contentSize.height);
    UIEdgeInsets insets = textView.textContainerInset;
    NSLog(@"textContainerInset is %f, %f, %f, %f", insets.top, insets.left, insets.bottom, insets.right);
    NSLog(@"h_single is %f", h_single);
    
    
//    [textView scrollToBottom];
    
    textView.contentSize = CGSizeMake(textView.contentSize.width, h_single);
    NSLog(@"after contentSize is %f, %f", textView.contentSize.width, textView.contentSize.height);
    [textView setNeedsLayout];
    [textView layoutIfNeeded];
    [textView layoutSubviews];
    
    
    
=========================== */

//    NSString *text = @"这是文本这是文本这是文本这是文本这是文本这是文本";
//    UILabel *label = [[UILabel alloc] init];
//    label.text = text;
//    label.numberOfLines = 1;
//    label.textAlignment = NSTextAlignmentLeft;
//    label.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:label];
//    
//    CGFloat width = [text bw_widthForFont:label.font];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(10);
//        make.width.mas_equalTo(width);
//        make.top.mas_equalTo(100);
//    }];
    
//    UITextView *textView = [[UITextView alloc] init];
////    textView.textColor = <#UIColor#>;
////    <#textView#>.font = <#UIFont#>;
//    textView.backgroundColor = [UIColor greenColor];
//    textView.placeholder = @"请输入";
//    textView.placeholderLabel.textColor = [UIColor blueColor];
//    textView.placeholderLabel.font = [UIFont systemFontOfSize:20.0];
//    [self.view addSubview:textView];
//    
//    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(20);
//        make.width.mas_equalTo(200);
//        make.top.mas_equalTo(100);
//        make.height.mas_equalTo(200);
//    }];
    
//    NSString *text = @"你有 0.00 块钱";
//    NSString *textChange = @"0.00";
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 50)];
//    label.text = text;
//    label.numberOfLines = 1;
////    [label bw_setAttributeLabelWithText:@"你有 0.00 块钱" formatText:textChange font:[UIFont systemFontOfSize:25.0] textColor:[UIColor blueColor]];
//    
//    [label bw_setAttributeLabelWithText:text normalColor:[UIColor grayColor] normalFont:[UIFont systemFontOfSize:12.0] highlightedText:textChange highlightedColor:[UIColor greenColor] highlightedFont:[UIFont systemFontOfSize:20.0]];
//    
//    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:label.attributedText];
//    [attrStr setAttributes:@{NSForegroundColorAttributeName: [UIColor blueColor]} range:NSMakeRange(0, attrStr.length)];
//    
//    label.attributedText = attrStr;
//    
//    [self.view addSubview:label];

    
//    UIButton *button = [UIButton bw_buttonTitleUnderLineWithTitle:@"查看" titleColor:[UIColor blueColor] titleFont:[UIFont systemFontOfSize:17.0]];
//    [button addTarget:self action:@selector(buttonAct:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//    
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(12);
//        make.right.mas_equalTo(-20);
//        make.top.mas_equalTo(100);
//        make.height.mas_equalTo(50);
//    }];
//    
//    return ;
    
    
//    UITextField *tf = [UITextField bw_textFieldBorderStyleNoneClearButtonModeWhileEditingWithPlaceholder:@"请输入" holderColor:[UIColor blueColor] holderFont:[UIFont systemFontOfSize:12.0] textColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:12.0]];
//    tf.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:tf];
//    
//    [tf mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(10);
//        make.width.mas_equalTo(200);
//        make.top.mas_equalTo(100);
//        make.height.mas_equalTo(50);
//    }];
    
//    NSString *text = @"你有 0.00 块钱";
//    NSString *textChange = @"0.00";
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 50)];
//    label.text = text;
//    label.numberOfLines = 1;
//    [label bw_setAttributeLabelWithText:@"你有 0.00 块钱" formatText:textChange font:[UIFont systemFontOfSize:25.0] textColor:[UIColor blueColor]];
//    [self.view addSubview:label];
//
//    NSRange range = [text rangeOfString:textChange];
//    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:label.attributedText];
//    [attrStr replaceCharactersInRange:range withString:@"96.00"];
//    label.attributedText = attrStr;
}

- (UITableView *)tableView {
    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>) style:<#UITableViewStyle#>];
//        _tableView.dataSource = <#UITableViewDataSource#>;
//        _tableView.delegate = <#UITableViewDelegate#>;
    }
    return _tableView;
}

@end
