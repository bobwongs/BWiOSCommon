//
//  BWCodeSnippetsFunctionViewController.m
//  BWiOSCommon
//
//  Created by BobWong on 16/12/30.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BWCodeSnippetsFunctionViewController.h"

/*
 Protocol
 
 BWProtocolImagePickerTemplate
 */
@interface BWCodeSnippetsFunctionViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation BWCodeSnippetsFunctionViewController

- (void)navigationController {
    
    // ---------- BWUINavigationControllerPushVCTemplateCode ----------
    <#UIViewController#> *vc<#ViewControllerName#> = [<#UIViewController#> new];
    [self.navigationController pushViewController:vc<#ViewControllerName#> animated:YES];
    
}

// ----------------------选择一张照片----------------------
- (void)selectOnePhoto {
    
    UIImagePickerController *vcPicker = [[UIImagePickerController alloc] init];
    vcPicker.delegate = self;
    if (buttonIndex == 0) {
        // 相机
        if (![UIDevice bw_haveCamera]) {
            [SVProgressHUD showInfoWithStatus:@"设备没有相机，无法启动拍照功能" maskType:SVProgressHUDMaskTypeBlack];
            return;
        }
        if (![UIApplication bw_haveCameraPower]) {
            [SVProgressHUD showInfoWithStatus:@"请在设备的\"设置-隐私-相机\"中允许访问相机" maskType:SVProgressHUDMaskTypeBlack];
            return;
        }
        
        vcPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:vcPicker animated:YES completion:nil];
    }
    else if (buttonIndex == 1){
        // 相册
        if (![UIApplication bw_haveAlbumPower]) {
            [SVProgressHUD showInfoWithStatus:@"请在设备的\"设置-隐私-照片\"中允许访问照片" maskType:SVProgressHUDMaskTypeBlack];
            return;
        }
        
        vcPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:vcPicker animated:YES completion:nil];
    }
    else if (buttonIndex == 2 && self.ivPhoto.image && _pathUploadedImg) {
        // 预览
        [BMImageViewBrowseView showImageViewBrowseViewWithImage:self.ivPhoto.image];
    }

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *imageSelected = info[UIImagePickerControllerOriginalImage];
    _ivPhoto.image = imageSelected;  // 图片
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

// ----------------------选择一张照片----------------------

// 定位
- (void)location {
    
    
    
}

// 通讯录
- (void)addressBook {
    
    
    
}

- (void)systemAlert {
    // ---------- BWAlertSystemTemplate ----------
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:<#Title#> message:<#Message#> preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"<#确定#>" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                                <#Confirm Action#>
                                }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"<#取消#>" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)pageListTableViewConfiguration {
    /* ---------- BWTableViewPageListSettingTemplate ---------- */
    self.tableView.rowHeight = <#CGFloat#>;
    self.tableView.sectionHeaderHeight = <#CGFloat#>;
    self.tableView.backgroundColor = <#UIColor *#>;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([<#Cell#> class]) bundle:nil] forCellReuseIdentifier:<#CellId#>];
    
    // 下拉刷新
    @weakify(self);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        
        [self.tableView.mj_header beginRefreshing];
        [self loadDataWithLoading:NO];
    }];
    // 上拉加载
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        
        [self.tableView.mj_footer beginRefreshing];
        [self loadNextPage];
    }];
    self.tableView.mj_footer.automaticallyHidden = YES;
    /* ---------- BWTableViewPageListSettingTemplate ---------- */
}

@end
