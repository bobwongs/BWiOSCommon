//
//  BWUICodeSnippets.m
//  BWCodeSnippets
//
//  Created by BobWong on 16/8/19.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "BWUICodeSnippets.h"

/*
 UI Protocol
 */
@interface BWUICodeSnippets () <UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation BWUICodeSnippets

- (void)ui_components {
    
    /*---------------------
        UIView
     ---------------------*/
    UIView *<#view#> = [[UIView alloc] init];
    <#view#>.backgroundColor = <#UIColor *#>;
    [<#superview#> addSubview:<#view#>];
    
    UIView *<#view#> = [[UIView alloc] initWithFrame:<#CGRect#>];
    <#view#>.backgroundColor = <#UIColor *#>;
    [<#superview#> addSubview:<#view#>];
    
    
    /*---------------------
        UILabel
     ---------------------*/
    UILabel *<#label#> = [[UILabel alloc] init];
    <#label#>.text = <#NSString#>;
    <#label#>.numberOfLines = <#NSInteger#>;
    <#label#>.textAlignment = <#NSTextAlignment#>;
    <#label#>.font = <#UIFont#>;
    <#label#>.textColor = <#UIColor#>;
    <#label#>.backgroundColor = <#UIColor#>;
    [<#superview#> addSubview:<#label#>];
    
    UILabel *<#label#> = [[UILabel alloc] initWithFrame:<#CGRect#>];
    <#label#>.text = <#NSString#>;
    <#label#>.numberOfLines = <#NSInteger#>;
    <#label#>.textAlignment = <#NSTextAlignment#>;
    <#label#>.font = <#UIFont#>;
    <#label#>.textColor = <#UIColor#>;
    <#label#>.backgroundColor = <#UIColor#>;
    [<#superview#> addSubview:<#label#>];
    
    
    /*---------------------
        UITextField
     ---------------------*/
    UITextField *<#textField#> = [[UITextField alloc] init];
    <#textField#>.placeholder = <#NSString#>;
    <#textField#>.text = <#NSString#>;
    <#textField#>.borderStyle = <#UITextBorderStyle#>;
    <#textField#>.textColor = <#UIColor#>;
    <#textField#>.font = <#UIFont#>;
    <#textField#>.background = <#UIImage#>;
    <#textField#>.backgroundColor = <#UIColor#>;
    [<#superview#> addSubview:<#textField#>];
    
    UITextField *<#textField#> = [[UITextField alloc] initWithFrame:<#CGRect#>];
    <#textField#>.placeholder = <#NSString#>;
    <#textField#>.text = <#NSString#>;
    <#textField#>.borderStyle = <#UITextBorderStyle#>;
    <#textField#>.textColor = <#UIColor#>;
    <#textField#>.font = <#UIFont#>;
    <#textField#>.background = <#UIImage#>;
    <#textField#>.backgroundColor = <#UIColor#>;
    [<#superview#> addSubview:<#textField#>];
    
    
    /*---------------------
        UITextView
     ---------------------*/
    UITextView *<#textView#> = [[UITextView alloc] init];
    <#textView#>.text = <#NSString#>;
    <#textView#>.textColor = <#UIColor#>;
    <#textView#>.font = <#UIFont#>;
    <#textView#>.backgroundColor = <#UIColor#>;
    [<#superview#> addSubview:<#textView#>];
    
    UITextView *<#textView#> = [[UITextView alloc] initWithFrame:<#CGRect#>];
    <#textView#>.text = <#NSString#>;
    <#textView#>.textColor = <#UIColor#>;
    <#textView#>.font = <#UIFont#>;
    <#textView#>.backgroundColor = <#UIColor#>;
    [<#superview#> addSubview:<#textView#>];
    
    
    /*---------------------
        UIButton
     ---------------------*/
    UIButton *<#button#> = [UIButton buttonWithType:<#UIButtonType#>];
    [<#button#> setTitle:<#NSString#> forState:<#UIControlState#>];
    [<#button#> setTitleColor:<#UIColor#> forState:<#UIControlState#>];
    <#button#>.titleLabel.font = <#UIFont#>;
    [<#button#> setImage:<#UIImage *#> forState:<#UIControlState#>];
    [<#button#> setBackgroundImage:<#UIImage *#> forState:<#UIControlState#>];
    <#button#>.backgroundColor = <#UIColor#>;
    [<#button#> addTarget:<#target#> action:@selector(<#buttonAct#>) forControlEvents:<#UIControlEvent#>];
    [<#superview#> addSubview:<#button#>];
    
    UIButton *<#button#> = [UIButton buttonWithType:<#UIButtonType#>];
    <#button#>.frame = <#CGRect#>;
    [<#button#> setTitle:<#NSString#> forState:<#UIControlState#>];
    [<#button#> setTitleColor:<#UIColor#> forState:<#UIControlState#>];
    <#button#>.titleLabel.font = <#UIFont#>;
    [<#button#> setImage:<#UIImage *#> forState:<#UIControlState#>];
    [<#button#> setBackgroundImage:<#UIImage *#> forState:<#UIControlState#>];
    <#button#>.backgroundColor = <#UIColor#>;
    [<#button#> addTarget:<#target#> action:@selector(<#buttonAct#>) forControlEvents:<#UIControlEvent#>];
    [<#superview#> addSubview:<#button#>];

    
    /*---------------------
        UIScrollView
     ---------------------*/
    UIScrollView *<#scrollView#> = [[UIScrollView alloc] init];
    [<#superview#> addSubview:<#scrollView#>];
    
    UIScrollView *<#scrollView#> = [[UIScrollView alloc] initWithFrame:<#(CGRect)#>];
    [<#superview#> addSubview:<#scrollView#>];
    
    
    /*---------------------
        UITableView
     ---------------------*/
    UITableView *<#tableView#> = [[UITableView alloc] initWithFrame:<#CGRect#> style:<#UITableViewStyle#>];
    tableView.dataSource = <#UITableViewDataSource#>;
    tableView.delegate = <#UITableViewDelegate#>;
    [<#superview#> addSubview:<#tableView#>];
    
    UIView *viewFooter = [[UIView alloc] initWithFrame:CGRectZero];
    viewFooter.backgroundColor = [UIColor clearColor];
    <#tableView#>.tableFooterView = viewFooter;
    
    
    /*---------------------
        UISwitch
     ---------------------*/
    UISwitch *<#mySwitch#> = [[UISwitch alloc] init];
    [<#superview#> addSubview:<#mySwitch#>];
    
    UISwitch *<#mySwitch#> = [[UISwitch alloc] initWithFrame:<#CGRect#>];
    [<#superview#> addSubview:<#mySwitch#>];
    
    
    /*---------------------
        UIProgressView
     ---------------------*/
    UIProgressView *<#progressView#> = [[UIProgressView alloc] init];
    [<#superview#> addSubview:<#progressView#>];
    
    UIProgressView *<#progressView#> = [[UIProgressView alloc] initWithFrame:<#CGRect#>];
    [<#superview#> addSubview:<#progressView#>];
    
    
    /*---------------------
        UIPickerView
     ---------------------*/
    UIPickerView *<#pickerView#> = [[UIPickerView alloc] init];
    <#pickerView#>.dataSource = <#id <UIPickerViewDataSource>#>;
    <#pickerView#>.delegate = <#id <UIPickerViewDelegate>#>;
    [<#superview#> addSubview:<#pickerView#>];
    
    UIPickerView *<#pickerView#> = [[UIPickerView alloc] initWithFrame:<#CGRect#>];
    <#pickerView#>.dataSource = <#id <UIPickerViewDataSource>#>;
    <#pickerView#>.delegate = <#id <UIPickerViewDelegate>#>;
    [<#superview#> addSubview:<#pickerView#>];
    
    
    /*---------------------
        UISlider
     ---------------------*/
    UISlider *<#slider#> = [[UISlider alloc] init];
    [<#superview#> addSubview:<#slider#>];
    
    UISlider *<#slider#> = [[UISlider alloc] initWithFrame:<#CGRect#>];
    [<#superview#> addSubview:<#slider#>];
    
    
    /*---------------------
        UIImageView
     ---------------------*/
    UIImageView *<#imageView#> = [[UIImageView alloc] initWithFrame:<#CGRect#>];
    <#imageView#>.image = UIImage;
    <#imageView#>.contentMode = UIViewContentMode;
    [<#superview#> addSubview:<#imageView#>];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:<#UIImage *#>];
    <#imageView#>.contentMode = <#UIViewContentMode#>;
    [<#superview#> addSubview:<#imageView#>];
    
    
    /*---------------------
        UIStepper
     ---------------------*/
    UIStepper *<#stepper#> = [[UIStepper alloc] init];
    [<#superview#> addSubview:<#stepper#>];
    
    UIStepper *<#stepper#> = [[UIStepper alloc] initWithFrame:<#CGRect#>];
    [<#superview#> addSubview:<#stepper#>];
    
    
    /*---------------------
        UISegmentedControl
     ---------------------*/
    UISegmentedControl *<#segmentedControl#> = [[UISegmentedControl alloc] initWithItems:<#NSArray *#>];
    [<#segmentedControl#> addTarget:<#target#> action:<#SEL#> forControlEvents:<#UIControlEvents#>];
    [<#superview#> addSubview:<#segmentedControl#>];
    
    
    /*---------------------
        UISearchBar
     ---------------------*/
    UISearchBar *<#searchBar#> = [[UISearchBar alloc] init];
    <#searchBar#>.placeholder = <#NSString#>;
    <#searchBar#>.delegate = <#id <UISearchBarDelegate>#>;
    [<#superview#> addSubview:<#searchBar#>];
    
    UISearchBar *<#searchBar#> = [[UISearchBar alloc] initWithFrame:<#CGRect#>];
    <#searchBar#>.placeholder = <#NSString#>;
    <#searchBar#>.delegate = <#id <UISearchBarDelegate>#>;
    [<#superview#> addSubview:<#searchBar#>];
    
    
    /*---------------------
        UICollectionView
     ---------------------*/
    UICollectionViewFlowLayout *<#layout#> = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *<#collectionView#> = [[UICollectionView alloc] initWithFrame:<#CGRect#> collectionViewLayout:<#layout#>];
    <#collectionView#>.dataSource = <#id <UICollectionViewDataSource>#>;
    <#collectionView#>.delegate = <#id <UICollectionViewDelegate>#>;
    [<#superview#> addSubview:<#collectionView#>];
    
    
    /*---------------------
        UIWebView
     ---------------------*/
    UIWebView *<#webView#> = [[UIWebView alloc] init];
    <#webView#>.delegate = <#id <UIWebViewDelegate>#>;
    [<#superview#> addSubview:<#webView#>];
    
    UIWebView *<#webView#> = [[UIWebView alloc] initWithFrame:<#CGRect#>];
    <#webView#>.delegate = <#id <UIWebViewDelegate>#>;
    [<#superview#> addSubview:<#webView#>];
    
    
    /*---------------------
        UIActivityIndicatorView
     ---------------------*/
    UIActivityIndicatorView *<#indicatorView#> = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:<#UIActivityIndicatorViewStyle#>];
    <#indicatorView#>.color = <#UIColor *#>;
    <#indicatorView#>.backgroundColor = <#UIColor *#>;
    [<#indicatorView#> hidesWhenStopped];
    [self.view addSubview:<#indicatorView#>];
    [<#indicatorView#> startAnimating];
    //    [<#indicatorView#> stopAnimating];
    
    
    /*---------------------
        UIAlertView
     ---------------------*/
    UIAlertView *<#alertView#> = [[UIAlertView alloc] initWithTitle:<#(nullable NSString *)#> message:<#(nullable NSString *)#> delegate:<#(nullable id)#> cancelButtonTitle:<#(nullable NSString *)#> otherButtonTitles:<#(nullable NSString *), ...#>, nil];
    [<#alertView#> show];
    
    
    /*---------------------
        UIActionSheet
     ---------------------*/
    UIActionSheet *<#actionSheet#> = [[UIActionSheet alloc] initWithTitle:<#(nullable NSString *)#> delegate:<#(nullable id<UIActionSheetDelegate>)#> cancelButtonTitle:<#(nullable NSString *)#> destructiveButtonTitle:<#(nullable NSString *)#> otherButtonTitles:<#(nullable NSString *), ...#>, nil];
    [<#actionSheet#> showInView:<#(nonnull UIView *)#>];
}

/*---------------------
     Constraints Template Code
 ---------------------*/
- (void)ui_constraints {
    
    /*---------------------
     BWMasonryEdgeTemplateCode
     ---------------------*/
    UIView *view = [[UIView alloc] init];
    [<#view#> mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(<#CGFloat#>);
        make.right.mas_equalTo(<#CGFloat#>);
        make.top.mas_equalTo(<#CGFloat#>);
        make.bottom.mas_equalTo(<#CGFloat#>);
    }];
    
    /*---------------------
     BWMasonryOriginalAndSizeTemplateCode
     ---------------------*/
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(<#CGFloat#>);
        make.width.mas_equalTo(<#CGFloat#>);
        make.top.mas_equalTo(<#CGFloat#>);
        make.height.mas_equalTo(<#CGFloat#>);
    }];
    
}

/*---------------------
    BWUIAlertViewDelegateTemplateCode
 ---------------------*/
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *titleBtn = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([titleBtn isEqualToString:<#(nonnull NSString *)#>]) {
        <#statements#>
    }
    else if ([titleBtn isEqualToString:<#(nonnull NSString *)#>]) {
        <#statements#>
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView {
    <#statements#>
}

/*---------------------
    BWUIActionSheetDelegateTemplateCode
 ---------------------*/
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *titleBtn = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([titleBtn isEqualToString:<#(nonnull NSString *)#>]) {
        <#statements#>
    }
    else if ([titleBtn isEqualToString:<#(nonnull NSString *)#>]) {
        <#statements#>
    }
}

@end
