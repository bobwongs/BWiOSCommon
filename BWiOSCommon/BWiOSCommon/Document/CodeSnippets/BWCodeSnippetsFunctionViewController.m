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

@end
