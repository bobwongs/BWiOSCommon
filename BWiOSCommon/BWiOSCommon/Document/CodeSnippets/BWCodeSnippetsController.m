//
//  BWCodeSnippetsController.m
//  BWCodeSnippets
//
//  Created by BobWong on 16/8/19.
//  Copyright © 2016年 Bob Wong Studio. All rights reserved.
//

#import "BWCodeSnippetsController.h"

@interface BWCodeSnippetsController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation BWCodeSnippetsController

/*--------------------------------------
    BWUIViewControllerTemplateCode
--------------------------------------*/

#pragma mark - Life Cycle

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setData];
    [self setUI];
    [self setConstraints];
    [self loadData];
}

#pragma mark - Action

- (void)buttonAction:(id)sender
{
    
}

#pragma mark - Public Method

#pragma mark - Private Method

- (void)setData
{
    
}

- (void)setUI
{
    
}

- (void)setConstraints
{
    
}

- (void)loadData
{
    
}

#pragma mark - Network

#pragma mark - System Delegate

#pragma mark - Custom Delegate

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
