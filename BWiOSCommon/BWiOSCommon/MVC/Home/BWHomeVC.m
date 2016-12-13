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
    
    UITextField *tf = [UITextField bw_textFieldBorderStyleNoneClearButtonModeWhileEditingWithPlaceholder:@"请输入" holderColor:[UIColor blueColor] holderFont:[UIFont systemFontOfSize:12.0] textColor:[UIColor blackColor] textFont:[UIFont systemFontOfSize:12.0]];
    tf.backgroundColor = [UIColor greenColor];
    [self.view addSubview:tf];
    
    [tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(200);
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    return ;
    
//    NSString *text = @"你有 0.00 块钱";
//    NSString *textChange = @"0.00";
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 50)];
//    label.text = text;
//    label.numberOfLines = 1;
//    [label bm_setAttributeLabelWithText:@"你有 0.00 块钱" formatText:textChange font:[UIFont systemFontOfSize:25.0] textColor:[UIColor blueColor]];
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
