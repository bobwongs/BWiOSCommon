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
 
 BWProtocolTableViewDataSourceAndDelegate
 */
@interface BWCodeSnippetsController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation BWCodeSnippetsController

#pragma mark - View Cycle

- (void)viewDidLoad
{
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

/*----------------------------------------------------------
 BWButtonActionTemplate
 ---------------------------------------------------------*/
- (void)btn<#ActionName#>Act:(UIButton *)sender
{
    <#Code#>
}

/*----------------------------------------------------------
 BWGestureActionTemplate
 ---------------------------------------------------------*/
- (void)gesture<#GestureName#>:(<#GestureRecognizer#> *)gestureRecognizer
{
    <#Code#>
}

#pragma mark - Network

#pragma mark - Custom Delegate

#pragma mark - System Delegate

/*----------------------------------------------------------
 BWTableViewDataSourceAndDelegateTemplateCode
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
    <#TableViewCell#> *cell = [tableView dequeueReusableCellWithIdentifier:<#CellId#>];
    <#Model#> *<#model#> = <#_dataSource[indexPath.row]#>;
    
    return cell;
}

#pragma mark - Private Method

/*----------------------------------------------------------
 BWSetDataTemplateCode
 ---------------------------------------------------------*/
- (void)setData
{
    <#Code#>
}

/*----------------------------------------------------------
 BWSetNavigationBarTemplate
 ---------------------------------------------------------*/
- (void)setNavigationBar
{
    <#Set Custom View#>
    
    UIBarButtonItem *<#item#> = [[UIBarButtonItem alloc] initWithCustomView:<#(nonnull UIView *)#>];
    self.navigationItem.<#leftOrRightBarButtonItem#> = <#item#>;
}

/*----------------------------------------------------------
 BWSetUITemplateCode
 ---------------------------------------------------------*/
- (void)setUI
{
    <#Code#>
}

/*----------------------------------------------------------
 BWSetConstraintsTemplateCode
 ---------------------------------------------------------*/
- (void)setConstraints
{
    <#Code#>
}

/*----------------------------------------------------------
 BWLoadDataTemplate
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

/*----------------------------------------------------------
 BWSetUIDataWithModelTemplateCode
 ---------------------------------------------------------*/
- (void)setUIDataWithModel:(<#Model#> *)model
{
    <#Code#>
}

/*----------------------------------------------------------
 BWReloadDataTemplateCode
 ---------------------------------------------------------*/
- (void)reloadData
{
    <#Code#>
}

#pragma mark - Getter and Setter

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(<#x#>, <#y#>, <#width#>, <#height#>) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = <#UITableViewCellSeparatorStyle#>;
        _tableView.backgroundColor = <#UIColor *#>;
        _tableView.estimatedRowHeight = <#CGFloat#>;
        [_tableView registerClass:[<#TableViewCell#> class] forCellReuseIdentifier:<#CellId#>];
        
        // 下拉刷新
        @weakify(self);
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            @strongify(self);
            
            [self.tableView.mj_header beginRefreshing];
            [self reloadListData];
        }];
        // 上拉加载
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            @strongify(self);
            
            [self.tableView.mj_footer beginRefreshing];
            [self loadNextPage];
        }];
        _tableView.mj_footer.automaticallyHidden = YES;
    }
    return _tableView;
}

@end
