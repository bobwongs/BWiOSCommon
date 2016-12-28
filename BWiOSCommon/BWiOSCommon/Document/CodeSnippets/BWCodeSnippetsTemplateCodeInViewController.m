//
//  BBWCodeSnippetsTemplateCodeInViewController.m
//  BWCodeSnippets
//
//  Created by BobWong on 16/8/19.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "BWCodeSnippetsTemplateCodeInViewController.h"

/*
 Protocol Code Snippets
 */
@interface BWCodeSnippetsController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation BWCodeSnippetsController


#pragma mark - View Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = <#NSString *#>;
    
    [self setData];
    [self setNavigationBar];
    [self setUI];
    [self setConstraints];
    [self loadData];
}

#pragma mark - Public Method

#pragma mark - Action

- (void)buttonAction:(id)sender
{
    
}

#pragma mark - Network

#pragma mark - Custom Delegate

#pragma mark - System Delegate

#pragma mark - Private Method

- (void)setData
{
    
}

/*----------------------------------------------------------
 BWSetNavigationBarTemplate
 ---------------------------------------------------------*/
- (void)setNavigationBar {
    <#Set Custom View#>
    
    UIBarButtonItem *<#item#> = [[UIBarButtonItem alloc] initWithCustomView:<#(nonnull UIView *)#>];
    self.navigationItem.<#leftOrRightBarButtonItem#> = <#item#>;
}

- (void)setUI
{
    
}

- (void)setConstraints
{
    
}

/*----------------------------------------------------------
 BWLoadData
 ---------------------------------------------------------*/
- (void)loadData
{
    <#Set Loading#>
    
    // ---------- BWSetNetworkParametersTemplate ----------
    NSDictionary *params = @{
                             @"<#key#>": <#value#>,
                             @"<#key#>": <#value#>
                             };
    <#Networking#>
}

#pragma mark - Getter and Setter


/*-------------------------------------------------------------------*/


/*----------------------------------------------------------
    BWUITableViewDataSourceAndDelegateTemplateCode
 ---------------------------------------------------------*/

#pragma mark - UITableView DataSource and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return <#NSInteger#>;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return <#_dataSource#> ? <#_dataSource#>.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *<#cellId#> = <#@"Cell"#>;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#cellId#>];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:<#UITableViewCellStyle#> reuseIdentifier:<#cellId#>];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return <#CGFloat#>;
}

/*-------------------------------------------------------------------*/

@end
