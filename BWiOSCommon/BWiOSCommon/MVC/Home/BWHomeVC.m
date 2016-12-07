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
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 50)];
    label.text = @"你有 0.00 块钱";
    label.numberOfLines = 1;
    [label bm_setAttributeLabelWithText:@"你有 0.00 块钱" formatText:@"0.00" font:[UIFont systemFontOfSize:25.0] textColor:[UIColor blueColor]];
    [self.view addSubview:label];
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
