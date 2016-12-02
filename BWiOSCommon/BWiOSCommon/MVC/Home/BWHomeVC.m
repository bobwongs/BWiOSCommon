//
//  BWHomeVC.m
//  BWiOSCommon
//
//  Created by BobWong on 16/11/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BWHomeVC.h"

@interface BWHomeVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation BWHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Home";
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
